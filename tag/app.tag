<app>
    <div class="panel panel-default">
        <div class="panel-body">
            <form>
            <div class="form-group">
                <label for="cardInput">Add Card</label>
                <input id="cardInput" ref="newCard" type="text" placeholder="Add Card"/>
            </div>
            <input type="button" onclick="{addCard}" value="Add Card">
            </form>
        </div>
    </div>

    <h5 hide="{cards.length === 0}" >Delete</h5>
    <ul>
        <li each={cards } onclick="{deleteCard}" style="cursor: pointer">
            { name }
        </li>
    </ul>

    <div ref="cardContainer">
        <card each={card in cards} card="{card}" store={parent.store}></card>
    </div>


    <script>
        this.cards = [];
        this.counter = 1;
        this.store = this.opts.store;

        this.store.on('UPDATE_VIEW', (state) => this.update({cards : state}));


        addCard() {
            Actions.addCard(this.refs.newCard.value, this.counter);
            this.refs.newCard.value = null;
            this.counter++;
        }

        deleteCard(e) {
            Actions.removeCard(e.item.id);
        }

    </script>

</app>

<card>

    <div class="panel panel-default">
        <div class="panel-heading">
            {name} ({id})
            <input hide="{enable}" type="button" value="Enable" onclick="{toEnable}">
            <input show="{enable}" type="button" value="Disable" onclick="{disable}">

        </div>
        <div show="{enable}" class="panel-body">

            <div show="{enable}">
                <div>
                    <viewCard cardid={id} show="{state === 'VIEW'}"></viewCard>
                    <modifyCard cardid={id} show="{state === 'MODIFY'}"></modifyCard>
                </div>
            </div>
        </div>
    </div>

    <script>
        let card = this.opts.card;
        this.name = card.name;
        this.id = card.id;
        this.enable = card.enable;
        this.state = card.state;

        this.store = this.opts.store;

        this.store.on('UPDATE_VIEW', (state) => {
            let card = state.filter(card => card.id === this.id)[0];

            if (card) {
                this.update({
                    name : card.name,
                    id : card.id,
                    enable : card.enable,
                    state: card.state
                })
            }

        });

        toEnable(e) {
            Actions.enable(this.id, true);
        }

        disable(e) {
            Actions.enable(this.id, false);
        }

    </script>
</card>

<viewCard>
    <h5>View</h5>
    <input type="button" value="Modify" onclick="{modify}"/>

    <script>

        this.id = this.opts.cardid;

        modify(e) {
            Actions.changeState(this.id, 'MODIFY');
        }

    </script>
</viewCard>

<modifyCard>
    <h5>Modify</h5>
    <input type="button" value="Save"  onclick="{save}"/>

    <script>

        this.id = this.opts.cardid;
        console.log(this.id);

        save(e) {
            Actions.changeState(this.id, 'VIEW');
        }

    </script>


</modifyCard>



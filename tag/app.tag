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

    <hr/>

    <div ref="cardContainer">
        <card each={cards} name="{name}" id="{id}"></card>
    </div>


    <script>

        this.cards = [];
        this.counter = 1;


        addCard() {
            this.cards.push({name: this.refs.newCard.value, id: this.counter});
            this.refs.newCard.value = null;
            this.counter++;
        }

        deleteCard(e) {
            let cardId = e.item.id;
            let index = this.cards.findIndex(card => card.id === cardId);
            this.cards.splice(index, 1);
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
                    <viewCard show="{state === 'VIEW'}"></viewCard>
                    <modifyCard show="{state === 'MODIFY'}"></modifyCard>
                </div>
            </div>
        </div>
    </div>

    <script>
        this.name = this.opts.name;
        this.id = this.opts.id;
        this.state = 'VIEW';

        toEnable(e) {
            this.enable = true;
        }

        disable(e) {
            this.enable = false;
        }

    </script>
</card>

<viewCard>
    <h5>View</h5>
    <input type="button" value="Modify" onclick="{modify}"/>

    <script>

        modify(e) {
            this.parent.state = 'MODIFY';
            this.parent.update();
        }

    </script>
</viewCard>

<modifyCard>
    <h5>Modify</h5>
    <input type="button" value="Save"  onclick="{save}"/>

    <script>

        save(e) {
            this.parent.state = 'VIEW';
            this.parent.update();
        }

    </script>


</modifyCard>



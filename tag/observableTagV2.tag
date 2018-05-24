<observableTagV2>
    <h3>{ message }</h3>
    <ul>
        <li each={ techs } onclick="{showSomething}">
            { name }
        </li>
    </ul>


    <!-- TODO send the tech name -->


    <script>
        // refs
        var self = this;

        var EventBus = function(){
            riot.observable(this)
        };

        var eventBus = new EventBus();

        this.obs = eventBus;

        this.message = 'Hello, Riot!';
        this.techs = this.opts.items;

        showSomething (e) {
            self.obs.trigger('hello', 'Hello from Riot');
        }
    </script>

</observableTagV2>
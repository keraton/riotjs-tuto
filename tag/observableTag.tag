<observableTag>
    <h3>{ message }</h3>
    <ul>
        <li each={ techs } onclick="{showSomething}">
            { name }
        </li>
    </ul>


    <!-- TODO send the tech name -->


    <script>
        // refs
        this.message = 'Hello, Riot!';
        this.techs = this.opts.items;

        showSomething (e) {
            this.opts.obs.trigger('hello', 'Hello from Riot');
        }
    </script>

</observableTag>
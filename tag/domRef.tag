<domRef>
    <h3>{ message }</h3>
    <ul>
        <li each={ techs } onclick="{showSomething}">
            { name }
        </li>
    </ul>

    <input type="text" ref="show"></input>

    <!-- TODO show the tech name in the show part -->


    <script>
        // refs
        var self = this;

        this.message = 'Hello, Riot!'
        this.techs = this.opts.items;

        showSomething (e) {
            self.refs.show.value = "Clicked";
        }
    </script>

</domRef>
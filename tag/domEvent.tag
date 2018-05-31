<domEvent>
    <h3>Dom Event</h3>
    <ul>
        <li each={ techs } onclick="{showSomething}">
            { name }
        </li>
    </ul>

    <!-- TODO show the tech name -->


    <script>
        this.message = 'Hello, Riot!'
        this.techs = this.opts.items;

        showSomething (e) {
            alert("hello " + e);
        }
    </script>

</domEvent>
<conditional>
    <h3>If</h3>
    <ul>
        <li each={ techs } hide={ odd }>
            { name }
        </li>
    </ul>

    <!-- TODO test with show and hide -->


    <script>
        this.message = 'Hello, Riot!'
        this.techs = this.opts.items;
    </script>

</conditional>
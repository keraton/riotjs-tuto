<sampleOpts>
    <h3>{ message }</h3>
    <ul>
        {description}
        <li each={ techs }>{ name }</li>
    </ul>

    <!-- TODO Add Message as an argument -->

    <script>
        this.message = this.opts.name;
        this.description = this.opts.name;
        this.techs = this.opts.items;
    </script>

</sampleOpts>
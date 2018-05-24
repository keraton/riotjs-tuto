<sample>
    <h3>{ message }</h3>
    <ul>
        <li each={ techs }>{ name }</li>
    </ul>

    <!-- TODO Add a description -->

    <script>
        this.message = 'Hello, Riot!'
        this.techs = [
            { name: 'HTML' },
            { name: 'JavaScript' },
            { name: 'CSS' }
        ]
    </script>

</sample>
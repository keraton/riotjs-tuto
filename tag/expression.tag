<expression>
    <h3>{ message.toUpperCase() }</h3>
     <p>Size of techs array : {techs.length} </p>
    <ul>
        <li each={ techs }>{ name }</li>
    </ul>

    <!-- TODO Size of the tech items -->

    <script>
        this.message = 'Hello, Riot!'
        this.techs = [
            { name: 'HTML' },
            { name: 'JavaScript' },
            { name: 'CSS' }
        ]
    </script>

</expression>
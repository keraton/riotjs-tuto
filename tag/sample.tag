<sample>
    <h3>{ message }</h3>

    <p>{ description }</p>

    <ul>
        <li each={ techs }>{ name }</li>
    </ul>


    <script>
        this.message = 'Hello, Riot!';
        this.techs = [
            { name: 'HTML' },
            { name: 'JavaScript' },
            { name: 'CSS' }
        ];
        this.description = "Riot rules !!!";

    </script>

</sample>
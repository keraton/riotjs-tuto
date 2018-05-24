<loopSimpleValue>
    <h3>Cities</h3>
    <ul>
        <li each={ city in cities }>
            {city}
        </li>
    </ul>


    <script>
        this.cities = this.opts;
    </script>

</loopSimpleValue>
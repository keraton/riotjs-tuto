<cssStyle>
    <h3>Inside Tag</h3>
    <ul>
        <li each={ city in cities }>
            {city}
        </li>
    </ul>

    <style>
        h3 {
            font-family: Arial;
            font-size: 3em;
        }
    </style>

    <script>
        this.cities = this.opts;
    </script>

</cssStyle>
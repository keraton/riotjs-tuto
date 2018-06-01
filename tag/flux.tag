<todo>
    <h3>TODO List</h3>
    <ul>
        <li each={ todos }>
            { name }
        </li>
    </ul>


    <div>
        <input ref="newTodo" type="text" placeholder="Add Todo"/>
        <input type="button" onclick="{addTodo}" value="Add Todo">
    </div>


    <script>
        this.opts.store.on("UPDATE_VIEW", (state) => this.update({todos : state}));

        // Action
        addTodo() {
            Actions.addTodo(this.refs.newTodo.value);
        }

    </script>

</todo>

<anotherTodo>
    <h3>ANOTHER TODO List</h3>
    <ul>
        <li each={ todos }>
            { name }
        </li>
    </ul>


    <div>
        <input ref="newTodo" type="text" placeholder="Add Todo"/>
        <input type="button" onclick="{addTodo}" value="Add Todo">
    </div>


    <script>
        this.opts.store.on("UPDATE_VIEW", (state) => this.update({todos : state}));

        // Action
        addTodo() {
            Actions.addTodo(this.refs.newTodo.value);
        }

    </script>


</anotherTodo>
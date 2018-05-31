<todo>
    <h3>TODO List</h3>
    <ul>
        <li each={ todos }>
            { name }
        </li>
    </ul>


    <div>
        <input ref="newTodo" type="text" placeholder="Add Todo"/> <input type="button" onclick="{addTodo}">
    </div>


    <script>
        let self = this;
        this.todos = [];
        this.store = this.opts.store;

        this.store.on("UPDATE_VIEW", function (state) {
            self.todos = state;
            self.update();
        });

        this.on('mount', function() {
            Actions.initTodo();
        });

        // Action
        addTodo() {
            Actions.addTodo(this.refs.newTodo.value);
        }

    </script>

</todo>
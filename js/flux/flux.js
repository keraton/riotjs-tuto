// Flux pattern
// [Action] -> [Dispatcher] -> [Store] -> [View]


// Dispatcher
var RiotControl = {
    _stores: [],
    addStore: function(store) {
        this._stores.push(store);
    }
};

['on','one','off','trigger'].forEach(function(api){
    RiotControl[api] = function() {
        var args = [].slice.call(arguments);
        this._stores.forEach(function(el){
            el[api].apply(el, args);
        });
    };
});

// Actions Creator
var Actions =  {

    addTodo : function (todo) {
        RiotControl.trigger('ADD_TODO', todo);
    },

    initTodo : function () {
        RiotControl.trigger('INIT_TODO');
    }
};


// Store
var TodoStore = function () {

    // Make this class observable
    riot.observable(this);

    //
    var self = this;
    function updateView() {
        self.trigger("UPDATE_VIEW", state);
    }

    // Initial state is empty
    var state = [
        { name: 'Learn HTML' },
        { name: 'Learn JavaScript' },
        { name: 'Learn CSS' }
    ];

    // State Reducer
    this.on('ADD_TODO', function(todo) {
        // No immutability
        state.push({
            name : todo
        });
        updateView();
    });

    this.on('INIT_TODO', function() {
        updateView();
    });

};

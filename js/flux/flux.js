// Flux pattern
// [Action] -> [Dispatcher] -> [Store] -> [View]

// Actions Creator
let Actions =  {

    addTodo : function (todo) {
        Riux.trigger('ADD_TODO' , todo);
    },

    initTodo : function () {
        Riux.trigger('INIT_TODO');
    },

    addCard : function (name, id) {
        Riux.trigger('ADD_CARD',
            {  name: name,
                id: id,
                enable: false,
                state : 'MODIFY'
            })
    },

    initCards : function() {
        Riux.trigger('INIT_CARD');
    },

    removeCard : function(id) {
        Riux.trigger('REMOVE_CARD', id);
    },

    enable : function(id, value) {
        Riux.trigger('ENABLE_CARD', {id : id, enable: value});
    },

    changeState : function(id, value) {
        Riux.trigger('CHANGE_STATE_CARD', {id : id, state: value});
    },
};


// Dispatcher
let Riux = {
    _stores: [],
    observable: function(store) {

        riot.observable(store);

        this._stores.push(store);

        let state = null;

        // State Reducer
        store.on('ACTION', function(actionType, value) {
            let newState = store.reducer(state, actionType, value);

            store.trigger("UPDATE_VIEW", newState);

            console.log(JSON.stringify(state));

            state = newState;
        });

    },

    trigger: function() {
        let args = [].slice.call(arguments);
        this._stores.forEach(function(el){
            console.log("store");
            el.trigger.apply(el, ['ACTION', ...args]);
        });
    }
};


// Todo Store
let TodoStore = function () {

    // make store observable
    Riux.observable(this);

    this.reducer = function(initState, actionType, value) {
        // Switch
        switch (actionType) {
            case 'INIT_TODO' :
                return  [
                    { name: 'Learn HTML' },
                    { name: 'Learn JavaScript' },
                    { name: 'Learn CSS' }
                ];
            case 'ADD_TODO' :
                return  [ ...initState, {name : value}];
            default:
                return initState;
        }
    };

};

// Todo Store
let AccountStore = function () {

    // make store observable
    Riux.observable(this);

    this.reducer = function(initState, actionType, value) {
        // Switch
        switch (actionType) {
            case 'INIT_CARD' :
                return [];
            case 'ADD_CARD' :
                if (initState.length === 0)
                    return [value];
                else
                    return  [ ...initState, value];
            case 'REMOVE_CARD' :
                return initState.filter(card => card.id !== value);
            case 'ENABLE_CARD' :
                initState.filter(card => card.id === value.id)[0].enable = value.enable;
                return initState;
            case 'CHANGE_STATE_CARD' :
                initState.filter(card => card.id === value.id)[0].state = value.state;
                return initState;
            default:
                return initState;
        }
    };

};

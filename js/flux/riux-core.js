// Flux pattern
// [Action] -> [Dispatcher] -> [Store] -> [View]

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
            if (Riux.debug) {
                console.log(JSON.stringify(newState));
            }
            state = newState;
        });

    },

    trigger: function() {
        let args = [].slice.call(arguments);
        this._stores.forEach(function(el){
            el.trigger.apply(el, ['ACTION', ...args]);
        });
    }
};

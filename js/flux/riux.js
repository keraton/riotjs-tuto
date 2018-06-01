// Actions Creator
let Actions =  {

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

    modifyCard : function(id, value, url) {
        Riux.trigger('MODIFY_CARD', {id : id, state: value, url: url});
    },
};

let StateHelper = {
    findCardById: function(state, id) {
        return state.filter(card => card.id === id)[0];
    }
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
                StateHelper.findCardById(initState, value.id).enable = value.enable;
                return initState;
            case 'CHANGE_STATE_CARD' :
                StateHelper.findCardById(initState, value.id).state = value.state;
                return initState;
            case 'MODIFY_CARD' :
                let card = StateHelper.findCardById(initState, value.id);
                card.url = value.url;
                card.state = value.state;
                return initState;
            default:
                return initState;
        }
    };

};

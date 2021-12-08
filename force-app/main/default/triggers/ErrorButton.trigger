trigger ErrorButton on Opportunity (before insert) {
    for(Opportunity opp : Trigger.new) {
        opp.addError('Error <button>Ok</button>');
    }
}
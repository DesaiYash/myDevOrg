({
    setSesstionValue : function(component, event, helper) {
        let action = component.get("c.setSessionValueFor");
        action.setCallback(this, function(result){
            const STATE = result.getState();
            alert(STATE);
            if(STATE == "SUCCESS") {
                alert("Value set");
                let evt = $A.get("e.force:navigateToComponent");
                evt.setParams({
                    componentDef : "c:CaseComment"
                });
                evt.fire();
            }
        });
        $A.enqueueAction(action);
    },
    
    getSesstionValue : function(component, event, helper) {
        let action = component.get("c.getSessionValueFor");
        action.setCallback(this, function(result){
            const STATE = result.getState();
            if(STATE == "SUCCESS") {
                alert("Value : "+result.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})
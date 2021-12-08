({
	handleClick : function(component, event, helper) {
        //
        let action = component.get("c.getAllQiuckText");
        action.setParams({
            itemId : component.get("v.recordId"),
            objectAPIName : component.get("v.sObjectAPIName")
        });
        
        action.setCallback(this, function(response){
           const STATE = response.getState();
            if(STATE == 'SUCCESS') {
                let result = response.getReturnValue();
                component.set("v.isOpen", true);
                component.set("v.quickTextList", result);                
            }
        });
        
        $A.enqueueAction(action);
	},
    
    closeModel: function(component, event, helper) {
    	component.set("v.isOpen", false);
    },
    
    handleLink: function(component, event, helper) {
        component.set("v.isOpen", false);
        let quickTextEvent = component.getEvent("quickTextClicked");
        quickTextEvent.setParams({
            quickText : event.getSource().get("v.value")
        });
        quickTextEvent.fire();
    }
    
    
})
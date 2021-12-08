({
    init : function(component, event, helper) {
        let action = component.get("c.getProfileName");
        action.setCallback(this, function(result) {
            const STATE = result.getState();
            if(STATE == "SUCCESS") {
                if(result.getReturnValue()) {
                	component.set("v.isSystemAdmin", "2");
                }
                else {
                    component.set("v.isSystemAdmin", "1");
                }
            }
        });
        $A.enqueueAction(action);
    },
    
    updateAccount : function(component, event, helper) {
        let action = component.get("c.updateAccountForOracle");
        action.setParams({
            accountId : component.get("v.recordId")
        });
        action.setCallback(this, function(result) {
            const STATE = result.getState();
            if(STATE == "SUCCESS") {
                let typeL = "success";
                let msg = "";
                let titleL = "Success!";
                if(result.getReturnValue()) {
                    msg = "Request is sent to oracle for account creation";
                    $A.get("e.force:closeQuickAction").fire();
                    $A.get("e.force:refreshView").fire();                    
                }
                else {
                    msg = "There is some error please contact to your admin";
                    typeL = "error";
                    titleL = "Error!";
                }
                let toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": titleL,
                    "type": typeL,
                    "message": msg
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
    }
})
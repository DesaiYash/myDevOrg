({
	doInit : function(component, event, helper) {
        component.set('v.title','Accounts!');
        var action = component.get("c.getAllAccount");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
            	component.set('v.Accounts',JSON.parse(response.getReturnValue()));
            }
        });
        $A.enqueueAction(action);
	}
})
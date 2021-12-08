({
	searchAccount : function(component, event, helper) {
        var action = component.get("c.getAccountList");
        action.setParams({ sName : component.get('v.searchText') });
        action.setCallback(this, function(response) {
        	var state = response.getState();
            if (state === "SUCCESS") {
            	component.set('v.accList', response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        helper.callItFun(component, event);
	}
})
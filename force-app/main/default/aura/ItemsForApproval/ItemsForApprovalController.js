({
	doInit : function(component, event, helper) {
        var action = component.get("c.fetchPendingApprovals");
        action.setParams({
            
        });
        action.setCallback (this, function (response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                var pIList = response.getReturnValue();
                console.log(pIList);
                //if(pIList)
                component.set("v.processInstanceList", pIList);
                
            }
        });
        $A.enqueueAction(action);
	},
    
    openRecordDetail : function(component, event, helper){
        var ctarget = event.currentTarget;
        var recID = ctarget.dataset.value;
        console.log(recID);
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": recID
            
        });
        
        navEvt.fire();
    },
})
({
    createRecord : function(component) {
        var action = component.get("c.createVehicleRecord");
        action.setCallback(this, function(response){
            const STATUS = response.getState();
            if(STATUS == "SUCCESS") {
                // doing my stuff here
                component.set("v.refreshTimestamp" , Date.now() );
                //$A.get('e.force:refreshView').fire();
            }
            else {
                alert("Error");
            }
        });
        $A.enqueueAction(action);
        
    }
})
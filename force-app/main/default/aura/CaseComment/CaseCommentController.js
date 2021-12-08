({
	createCaseComment : function(component, event, helper) {
		var vBody = component.get("v.bodyData");
        var vPublished = component.get("v.published");
        //component.set("v.Spinner", true);
        console.log("#######    "+vBody + "     "+vPublished);
        $A.get("e.force:refreshView").fire();
	},
    
    setMsg: function(component, event, helper) {
        component.set("v.bodyData", event.getParam("quickText"));
    }
})
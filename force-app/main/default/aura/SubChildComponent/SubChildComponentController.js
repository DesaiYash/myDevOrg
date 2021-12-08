({
	clickHandle : function(component, event, helper) {
        alert("click");
		var cmpEvent = component.getEvent("compEvent");
        cmpEvent.fire();
	}
})
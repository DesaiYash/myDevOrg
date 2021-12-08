({
	packItem : function(component, event, helper) {
        var checkboxObj = component.find("checkbox");
		checkboxObj.set("v.value", "checked");
        var button = event.getSource();
        button.set("v.disabled",true);
	}
})
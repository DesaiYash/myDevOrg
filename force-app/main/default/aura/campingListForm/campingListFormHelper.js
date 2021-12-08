({
	createItem: function(component, event) {
        var validExpense = component.find('campaignform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validExpense){
            // Create the new expense
            var newItem = component.get("v.newItem");
            //newItem = JSON.parse(JSON.stringify(newItem));
            console.log("Create expense: " + JSON.stringify(newItem));
            var updateEvent = component.getEvent("addItem");
            updateEvent.setParams({ "item": newItem });
            updateEvent.fire();
			component.set("v.newItem","{'sObjectType':'Camping_Item__c','Name':'','Packed__c':'false','Price__c':'0','Quantity__c':'0'}");            
        }
    }
})
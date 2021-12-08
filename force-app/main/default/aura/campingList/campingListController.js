({
    doInit: function(component, event, helper) {
        var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                //var items = component.get("v.items");
                //items.push(response.getReturnValue());
                component.set("v.items", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
	handleAddItem: function(component, event, helper) { 
		//helper.createItem(component, event);
		//console.log("save...."+component.get("v.newItem"));
        var updatedItem = event.getParam("item");
		var action = component.get("c.saveItem");
        action.setParams({
            "cmp": JSON.parse(JSON.stringify(updatedItem))
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var theItems = component.get("v.items");
     
                // Copy the expense to a new object
                // THIS IS A DISGUSTING, TEMPORARY HACK
                var newItems = JSON.parse(JSON.stringify(updatedItem));
         
                theItems.push(newItems);
                component.set("v.items", theItems);
                //component.set("v.newItem","{'sObjectType':'Camping_Item__c','Name':'','Packed__c':'false','Price__c':'0','Quantity__c':'0'}");
            }
        });
        $A.enqueueAction(action);        
    }
})
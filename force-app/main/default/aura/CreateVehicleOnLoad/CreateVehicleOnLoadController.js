({
    doInit : function(component, event, helper) {
        var lastRefresh = component.get("v.refreshTimestamp");
        var currentTime = Date.now();
        if( currentTime - lastRefresh > 3000 ) {
            helper.createRecord(component);
        }		
    }
})
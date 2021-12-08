({
    doInit : function(component, event, helper) {		                
        helper.getDataHelper(component, component.get('v.sortedBy'), component.get('v.sortedDirection'));
    },
    updateColumnSorting: function (cmp, event, helper) {
        console.log("SUCCESS2");
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        cmp.set("v.sortedBy", fieldName);
        helper.getDataHelper(cmp, fieldName, sortDirection);
    }
})
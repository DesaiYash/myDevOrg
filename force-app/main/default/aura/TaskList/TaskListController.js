({
	fetchTaskList : function(component, event, helper) {
        var pick = component.find("filterByList").get("v.value");
    	console.log(pick);
		helper.fetchInitRecords(component, '', true);
	},
    //Calling helper class rendering of pages for pagination
    renderPage: function(component, event, helper) {
        helper.renderPage(component);
    },
    SortBySubject : function(component, event, helper){
        helper.fetchInitRecords(component, 'Subject', true);
    },
    SortByStatus : function(component, event, helper){
        helper.fetchInitRecords(component, 'Status', true);
    },
    SortByPriority : function(component, event, helper){
        helper.fetchInitRecords(component, 'Priority', true);
    },
    filterBy : function(component, event, helper) {
        var pick = component.find("filterByList").get("v.value");
    	console.log(pick);
        helper.fetchInitRecords(component, '', pick);
    },
    redirectToDetail: function(component, event, helper) { 
        var recId = event.target.getAttribute("data-objId");
        var sObjectEvent = $A.get("e.force:navigateToSObject");
        sObjectEvent.setParams({
            "recordId": recId,
            "slideDevName": 'detail',
            'isredirect': true
        })
        sObjectEvent.fire();
    }
    
})
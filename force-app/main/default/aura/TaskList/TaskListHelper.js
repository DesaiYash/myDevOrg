({
	renderPage: function(component) {
        //Get all the records
        var records = component.get("v.taskList");
        //Set the current page number
        var pageNumber = component.get("v.pageNumber");
        //Showing 10 records on a page
        var pageRecords = records.slice((pageNumber-1)*10, pageNumber*10);
        //Storing the records in another list
        component.set("v.taskListTemp", pageRecords);
    },
    
    fetchInitRecords: function(component, sortBy, ownedBy) {
        var action = component.get("c.fetchTask");
        action.setParams({
            "sortBy" : sortBy,
            "ownedBy" : ownedBy,
            "sortAsc": component.get("v.sortAsc")
        });
        component.set("v.Spinner", true);
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.taskList", response.getReturnValue());
                component.set("v.totalNumberOfRecords", response.getReturnValue().length);
                component.set("v.isPaginationVisible",true);
                //Setting the max page number according to the number of records
                component.set("v.maxPage", Math.floor((response.getReturnValue().length+9)/10));
                
                if(sortBy != '') {
                    if(component.get("v.sortAsc"))
                    	component.set("v.sortAsc", false);
                    else
                        component.set("v.sortAsc", true);
        			component.set("v.sortField", sortBy);
                }
                this.renderPage(component);
            }
            component.set("v.Spinner", false);
        });
        $A.enqueueAction(action);
    }
})
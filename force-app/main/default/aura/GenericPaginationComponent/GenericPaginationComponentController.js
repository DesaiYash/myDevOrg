({
    /**
     * Holds the current page number equals to 1.
     **/ 
	firstPage: function(component, event, helper) {
        component.set("v.currentPageNumber", 1);
    },
    
    /**
     * Used for the logic of previous page number.
     **/
    prevPage: function(component, event, helper) {
        component.set("v.currentPageNumber", Math.max(component.get("v.currentPageNumber")-1, 1));
    },
    
    /**
     * Used for the logic of next page number.
     **/
    nextPage: function(component, event, helper) {
        component.set("v.currentPageNumber", Math.min(component.get("v.currentPageNumber")+1, component.get("v.maxPageNumber")));
    },
    
    /**
     * Used for the logic of last page number.
     **/
    lastPage: function(component, event, helper) {
        component.set("v.currentPageNumber", component.get("v.maxPageNumber"));
    }
})
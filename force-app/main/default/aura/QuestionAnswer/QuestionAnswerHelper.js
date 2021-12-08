({
	getAllQuestionsAnswers : function(component) {
        console.log("1");
		var action = component.get("c.getAnswerList");
        action.setParams({
            recordId : component.get("v.recordId")
        });
        action.setCallback(this, function(response){
            const STATE = response.getState();
            console.log("2");
            if(STATE == "SUCCESS") {
                console.log("3" + JSON.stringify(response.getReturnValue()));
                
                component.set("v.listOfQuestion", response.getReturnValue());
            }
            else {
                console.log("4");
            }
        });
        $A.enqueueAction(action);
	}
})
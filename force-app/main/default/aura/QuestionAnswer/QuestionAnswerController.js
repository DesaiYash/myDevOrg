({
	doInit : function(component, event, helper) {
		helper.getAllQuestionsAnswers(component);
	},
    
    handleClick : function(component, event, helper) {
		var action = component.get("c.setAnswerList");
        action.setParams({
            answerList : JSON.stringify(component.get("v.listOfQuestion"))
        });
        action.setCallback(this, function(response){
            const STATE = response.getState();
            console.log("2");
            if(STATE == "SUCCESS") {
                console.log("3");
            }
            else {
                console.log("4");
            }
        });
        $A.enqueueAction(action);
	}
})
trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    List<Task> taskList = new List<Task>();
    for(Opportunity opportunity : Trigger.New) {
        if(opportunity.StageName == 'Closed Won') {
            taskList.add(new Task(Subject='Follow Up Test Task', WhatId=opportunity.Id));
        }
    }
    insert taskList;
}
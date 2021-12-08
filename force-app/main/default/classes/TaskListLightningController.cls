public class TaskListLightningController {

    @AuraEnabled
    public static List<TaskTable> fetchTask(String sortBy, boolean ownedBy, boolean sortAsc) {
        List<TaskTable> taskList = new List<TaskTable>();
        String query = 'SELECT Id, Subject, Status, TaskSubtype, ActivityDate, Priority, Owner.Name, WhatId FROM Task where whatId!=null and TaskSubtype=' + '\'Task\'';
        String userId = UserInfo.getUserId();
        if(ownedBy) {            
            query = query + ' and OwnerId=:userId';
        }
        else {
            query = query + ' and OwnerId!=:userId and CreatedById=:userId';
        }
        if(String.isNotEmpty(sortBy)) {
            if(sortBy == 'Subject') {
                query = query + ' Order by Subject';
            }
            else if(sortBy == 'Status') {
                query = query + ' Order by Status';
            }
            else if(sortBy == 'Priority') {
                query = query + ' Order by Priority';
            }
            if(!sortAsc) {
                query = query + ' desc';
            }
        }
        //query = query + ' limit 50';
        System.debug('************* '+query);
        //List<Task> listTask = [ SELECT Id, Subject, Status, TaskSubtype, ActivityDate, Priority, Owner.Name, WhatId FROM Task where TaskSubtype='Task' and OwnerId=:UserInfo.getUserId()];
        List<Task> listTask = Database.query(query);
        Set<Id> caseIds = new set<Id>();
        for(Task taskObj : listTask) {
            if(String.valueOf(taskObj.whatId).startsWith('500')) {
                caseIds.add(taskObj.whatId);
            }
        }
        if(caseIds.size() != 0) {
            Map<Id, Case> caseList = new Map<Id, Case>([select Id, CaseNumber from Case where Id in :caseIds]);
            for(Task taskObj : listTask) {
                if(String.valueOf(taskObj.whatId).startsWith('500') &&  caseList.containsKey(taskObj.whatId)) {
                    taskList.add(new TaskTable(taskObj, caseList.get(taskObj.whatId)));
                }
            }
        }
        return taskList;
    }
    
    public Class TaskTable {
        @AuraEnabled
        public Task objTask{get;set;}
        @AuraEnabled
        public Case objCase{get;set;}
        
        public TaskTable(Task objTask, Case objCase) {
            this.objTask = objTask;
            this.objCase = objCase;
        }
    }
    
}
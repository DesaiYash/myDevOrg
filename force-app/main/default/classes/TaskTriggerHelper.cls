public class TaskTriggerHelper {

    public static void handleDueDateChange(List<SObject> listOfNewSObjects ,Map<Id, SObject> mapOfIdSObjectsOld) {
        List<Task> listOfNewTasks = (list<Task>) listOfNewSObjects;
        Map<Id, Task> mapOfIdTasksOld = mapOfIdSObjectsOld != null ? (Map<Id, Task>) mapOfIdSObjectsOld : null ;
        Map<String, Integer> mapWeekDays = new Map<String, Integer>{'Sun' => 1, 'Mon' => 2,'Tue' => 3,'Wed' => 4,'Thu' => 5,'Fri' => 6, 'Sat' => 7};
            Date activityDate = null;
        Date createDate = null;
        for(Task taskT : listOfNewTasks) {
            if(taskT.RecordTypeId == Schema.SObjectType.Task.getRecordTypeInfosByName().get('Car Not in Dealership - Schedule Appointment').getRecordTypeId() ||
               taskT.RecordTypeId == Schema.SObjectType.Task.getRecordTypeInfosByName().get('Diagnosis and Repair Status').getRecordTypeId() || 
               taskT.RecordTypeId == Schema.SObjectType.Task.getRecordTypeInfosByName().get('First Inquiry with Dealer').getRecordTypeId() || 
               taskT.RecordTypeId == Schema.SObjectType.Task.getRecordTypeInfosByName().get('Parts Unavailability - Dealer Inquiry').getRecordTypeId() || 
               taskT.RecordTypeId == Schema.SObjectType.Task.getRecordTypeInfosByName().get('Service Conclusion').getRecordTypeId()) {
                   
                   if(mapOfIdTasksOld == null) {
                       createDate = Date.today();                
                   }
                   else {
                       if(mapOfIdTasksOld!=null && !mapOfIdTasksOld.isEmpty() && mapOfIdTasksOld.get(taskT.Id) != null) {
                           createDate = mapOfIdTasksOld.get(taskT.Id).ActivityDate;
                       }
                   }
                   
                   while(true) {
                       activityDate = taskT.ActivityDate;
                       String sDayName = ((DateTime)activityDate.addDays(1)).format('E');
                       if(sDayName == 'Sat' || sDayName == 'Fri') {
                           taskT.ActivityDate = activityDate.addDays(2);
                           break;
                       }
                       else if(sDayName == 'Sun') {
                           taskT.ActivityDate = activityDate.addDays(1);
                           break;
                       }
                       Integer iWeekendsCounter = 0;
                       if(createDate.daysBetween(activityDate) <= 0) {
                           break;
                       }
                       while(createDate.daysBetween(activityDate) > 0) {
                           sDayName = ((DateTime)createDate.addDays(1)).format('E');
                           if(sDayName == 'Sat' || sDayName == 'Sun') {
                               iWeekendsCounter++;
                           }
                           createDate = createDate.addDays(1);
                       }
                       activityDate = activityDate.addDays(iWeekendsCounter);
                       taskT.ActivityDate = activityDate;
                   }
               }
        }
    }

}
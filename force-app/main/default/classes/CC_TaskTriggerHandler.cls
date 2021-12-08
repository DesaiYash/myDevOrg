public class CC_TaskTriggerHandler implements CC_ITriggerHandler
{
    // Allows unit tests (or other code) to disable this trigger for the transaction
    public static Boolean isTriggerDisabled = true;
    
    // Checks to see if the trigger has been disabled in Custom Setting
    public Boolean isDisabled()
    {
       // CC_Global_OnOff_Switch__c triggerGlobalSwitchObj = CC_Global_OnOff_Switch__c.getInstance();
        //if((null!=triggerGlobalSwitchObj)&&(triggerGlobalSwitchObj.Is_Trigger_Active__c==true)){
       //     isTriggerDisabled=false;
       // }
        return isTriggerDisabled;
    }
    
    public void beforeInsert(List<SObject> listOfNewTasks) 
    {
        
    }
    public void beforeUpdate(Map<Id, SObject> mapOfIdTasksNew, Map<Id, SObject> mapOfIdTasksOld) {
                
    }
    public void beforeDelete(Map<Id, SObject> mapOfIdTasksOld) {

    }
    public void afterInsert(Map<Id, SObject> mapOfIdTasksNew) {
              
    }
    
    public void afterUpdate(Map<Id, SObject> mapOfIdTasksNew, Map<Id, SObject> mapOfIdTasksOld) {
       
        
    }
    
    public void afterDelete(Map<Id, SObject> mapOfIdTasksOld) {
        // write business logic to be implemented in after delete operation
        
    }
    public void afterUndelete(Map<Id, SObject> mapOfIdTasksOld) {
        // write business logic to be implemented in after undelete operation
    }
}
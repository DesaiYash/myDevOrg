public class CC_TriggerDispatcher 
{
    /*******************************************************************
    Purpose:  
    This method will fire the appropriate methods on the handler on the trigger 
    context.Call this method from your trigger, passing in an instance of a trigger handler.
    Parameters: Instance of Trigger Handler from trigger. (Trigger Handler for any object must implement CC_ITriggerHandler iterface) 
    Returns: nothing
    Throws [Exceptions]: none                                                         
    ********************************************************************/
    public static void run(CC_ITriggerHandler handler)
    {
        // Check to see if the trigger has been disabled. If it has, return
        if (handler.isDisabled())return;        
        if (Trigger.isBefore )
        {
            if (Trigger.isInsert)
                handler.beforeInsert(trigger.new);
            if (Trigger.isUpdate)
                handler.beforeUpdate(trigger.newMap, trigger.oldMap);
            if (Trigger.isDelete)
                handler.beforeDelete(trigger.oldMap);
        }
        // After trigger logic
        if (Trigger.isAfter)
        {
            if (Trigger.isInsert)
                handler.afterInsert(Trigger.newMap);
            
            if (Trigger.isUpdate)
                handler.afterUpdate(trigger.newMap, trigger.oldMap);
            
            if (trigger.isDelete)
                handler.afterDelete(trigger.oldMap);
            
            if (trigger.isUndelete)
                handler.afterUndelete(trigger.oldMap);
        }
    }
}
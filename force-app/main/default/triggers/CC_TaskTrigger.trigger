trigger CC_TaskTrigger on Task (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    CC_TriggerDispatcher.run(new CC_TaskTriggerHandler());
}
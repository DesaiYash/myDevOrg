trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
    List<BatchLeadConvertErrors__c> batchErrorList = new List<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent eventRecord : Trigger.new) {
    	batchErrorList.add(new BatchLeadConvertErrors__c(AsyncApexJobId__c = eventRecord.AsyncApexJobId, Records__c = eventRecord.JobScope, StackTrace__c = eventRecord.StackTrace));
    }
    if(!batchErrorList.isEmpty())
        insert batchErrorList;
}
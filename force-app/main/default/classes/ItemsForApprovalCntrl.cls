public class ItemsForApprovalCntrl {

/*----------------------------------------------------------------------------------------------------------
Method Description: This method is used to get Approvals which are in pending status
Input Parameters: List<ProcessInstanceWorkItem>
Output Parameters: List<ProcessInstanceWorkItem>
------------------------------------------------------------------------------------------------------------*/
    
    @AuraEnabled
    public static List<ProcessInstanceWorkItem> fetchPendingApprovals() {
        
        Id currentUserId = UserInfo.getUserId();
        List<Id> allActorIds = new List<Id>();
        allActorIds.add(currentUserId);
        
        for(GroupMember queueObj : [Select GroupId, Group.Name from GroupMember where UserOrGroupId =: currentUserId  and Group.Type = 'Queue']) {
        	allActorIds.add(queueObj.GroupId);
        }
        
        ProcessInstanceWorkItem[] pList = [select id,Actorid,Actor.name,OriginalActor.name,processinstanceid,
                                       processinstance.Status,processinstance.TargetObjectId,processinstance.TargetObject.Name,
                                       processinstance.SubmittedById,processinstance.SubmittedBy.Name,processinstance.CreatedDate
                                       from processInstanceWorkItem 
                                       where processinstance.Status = 'Pending' AND (Actorid in : allActorIds OR OriginalActorId in : allActorIds)];
        //AND (Actorid = :UserInfo.getUserId() OR OriginalActorId = :UserInfo.getUserId())
        if(pList != null && pList.size()>0){
            System.debug(pList[0].processinstance.SubmittedBy.Name);
            return pList;
        }
        else{
            return null;
        }
        
    }

}
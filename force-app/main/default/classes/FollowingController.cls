public class FollowingController {
    public List<WrapperOption> userList {get;set;}
    public List<WrapperOption> followedUserList {get;set;}
    Id recId;
    public FollowingController() {
        Set<Id> userIdSet = new Set<Id>();
        recId = ApexPages.currentPage().getParameters().get('Id');
        List<EntitySubscription> entitySub = [select id, parentid, subscriberid from EntitySubscription where parentid=:recId];
        for(EntitySubscription entity : entitySub) {
            userIdSet.add(entity.subscriberid);
        }
        userList = new List<WrapperOption>();
        for(User u : [select Id, Name from User where (not id in :userIdSet)]) {
            userList.add(new WrapperOption(false, u));
        }
        followedUserList = new List<WrapperOption>();
        for(User u : [select Id, Name from User where id in :userIdSet]) {
            followedUserList.add(new WrapperOption(false, u));
        }
    }
    
    public PageReference cancel() {
        return new PageReference('/'+recId);
    }
    
    public PageReference save() {
        List<EntitySubscription> followList = new List<EntitySubscription>();
        for(WrapperOption wrOpp : userList) {
            if(wrOpp.isSelected) {
                EntitySubscription es = new EntitySubscription();
                es.parentid = recId;
                es.SubscriberId = wrOpp.userObj.Id;
                followList.add(es);
            }
        }
        if(!followList.isEmpty())
            insert followList;
        return new PageReference('/'+recId);
    }
    
    public PageReference unfollow() {
        List<Id> followList = new List<Id>();
        for(WrapperOption wrOpp : followedUserList) {
            if(wrOpp.isSelected) {
                followList.add(wrOpp.userObj.id);
            }
        }
        List<EntitySubscription> enSubList = new List<EntitySubscription>();
        if(!followList.isEmpty()) {
           enSubList = [select Id from EntitySubscription where parentid=:recId and SubscriberId in :followList];
           delete enSubList;
        }
        return new PageReference('/'+recId);
    }
    
    class WrapperOption {
        public boolean isSelected{get;set;}
        public User userObj{get;set;}
        
        public WrapperOption(boolean isSelected, User userObj) {
            this.isSelected = isSelected;
            this.userObj = userObj;
        }
    }
}
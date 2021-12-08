public class SessionManagerController {
    
    @AuraEnabled
    public static void setSessionValueFor() {
        Cache.Session.put('local.myPartition.myName', 'you did it');
    }
    
    @AuraEnabled
    public static String getSessionValueFor() {
        System.debug('@@@@@@@@@@   '+Cache.Session.contains('local.myPartition.myName'));
        if (Cache.Session.contains('local.myPartition.myName')) {
            return (String)Cache.Session.get('local.myPartition.myName');
        }
        return 'nothing';
    }
    
}
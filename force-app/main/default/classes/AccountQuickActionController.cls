public class AccountQuickActionController {

    @AuraEnabled
    public static boolean getProfileName() {
        try {
        	String profileName = [select Name from Profile where Id =: UserInfo.getProfileId()].Name;
            return (profileName == 'System Administrator');
        }
        catch(Exception ex) {
            return false;
        }
    }
    
    @AuraEnabled
    public static boolean updateAccountForOracle(String accountId) {
        try {
            update new Account(Id=accountId, Name='Sent for Orcale');
            return true;
        }
        catch(Exception ex) {
            return false;
        }
    }
    
}
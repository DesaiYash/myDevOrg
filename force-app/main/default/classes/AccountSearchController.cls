public class AccountSearchController {
    @AuraEnabled
    public static List<Account> getAccountList(String sName) {
        String serachTxt = '%'+sName+'%';
        return [select Name from Account where Name like :serachTxt];
    }

}
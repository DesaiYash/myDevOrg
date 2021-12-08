public with sharing class AccountListControllerLt {
    
    @AuraEnabled
    public static String getAllAccount() {
        List<Account> accountList = [select Id, Name from Account limit 5];
        return JSON.serialize(accountList);
    }
}
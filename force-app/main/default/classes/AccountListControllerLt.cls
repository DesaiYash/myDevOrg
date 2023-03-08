public with sharing class AccountListControllerLt {
    
    @AuraEnabled
    public static List<Account> getAllAccount() {
        List<Account> accountList = [select Id, Name from Account limit 5];
        //return JSON.serialize(accountList);
        return accountList;
    }
}
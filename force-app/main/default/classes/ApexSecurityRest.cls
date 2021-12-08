@RestResource(urlMapping='/apexSecurityRest')
global with sharing class ApexSecurityRest {
    @HttpGet
    global static Contact doGet() {
        Id recordId = RestContext.request.params.get('id');
        Contact result;
        if (recordId == null) {
           throw new FunctionalException('Id parameter is required');
        }
          List<Contact> results = [SELECT id, Name, Title, Top_Secret__c, Account.Name FROM Contact WHERE Id = :recordId];
          if (!results.isEmpty()) {
              SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.READABLE, results);
             result = (Contact)securityDecision?.getRecords()[0];
        	result.Description = result?.Account?.Name;
                 result.Description = result.Account.Name == null ? null : result.Account.Name;
             }
            
           return result;
    }

      public class FunctionalException extends Exception{}
      public class SecurityException extends Exception{}
}
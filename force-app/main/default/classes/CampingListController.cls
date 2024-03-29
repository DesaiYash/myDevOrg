public class CampingListController {
    
    @AuraEnabled
    public static List<Camping_Item__c> getItems() {
        return [select Name, Packed__c, Price__c, Quantity__c from Camping_Item__c];        
    }
    
    @AuraEnabled
    public static void saveItem(Camping_Item__c cmp) {
        if(cmp != null)
            insert cmp;
    }

}
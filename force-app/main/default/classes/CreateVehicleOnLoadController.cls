public class CreateVehicleOnLoadController {
    
    @AuraEnabled
    public static void createVehicleRecord() {
        insert new Garage__c(Name='Name'+System.currentTimeMillis(), Project_link__c='Created');
    }

}
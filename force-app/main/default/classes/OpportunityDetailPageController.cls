public class OpportunityDetailPageController {
    
    Id accId;
    public List<Opportunity> listOpp{get;set;}
    public String ownerName{get;set;}
    public String address{get;set;}
    public Id oppSelectedId{get;set;}
    
    
    public OpportunityDetailPageController(ApexPages.StandardController sc) {
        accId = sc.getRecord().Id;
        
        // Fetching required account information
        Account acc = [select Owner.Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry from Account where id =:accId];
        ownerName = acc.Owner.Name;
        if(String.isNotEmpty(acc.BillingStreet))
            address = acc.BillingStreet;
        if(String.isNotEmpty(acc.BillingCity)) {
            if(String.isNotEmpty(address))
                address += ', ' + acc.BillingCity;
            else
                address = acc.BillingCity;
        }
        if(String.isNotEmpty(acc.BillingState)) {
            if(String.isNotEmpty(address))
                address += ', ' + acc.BillingState;
            else
                address = acc.BillingState;
        }
        if(String.isNotEmpty(acc.BillingPostalCode )) {
            if(String.isNotEmpty(address))
                address += ', ' + acc.BillingPostalCode;
            else
                address = acc.BillingPostalCode;
        }
        if(String.isNotEmpty(acc.BillingCountry)) {
            if(String.isNotEmpty(address))
                address += ', ' + acc.BillingCountry;
            else
                address = acc.BillingCountry;
        }        
    }
    
    // Load all opportunities for an account
    public void getOpportunity() {
        listOpp = [select Id, Name, Type, StageName, Amount from opportunity where AccountId =: accId];     
    }
    
    // Delete selected opportunity
    public void deleteOpp() {
        delete new Opportunity(Id=oppSelectedId);
        getOpportunity();	// After delete opportunity, again load opportunity list
    }

}
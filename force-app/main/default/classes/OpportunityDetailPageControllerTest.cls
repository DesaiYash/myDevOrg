@isTest
public class OpportunityDetailPageControllerTest {
    
    public static testmethod void myUnitTest(){
    	Account acc = new Account(Name='Test',BillingStreet='Powai', BillingCity='Mumbai', BillingState='Maharashtra', BillingPostalCode='47009', BillingCountry='India');
        insert acc;
        
        Opportunity opp = new Opportunity(Name='Test', AccountId=acc.Id, StageName='Closed Won', CloseDate=Date.today());
        insert opp;
        
        OpportunityDetailPageController c = new OpportunityDetailPageController(new ApexPages.StandardController(acc));
        c.getOpportunity();
        c.oppSelectedId = opp.Id;
        c.deleteOpp();
        
    }

}
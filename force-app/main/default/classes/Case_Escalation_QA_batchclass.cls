global with sharing class Case_Escalation_QA_batchclass implements Database.batchable<Case>{
    global List<Case> blCountList;
    global Iterable<Case> start(Database.BatchableContext bc){
        try{
            DateTime hr = datetime.now().addhours(-1);
            String pStrSOQL = 'SELECT id FROM Case';
            blCountList = Database.query(pStrSOQL);
        }
        catch(Exception e){
            system.debug('============== Invalid location list exception caught =============');   
            system.debug('Iterable<Case> start(Database.BatchableContext bc)' + e.getMessage());
            
        } 
        return blCountList;
    }
    
    global void execute(Database.BatchableContext BC, List<Case> scope)
    {
        try{
            for(Case bl: scope ) {
                System.debug('###### bl   '+bl);
            }  
            EmailManagerNew.send();
        }
        catch(Exception e) {
            system.debug('============== execute batch location list exception caught =============');   
            system.debug('execute(Database.BatchableContext BC, List<Case> scope)'+e.getMessage());
        } 
        
    }   
        
    global void finish(Database.BatchableContext BC)
    {
    }
}
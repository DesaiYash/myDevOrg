public class NewCaseListController {
    
    public static List<Case> getNewCases() {
        System.debug('######calling method ');
        List<Case> newCases = Database.query('SELECT Id,CaseNumber From Case WHERE Status=\'New\'');
        System.debug('###### newCases '+newCases.size());
        return newCases;
    }
    
    public void save() {
        System.debug('##### Save method');
    }
}
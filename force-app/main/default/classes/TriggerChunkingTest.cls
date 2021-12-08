@IsTest
public class TriggerChunkingTest {
    
    @IsTest
    static void fiveChunks() {
        Integer nAccounts = 1000;
        List<Account> accounts = new List<Account>();
        
        for(Integer i=0; i < nAccounts; i++) {
            accounts.add(new Account(Name = String.valueOf(i)));
        }
        
        Test.startTest();
        try{
            //insert accounts;
            Database.insert(accounts, false);
        }
        catch(Exception ex){}
        //System.assertEquals(5, Limits.getQueries());
        List<Account> listAcc = [select Name from Account order by Name];
        System.debug('listAcc: '+listAcc.size());
        for(Account ac : listAcc) {
            System.debug('Account Name: '+ac.Name);
        }
        Test.stopTest();
    }
}
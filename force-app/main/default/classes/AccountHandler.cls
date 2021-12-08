public class AccountHandler {
	
    public static Account insertNewAccount(String sAccName) {
        Account acc = new Account(Name = sAccName);
        try {
            insert acc;
            return acc;
        }
        catch(Exception e) {
            return null;
        }
    }
    
}
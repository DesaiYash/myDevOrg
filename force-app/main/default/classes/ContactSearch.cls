public class ContactSearch {
    
    public static List<Contact> searchForContacts(String sFirst, String sLast) {
        return [select ID,Account.Name from Contact where LastName=:sFirst and MailingPostalCode=:sLast];
    }

}
public class ContactSearchClass {
    
    public List<Contact> listContact { get; set; }
    public Contact contactObj { get; set; }
    public ContactSearchClass(ApexPages.StandardController controller) {
        listOfContact();
    }
    
    public void listOfContact() {
        listContact = [select Id, Name, Phone from Contact Order by Name];
        System.debug('#####   '+listContact);
        contactObj = [select Custom_Account__c from Contact where id='0032800000T3JhMAAV'];
    }

}
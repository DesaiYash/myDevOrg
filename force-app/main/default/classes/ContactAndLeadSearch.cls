public class ContactAndLeadSearch {
	
    public static List<List<SObject>> searchContactsAndLeads(String sSearch) {
        return [Find :sSearch IN ALL FIELDS RETURNING Lead(FirstName,LastName), Contact(FirstName,LastName)];
    }   
}
public class DropdownDemo {
    
    public String selectedVal{get;set;}  // This will hold the selected value, the id in here
    public List<SelectOption> optnsNew {get;set;}

    public List<SelectOption> getopenPresentationOptions(){
        List<SelectOption> optns = new List<Selectoption>();
        // before getting here you must populate your queryResult list with required fields
        for(Case obj : [select Id, CaseNumber from Case]){
            optns.add(new selectOption(obj.Id, obj.CaseNumber));
        }            
        
        return optns;
    }
    
    public void populateDropdown() {
        //System.debug('#####   '+selectedVal);
        optnsNew = new List<Selectoption>();
        optnsNew.add(new selectOption('1', 'Yash'));
        optnsNew.add(new selectOption('2', 'Xyz'));
        optnsNew.add(new selectOption(selectedVal, selectedVal));
    }

}
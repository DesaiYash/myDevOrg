public class DependentPicklistUtil {
    
    public class PicklistEntryWrapper {
        public String active {get; set;}
        public String defaultValue {get; set;}
        public String label {get; set;}
        public String value {get; set;}
        public String validFor {get; set;}
    }
    
    private static final String base64Chars = '' +
        'ABCDEFGHIJKLMNOPQRSTUVWXYZ' +
        'abcdefghijklmnopqrstuvwxyz' +
        '0123456789+/';
    
    /*----------------------------------------------------------------------------------------------------------
	Method Description: getDependentOptionsImpl method fetches the dependent picklist values corresponding to a 
						controlling field.
	Input Parameters: ctrlField, theField
	Output Parameters: objResults
	------------------------------------------------------------------------------------------------------------*/
    
    public static Map<String, List<String>> getDependentOptionsImpl (Schema.SObjectField ctrlField, Schema.SObjectField theField) {
        
        try {
        //vlidFor property cannot be accessed via a method or a property,
        //so we need to serialize the PicklistEntry object and then deserialize into a wrapper.
        system.debug(ctrlField.getDescribe().getType());
        List<Schema.PicklistEntry> contrEntries = new List<Schema.PicklistEntry>();
        //Set up the return container - Map<ControllingValue, List<DependentValues>>
        Map<String, List<String>> objResults = new Map<String, List<String>>();
        List<String> controllingValues = new List<String>();
        //Here we check the type, because dependent picklists could be based off chekboxes or other picklists
        //If the controlling field is a checkbox, add 'Unchecked' and 'Checked' values as key in objResults
        //If it is picklist, add the ControllingValues as key in objResults
        if (String.valueOf(ctrlField.getDescribe().getType()) == 'BOOLEAN') {
            
            objResults.put('Unchecked', new List<String>());
            objResults.put('Checked', new List<String>());
            controllingValues.add('Unchecked');
            controllingValues.add('Checked');
        }
        else if (String.valueOf(ctrlField.getDescribe().getType()) == 'PICKLIST') {
            
            contrEntries = ctrlField.getDescribe().getPicklistValues();
            
            for (Schema.PicklistEntry ple : contrEntries) {
                String label = ple.getLabel();
                objResults.put(label, new List<String>());
                controllingValues.add(label);
            }
        }
        List<PicklistEntryWrapper> depEntries = DependentPicklistUtil.wrapPicklistEntries(theField.getDescribe().getPicklistValues());
        system.debug(depEntries);
        
        for (PicklistEntryWrapper plew : depEntries) {
            system.debug(plew);
            String label = plew.label;
            String validForBits = base64ToBits(plew.validFor);
            system.debug(validForBits);
            for (Integer i = 0; i < validForBits.length(); i++) {
                // For each bit, in order: if it's a 1, add this label to the dependent list for the corresponding controlling value
                String bit = validForBits.mid(i, 1);
                system.debug(bit);
                system.debug(i);
                if (bit == '1') {
                    objResults.get(controllingValues.get(i)).add(label);
                }
            }
        }
        
        return objResults;
        }
        catch (Exception e) {
            system.debug('Error occurred @@ getDependentOptionsImpl @@ DependentPicklistUtil ' + 
                         e.getTypeName() + '-->' + e.getLineNumber() + '-->' + e.getMessage());
            throw e;
        }
    }
    
    private static List<PicklistEntryWrapper> wrapPicklistEntries (List<Schema.PicklistEntry> PLEs) {
        return (List<PicklistEntryWrapper>)JSON.deserialize(JSON.serialize(PLEs), List<PicklistEntryWrapper>.class);
    }
    
    /*----------------------------------------------------------------------------------------------------------
	Method Description: base64ToBits method converts a base64 token into a binary/bits representation 
						controlling field. e.g. 'gAAA' => '100000000000000000000'
	Input Parameters: validFor
	Output Parameters: validForBits
	------------------------------------------------------------------------------------------------------------*/
   
    public static String base64ToBits(String validFor) {
        if (String.isEmpty(validFor)) return '';
        
        String validForBits = '';
        
        for (Integer i = 0; i < validFor.length(); i++) {
            String thisChar = validFor.mid(i, 1);
            Integer val = base64Chars.indexOf(thisChar);
            String bits = decimalToBinary(val).leftPad(6, '0');
            validForBits += bits;
        }
        
        return validForBits;
    }
    
    /*----------------------------------------------------------------------------------------------------------
	Method Description: decimalToBinary method converts decimal to binary representation.
						eg. 4 => '100', 19 => '10011', etc.
	Input Parameters: val
	Output Parameters: bits
	------------------------------------------------------------------------------------------------------------*/
    
    public static String decimalToBinary(Integer val) {
        String bits = '';
        while (val > 0) {
            Integer remainder = Math.mod(val, 2);
            val = Integer.valueOf(Math.floor(val / 2));
            bits = String.valueOf(remainder) + bits;
        }
        return bits;
    }
    
    public static list<string> fetchDependentPicklistValues (String cntrlValue, String controllingPicklist, String dependentPicklist, String objectApiName) {
        
        system.debug('cntrlValue'+cntrlValue);
        try{
        Schema.SObjectType objType                = Schema.getGlobalDescribe().get(objectApiName);
        Schema.DescribeSObjectResult sobjDescribe = objType.getDescribe();
        Schema.SObjectField controllingField      = sobjDescribe.fields.getMap().get(controllingPicklist);
        Schema.SObjectField dependentField        = sobjDescribe.fields.getMap().get(dependentPicklist);
        
        
        Map<String, List<String>> mappedValues    = DependentPicklistUtil.getDependentOptionsImpl(controllingField, dependentField);
        //system.debug('Returned List:::: ' + mappedValues.get(cntrlValue)); 
        //return dependentFieldValue ;
        
        return mappedValues.get(cntrlValue);
        }
         catch (Exception e) {
            system.debug('Exception occurred in fetchDependentPicklistValues @@ CampaignController @@ ' + e.getLineNumber() + '@@' + e.getMessage());
            throw new AuraHandledExCeption(e.getMessage());
        }
        
    }
}
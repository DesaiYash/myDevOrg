public class CC_DynamicDescribeUitility {
    /*****************************************************************************************
    Method Name : getPickValues
    Parameters  : 1. object_name -- Instance of sobject 
                  2. field_name -- field name
                  3. first_val --  picklist first value
    Return Type : NA
    Description : It is used to get all picklist values
    ******************************************************************************************/
    public static List<String> getPickValues(Sobject object_name, String field_name, String first_val) {
        //new list for holding all of the picklist options
        
        List<String> options = new List<String>();
        //if there is a first value being provided
        if (first_val != null) { 
            //add the first option
            options.add(first_val); 
        }//end If
        
        //grab the sobject that was passed
        Schema.sObjectType sobject_type = object_name.getSObjectType(); 
        
        //describe the sobject
        Schema.DescribeSObjectResult sobject_describe = sobject_type.getDescribe(); 
        
        //get a map of fields for the passed sobject
        Map<String, Schema.SObjectField> field_map = sobject_describe.fields.getMap(); 
        
        //grab the list of picklist values for the passed field on the sobject
        List<Schema.PicklistEntry> pick_list_values = field_map.get(field_name).getDescribe().getPickListValues(); 
        
        //for all values in the picklist list
        for (Schema.PicklistEntry picklistEntry : pick_list_values) { 
            //add the value and label to our final list
            options.add(picklistEntry.getLabel()); 
        }//end for
        //return the List
        return options; 
    }// end getPickValues()
    
    // single field label fetch 
    // Note -- Currently is not used that so commeting the function
    /*
    public static String getFieldLabel(String object_name, String field_name) {
        
        return Schema.getGlobalDescribe().get(object_name).getDescribe().fields.getMap().get(field_name).getDescribe().getLabel();
    }// end getFieldLabel()
    */
    
    /*****************************************************************************************
    Method Name : getAllFieldsLabel
    Parameters  : 1. object_name -- object name
    Return Type : NA
    Description : Get all field labels related to one object
    ******************************************************************************************/
    public static Map<String, String> getAllFieldsLabel(String object_name) {
        // list of all field labels
        Map<String, String> mapFieldsLabel = new Map<String, String>();
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType objectSchema = schemaMap.get(object_name);
        Map<String, Schema.SObjectField> fieldMap = objectSchema.getDescribe().fields.getMap();
        for (String fieldName: fieldMap.keySet()) {
            
            mapFieldsLabel.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
            
        }//end for
        system.debug('---->'+mapFieldsLabel);
        return mapFieldsLabel;
    }// end getAllFieldsLabel()
    
}//end class
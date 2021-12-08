public class QuickTextClass {
    
    @AuraEnabled
    public static List<String> getAllQiuckText(String itemId, String objectAPIName) {
        //String sMsg = 'Hi, {! FirstName }. This is test. Your Last Name is {!LastName}';
        //sMsg = sMsg.replaceAll('\\{! ', '\\{!').replaceAll(' }', '}');
        //String sObjectName = 'Contact';
        String sQuery = 'select Id';
        //String itemId = '0035400000CxuZq';
        //String[] sMsgArr = sMsg.split('\\{!');
        Set<String> listFields = new Set<String>();
        List<String> listMsg = new List<String>();
        Integer indexOfMsg = 0;
        for(Quick_Text__mdt qt : [select Message__c from Quick_Text__mdt where Object_Name__c =: objectAPIName]) {
            listMsg.add(qt.Message__c);
        }
        for(String sMsg : listMsg) {
            System.debug('sMsg   '+sMsg);
            if(sMsg.indexOf('{!') != -1) {
                indexOfMsg = listMsg.indexOf(sMsg);
                sMsg = sMsg.replaceAll('\\{! ', '\\{!').replaceAll(' }', '}');
                listMsg.set(indexOfMsg, sMsg);
                for(String msg : sMsg.split('\\{!')) {                    
                    if(msg.indexOf('}') != -1)
                        listFields.add(msg.substring(0, msg.indexOf('}')));
                }
            }
        }
        if(!listFields.isEmpty()) {	
            for(String field : listFields) {
                sQuery += ', '+ field;
            }
            sQuery += ' from ' + objectAPIName + ' where Id=:itemId';
            System.debug('sQuery   '+sQuery);
            sObject obj = Database.query(sQuery);
            for(String field : listFields) {
                for(String sMsg : listMsg) {
                    indexOfMsg = listMsg.indexOf(sMsg);
                	sMsg = sMsg.replaceAll('\\{!'+field+'}', String.valueOf(obj.get(field)));
                    listMsg.set(indexOfMsg, sMsg);
                }
            }
        }
        //System.debug('sMsg   '+sMsg);
        return listMsg;
    }
    
}
public class InlineEditExtn {
    private String recTypeId = '';
    public boolean isInlineEditEnable {get; set;}

    public InlineEditExtn(ApexPages.StandardController controller) {
         List<Case> caseList = [SELECT RecordTypeId FROM Case WHERE Id =: controller.getId() LIMIT 1];
         for(Case caseObj : caseList ) {
             recTypeId = caseObj.RecordTypeId;
             break;
         }
         System.debug('####recTypeId  '+recTypeId);
         isInlineEditEnable = false;
         if(recTypeId.equals('01228000000oTUrAAM')) {
             isInlineEditEnable = true;
         }
    }

}
public class QuestionAnswerController {
    
    @AuraEnabled
    public static List<WrapperAnswer> getAnswerList(String recordId) {
        List<WrapperAnswer> listR = getListRecord(recordId);
        if(listR.isEmpty()) {
            List<SCP_Answers__c> listInsert = new List<SCP_Answers__c>();
            for(Question_Master__c question : [select Id from Question_Master__c where Parent__c != null]) {
                listInsert.add(new SCP_Answers__c(Name='aaaa', Question__c=question.Id, SCP__c=recordId));
            }
            if(!listInsert.isEmpty()) {
                insert listInsert;
            }
            listR = getListRecord(recordId);
        }
        return listR;
    }
    
    @AuraEnabled
    public static void setAnswerList(String answerList) {
        List<WrapperAnswer> answers = (List<WrapperAnswer>) JSON.deserialize(answerList, List<WrapperAnswer>.Class);
        List<SCP_Answers__c> answerUpdate = new List<SCP_Answers__c>();
        for(WrapperAnswer answerObj : answers) {
            answerUpdate.addAll(answerObj.answerList);
        }
        update answerUpdate;
    }
    
    private static List<WrapperAnswer> getListRecord(String recordId) {
        List<WrapperAnswer> listAnswer = new List<WrapperAnswer>();
        Map<Id, List<SCP_Answers__c>> mapAnswer = new Map<Id, List<SCP_Answers__c>>();
        Map<Id, String> mapParentQu = new Map<Id, String>();
        Map<Id, Integer> mapRatting = new Map<Id, Integer>();
        Map<Id, Integer> mapPRatting = new Map<Id, Integer>();
        for(SCP_Answers__c answer : [select Id, Name, Ratting__c, Check__c, Question__r.Name, Question__r.Parent__c, Question__r.Parent__r.Name, Question__r.Parent__r.Actual_Ratting__c from SCP_Answers__c where SCP__c=:recordId]) {
            if(mapAnswer.containsKey(answer.Question__r.Parent__c)) {
                mapAnswer.get(answer.Question__r.Parent__c).add(answer);
                mapRatting.put(answer.Question__r.Parent__c, mapRatting.get(answer.Question__r.Parent__c) + (Integer)answer.Ratting__c);
            }
            else {
                mapAnswer.put(answer.Question__r.Parent__c, new List<SCP_Answers__c>{answer});
                mapParentQu.put(answer.Question__r.Parent__c, answer.Question__r.Parent__r.Name);
                mapRatting.put(answer.Question__r.Parent__c, (Integer)answer.Ratting__c);
                mapPRatting.put(answer.Question__r.Parent__c, (Integer)answer.Question__r.Parent__r.Actual_Ratting__c);
            }
        }
        for(Id answerId : mapAnswer.keySet()) {
            listAnswer.add(new WrapperAnswer(mapParentQu.get(answerId), mapAnswer.get(answerId), mapPRatting.get(answerId), mapRatting.get(answerId)));
        }
        return listAnswer;
    }
    
    public class WrapperAnswer {
        @AuraEnabled public String sParentQuestion;
        @AuraEnabled public List<SCP_Answers__c> answerList;
        @AuraEnabled public Integer questionRatting;
        @AuraEnabled public Integer answerRatting;
        @AuraEnabled public String sColor;
        public WrapperAnswer(String sParentQuestion, List<SCP_Answers__c> answerList, Integer questionRatting, Integer answerRatting) {
            this.sParentQuestion = sParentQuestion;
            this.answerList = answerList;
            this.questionRatting = questionRatting;
            this.answerRatting = answerRatting;
            Integer percentage = (answerRatting * 100)/questionRatting;
            if(percentage >= 80)
                sColor = 'green';
            else if(percentage < 80 && percentage > 40)
                sColor = 'orange';
            else
                sColor = 'red';
        }
    }

}
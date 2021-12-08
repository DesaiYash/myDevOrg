global class Case_Escalation_QA_Schedulclass  implements Schedulable {

   global void execute(SchedulableContext ctx) {
       Case_Escalation_QA_batchclass p = new Case_Escalation_QA_batchclass();
       database.executeBatch(p,20);
   }   
}
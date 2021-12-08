global class ApexScheduledClass Implements Schedulable {
    global void execute(SchedulableContext sc) {
        sendmail();
    }
    
    public void sendmail() {
        List<Case> listS = [select Subject from Case];
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        string [] toaddress= New string[]{'yash.desai@lntinfotech.com'};
        email.setSubject('Testing Apex Scheduler-Subject');
        email.setPlainTextBody('Testing Apex Scheduler-Body    '+listS.get(0));
        email.setToAddresses(toaddress);
        Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
    }
}
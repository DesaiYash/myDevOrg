trigger CaseTrigger on Case (before update) {
   /* List<Messaging.SingleEmailMessage> theEmails = new List<Messaging.SingleEmailMessage>();
    List<String> toAddress = new List<String>(); // setToAddresses will only accept a List (array)
    toAddress.add('yash.desai@lntinfotech.com');
    String subjectTag = 'Email from trigger';
    String msgBody ='Email from trigger';
    
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    mail.setToAddresses( toAddress ); // only takes a List (array) as noted above
    //mail.setReplyTo( replyAddress );
    mail.setSenderDisplayName('My Company Email');
    mail.setSubject(subjectTag);
    mail.setPlainTextBody( msgBody );
    
    theEmails.add(mail);
    
    toAddress = new List<String>(); // setToAddresses will only accept a List (array)
    toAddress.add('desaiyash14@gmail.com');
    subjectTag = 'Email from trigger';
    msgBody ='Email from trigger';
    
    mail = new Messaging.SingleEmailMessage();
    mail.setToAddresses( toAddress ); // only takes a List (array) as noted above
    //mail.setReplyTo( replyAddress );
    mail.setSenderDisplayName('My Company Email');
    mail.setSubject(subjectTag);
    mail.setPlainTextBody( msgBody );
    
    theEmails.add(mail);
    
    Messaging.SendEmailResult[] results = Messaging.sendEmail( theEmails);*/
    
    for(Case cs : Trigger.New) {
        System.debug('before subject '+cs.Subject);
        System.debug('before1 subject '+Trigger.oldMap.get(cs.Id).Subject);
        cs.Subject = 'trigger1';
        System.debug('After subject '+cs.Subject);
        System.debug('After1 subject '+Trigger.oldMap.get(cs.Id).Subject);
        cs.Subject.addError('This is not allowed');
    }
}
trigger AccountHistory on Account (after insert) {
    if(RecursiveClass.runOnce()) {
        List<Account> accounts = [SELECT Id FROM Account];
        System.debug('Trigger size: ' + Trigger.size);
        for(Account ac : Trigger.new) {
            if(ac.Name == '201') {
                ac.addError('error');
            }
        }
        System.debug('Number of SOQL queries used: ' + Limits.getQueries());
    }    
}
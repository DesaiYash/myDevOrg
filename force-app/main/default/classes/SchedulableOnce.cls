global class SchedulableOnce implements Schedulable {
    
    global void scheduleMe() {
        String hour = String.valueOf(Datetime.now().hour());
        String min = String.valueOf(Datetime.now().minute());
        String ss = String.valueOf(Datetime.now().second() + 5);
        //parse to cron expression 
        String nextFireTime = ss + ' ' + min + ' ' + hour + ' * * ?';
        SchedulableOnce s = new SchedulableOnce();
        System.schedule('Job Started At ' + String.valueOf(Datetime.now()), nextFireTime, s);
    }
    
    global void execute(SchedulableContext sc){
        System.enqueueJob(new QueueableClass(sc.getTriggerId()));
        System.enqueueJob(new QueueableClass(sc.getTriggerId()));
    }
}
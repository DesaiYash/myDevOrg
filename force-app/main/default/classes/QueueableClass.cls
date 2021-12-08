public class QueueableClass implements Queueable {
    
    public Id jobId;
    public QueueableClass(Id jobId) {
        this.jobId = jobId;
    }
    
    public void execute(QueueableContext context) {
        System.debug('jobId     '+jobId); 
        FutureClass.callFuture();   
        System.abortJob(jobId);
    }
    
    
}
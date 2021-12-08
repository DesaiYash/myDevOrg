public class TaskMassClosure {

    public List<Task> listOfTask {get;set;}
    public TaskMassClosure() {
        getTaskList();
    }    
    
    public void getTaskList() {
        listOfTask = [select Id, Subject, Status	from Task where Status!='Completed'] ;
    }
    
    public void closeAllTask() {
        System.debug('###### Entered');
        List<Task> newTaskList = new List<Task>();
        for(Task task: listOfTask) {
            task.Status = 'Completed';
            newTaskList.add(task);
        }
        System.debug('###### '+newTaskList);
        update newTaskList;
    }
    
}
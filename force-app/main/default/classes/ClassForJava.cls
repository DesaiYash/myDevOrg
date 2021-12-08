public class ClassForJava {
    
    public void printMsg() {
        List<String> listAll = new List<String>();
        listAll.add('abc');
        listAll.add('def');
        listAll.add('xyz');
        System.debug('listAll    '+listAll);
        
        listAll.sort();
        System.debug('listAll    '+listAll);
        
        Map<String, String> mapAll = new Map<String, String>();
        mapAll.put(null, null);
    }
    
    public void callPrintMethod() {
        printMsg();
    }

}
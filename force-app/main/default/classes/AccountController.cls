public class AccountController {
    public Integer count{get;set;}
    public Account acc{get;set;}
    public boolean isNextDis{get;set;}
    public boolean isPrevDis{get;set;}
    public String sMsg{get;set;}
    public String sValueSet{get;set;}
    private Integer limitI = 2;
    private Integer offsetI = 0;
    private Integer total = 0;
    
    public AccountController(Apexpages.StandardController sc) {
        System.debug('Constructore');
        acc = [select id,(select id from contacts) from Account where id=:sc.getRecord().id];
        isNextDis = false;
        isPrevDis = true;
    }
    
    public void actionMethod() {
        System.debug('Action');
        count = acc.contacts.size();
        total = [select count() from Account];
    }
    
    public List<Account> getAccountList() {
       if(offsetI == 0)
           isPrevDis = true;
        else
            isPrevDis = false;
        if((offsetI+limitI) >= total )
            isNextDis = true;
        else
            isNextDis = false;
       sMsg = 'Showing '+(offsetI+1)+' to '+ (offsetI+limitI) + '. Total '+total;
        return [select id, Name From Account Order By Name Limit :limitI OFFSET :offsetI];
    }
    
    public void next() {
        offsetI = offsetI + limitI;
    }
    
    public void prev() {
        offsetI = offsetI - limitI;
    }
    
    public void callActionFunction() {
        sValueSet = 'ActionFunction';
    }
    
    public void callActionSupport() {
        sValueSet = 'callActionSupport';
    }
    
    static {
        System.debug('Static');
    }
}
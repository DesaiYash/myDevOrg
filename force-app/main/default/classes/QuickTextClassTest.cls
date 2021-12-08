@isTest
public class QuickTextClassTest {

    @isTest
    public static void test1() {
        Case cs = new Case(Subject='Test', OwnerId=UserInfo.getUserId());
        insert cs;
        
        QuickTextClass.getAllQiuckText(cs.Id, 'Case');
    }
}
@isTest public class VerifyDateTest {
    
    static testmethod void checkdate1()
    {
        date d1 = date.parse('10/10/15');
        date d2 = date.parse('10/15/15');
        date d = VerifyDate.CheckDates(d1,d2);
        system.assertEquals(d2,d);
    }
    
    static testmethod void checkdate2()
    {
        date d1 = date.parse('10/10/15');
        date d2 = date.parse('11/15/15');
        date d3 = date.parse('10/31/15');
        date d = VerifyDate.CheckDates(d1,d2);
        system.assertEquals(d3,d);
    }


}
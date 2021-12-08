public class ATMCounter {
    public static void count(Integer iAmount) {
        Integer iNumber = 0;
        //if(Math.Mod(iAmount,10) == 0) {
            while(Math.Mod(iAmount,1000) >= 0 && iAmount != 0) {
                iNumber = iAmount/1000;
                if(iNumber == 0)    break;
                System.debug('1000 .....    '+iNumber);
                iAmount = iAmount - (1000*iNumber);
            }
            
            while(Math.Mod(iAmount,500) >= 0 && iAmount != 0) {
                iNumber = iAmount/500;
                if(iNumber == 0)    break;
                System.debug('500 .....    '+iNumber);
                iAmount = iAmount - (500*iNumber);
            }
            
            while(Math.Mod(iAmount,100) >= 0 && iAmount != 0) {
                iNumber = iAmount/100;
                if(iNumber == 0)    break;
                System.debug('100 .....    '+iNumber);
                iAmount = iAmount - (100*iNumber);
            }
            
            while(Math.Mod(iAmount,50) >= 0 && iAmount != 0) {
                iNumber = iAmount/50;
                if(iNumber == 0)    break;
                System.debug('50.....    '+iNumber);
                iAmount = iAmount - (50*iNumber);
            }
            
            while(Math.Mod(iAmount,20) >= 0 && iAmount != 0) {
                iNumber = iAmount/20;
                if(iNumber == 0)    break;
                System.debug('20.....    '+iNumber);
                iAmount = iAmount - (20*iNumber);
            }
            
            while(Math.Mod(iAmount,10) >= 0 && iAmount != 0) {
                iNumber = iAmount/10;
                if(iNumber == 0)    break;
                System.debug('10 .....    '+iNumber);
                iAmount = iAmount - (10*iNumber);
            }
            System.debug('Change .....    '+iAmount );
        //}
    }
}
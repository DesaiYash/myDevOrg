public class SalesPerformanceCalculator {
    date currentDate;
    Map<Integer, Decimal> mapValues;
    Decimal totalValue;
    public SalesPerformanceCalculator(Decimal m1,Decimal m2,Decimal m3,Decimal m4,Decimal m5,Decimal m6,Decimal m7,Decimal m8,Decimal m9,Decimal m10,Decimal m11,Decimal m12,Decimal total) {
        mapValues = new Map<Integer, Decimal>();
        mapValues.put(1, m1);
        mapValues.put(2, m2);
        mapValues.put(3, m3);
        mapValues.put(4, m4);
        mapValues.put(5, m5);
        mapValues.put(6, m6);
        mapValues.put(7, m7);
        mapValues.put(8, m8);
        mapValues.put(9, m9);
        mapValues.put(10, m10);
        mapValues.put(11, m11);
        mapValues.put(12, m12);
        this.totalValue = total;
        currentDate = Date.today();
    }
    
    public Decimal totalTillCurrentMonth() {
        Decimal total=0;
        for(Integer i=1; i<=currentDate.month(); i++) {                
            total = total + mapValues.get(i);
        }
        return total;
    }
    
    public Decimal totalTillLastMonth() {
        Decimal total=0;
        for(Integer i=1; i<currentDate.month(); i++) {
            total = total + mapValues.get(i);
        }
        return total;
    }
    
    public Decimal totalMonth() {            
        return this.totalValue;
    }
    
    public Decimal currentMonthValue() {
        return mapValues.get(currentDate.month());
    }
    
    public Integer currentDay() {
        return currentDate.day();
    }
    
    public Integer totalDaysInMonth() {
        return Date.daysInMonth(currentDate.year(), currentDate.month());
    }
}
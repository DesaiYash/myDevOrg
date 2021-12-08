public class TimeZoneConverter {

    public static void convertTime(String sDateTime) {
        sDateTime = '2016-07-05 11:16:01';
        DateTime dateTimeToConvert =  datetime.valueOf(sDateTime);
        //DateTime dateTimeToConvert =  DateTime.now();
        
        System.debug(' Converted Time to dateTimeToConvert is ' + dateTimeToConvert);
        System.debug(' Converted Time to dateTimeToConvert gmt is ' + DateTime.valueOfGmt(''+dateTimeToConvert));
        System.debug(' Converted Time to GMT is ' +
                  dateTimeToConvert.format('MM/dd/yyyy HH:mm:ss',
                  'GMT'));
        
        System.debug(' Converted Time to PST is ' +
                  dateTimeToConvert.format('MM/dd/yyyy HH:mm:ss',
                  'IST'));
        
        System.debug(' Converted Time to NY is ' +
                  dateTimeToConvert.format('MM/dd/yyyy HH:mm:ss',
                  'America/New_York'));
    }
    
}
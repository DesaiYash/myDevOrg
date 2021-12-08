public class StringArrayTest {
    
    public static String[] generateStringArray(Integer iCount) {
        String[] strinArr = new String[iCount];
        for(Integer i=0; i<iCount; i++) {
            strinArr[i] = 'Test ' + i;
        }
        return strinArr;
    }

}
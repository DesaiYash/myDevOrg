public class RecursiveClass {
    
    private static boolean isAllowed = true;
    
    public static boolean runOnce() {
        if(isAllowed) {
            isAllowed = false;
            return true;
        }
        return isAllowed;
    }
}
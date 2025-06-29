import com.sun.source.tree.SynchronizedTree;

public class Logger {
    private static volatile Logger onlyInstance;
    private  String DBname;

    private Logger(String name){
        this.DBname = name;
    }

    public static Logger gettheinstance(String name) {
        if(onlyInstance == null) {
            synchronized (Logger.class) {
                if (onlyInstance == null) {
                    System.out.println("Instance created once");
                    onlyInstance = new Logger(name); // Create if not yet created
                }
            }
        }
        else {
            System.out.println("Instance already created now only returning the existing instance");
        }
        return onlyInstance;
    }

    public void getAtt(){
        System.out.println("DataBase Name:" + this.DBname);
    }

    public static void main(String [] args){
        Logger l1 = Logger.gettheinstance("SQLite");
        Logger l2 = Logger.gettheinstance("Postgres");

        // Check if both are same
        System.out.println(l1 == l2);
        l1.getAtt();
    }
}

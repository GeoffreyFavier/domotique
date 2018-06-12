package facades;

import java.util.ArrayList;
import java.util.Date;

import beans.Task;

public final class Single {

    // L'utilisation du mot cl� volatile, en Java version 5 et sup�rieur, 
    // permet d'�viter le cas o� "Singleton.instance" est non nul,
    // mais pas encore "r�ellement" instanci�.
    // De Java version 1.2 � 1.4, il est possible d'utiliser la classe ThreadLocal.
    private static volatile Single instance = null;

    // D'autres attributs, classiques et non "static".
    private int toExecute;
    private Date currentDate;
    private ArrayList<Task> tasks = new ArrayList<Task>();
    
    /**
     * Constructeur de l'objet.
     */
    private Single() {
        // La pr�sence d'un constructeur priv� supprime le constructeur public par d�faut.
        // De plus, seul le singleton peut s'instancier lui-m�me.
        super();
    }
    
    /**
     * M�thode permettant de renvoyer une instance de la classe Singleton
     * @return Retourne l'instance du singleton.
     */
    public final static Single getInstance() {
        //Le "Double-Checked Singleton"/"Singleton doublement v�rifi�" permet 
        //d'�viter un appel co�teux � synchronized, 
        //une fois que l'instanciation est faite.
        if (Single.instance == null) {
           // Le mot-cl� synchronized sur ce bloc emp�che toute instanciation
           // multiple m�me par diff�rents "threads".
           // Il est TRES important.
           synchronized(Single.class) {
             if (Single.instance == null) {
               Single.instance = new Single();
             }
           }
        }
        return Single.instance;
    }

    // D'autres m�thodes classiques et non "static".
    public void addTask(Task task) {
    	if (tasks.isEmpty()) {
    		tasks.add(task);
    	} else {
    		int k = 0;
    		Date newDate = task.getDate();
    		Date oldDate = tasks.get(k).getDate();
    		while(oldDate.before(newDate)) {
    			k++;
    		}
    		tasks.add(k, task);
    	}	
    }
    
    public void countTasks() {
    	int k = 0;
    	toExecute = 0;
    	if (!tasks.isEmpty()) {
    		Date nextDate = tasks.get(0).getDate();
    		while (k < tasks.size() && nextDate.equals(tasks.get(k).getDate())) {
    			toExecute++;
    		}
    	}
    }
    
    
    public void executeTask() {
    	for (int i = 0; i < toExecute; i++) {
    		//Ex�cuter chaque t�ches
    	}
    }
    
    public int getTaskToExecute() {
    	return toExecute;
    }
}
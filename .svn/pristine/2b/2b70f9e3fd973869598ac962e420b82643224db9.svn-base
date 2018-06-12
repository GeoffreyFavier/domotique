package facades;

import java.util.ArrayList;
import java.util.Date;

import beans.Task;

public final class Single {

    // L'utilisation du mot clé volatile, en Java version 5 et supérieur, 
    // permet d'éviter le cas où "Singleton.instance" est non nul,
    // mais pas encore "réellement" instancié.
    // De Java version 1.2 à 1.4, il est possible d'utiliser la classe ThreadLocal.
    private static volatile Single instance = null;

    // D'autres attributs, classiques et non "static".
    private int toExecute;
    private Date currentDate;
    private ArrayList<Task> tasks = new ArrayList<Task>();
    
    /**
     * Constructeur de l'objet.
     */
    private Single() {
        // La présence d'un constructeur privé supprime le constructeur public par défaut.
        // De plus, seul le singleton peut s'instancier lui-même.
        super();
    }
    
    /**
     * Méthode permettant de renvoyer une instance de la classe Singleton
     * @return Retourne l'instance du singleton.
     */
    public final static Single getInstance() {
        //Le "Double-Checked Singleton"/"Singleton doublement vérifié" permet 
        //d'éviter un appel coûteux à synchronized, 
        //une fois que l'instanciation est faite.
        if (Single.instance == null) {
           // Le mot-clé synchronized sur ce bloc empêche toute instanciation
           // multiple même par différents "threads".
           // Il est TRES important.
           synchronized(Single.class) {
             if (Single.instance == null) {
               Single.instance = new Single();
             }
           }
        }
        return Single.instance;
    }

    // D'autres méthodes classiques et non "static".
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
    		//Exécuter chaque tâches
    	}
    }
    
    public int getTaskToExecute() {
    	return toExecute;
    }
}
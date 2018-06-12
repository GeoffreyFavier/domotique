package facades;

import java.util.Date;

import javax.ejb.Local;

import beans.Objet;
import beans.Task;

@Local
public interface TaskInterface {
	
	public int newTask(Date date, String method, String[] args, int idMandataire);
	
	public int addTask(Task task);
	
	public Task getTask(int id);
}

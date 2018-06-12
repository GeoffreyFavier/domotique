package facades;

import java.util.Date;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import beans.Objet;
import beans.Task;

@Stateless
public class TaskFacade implements TaskInterface {

	@PersistenceContext
	EntityManager em;
	
	public int newTask(Date date, String method, String[] args, int idMandataire){
		Objet mandataire = em.find(Objet.class, idMandataire);
		Task task = new Task(date, method, args, mandataire);
		em.persist(task);
		return task.getId();
	}
	
	public int addTask(Task task) {
		em.persist(task);
		return task.getId();
	}

	public Task getTask(int id) {
		return em.find(Task.class, id);
	}
}

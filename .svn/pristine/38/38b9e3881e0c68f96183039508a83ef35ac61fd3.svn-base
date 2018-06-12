package facades;

import java.util.ArrayDeque;
import java.util.Collection;

import javax.ejb.Schedule;
import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import beans.Task;

@Singleton
public class TaskManager {
	
	private Collection<Task> tasks = new ArrayDeque<Task>();
	private Integer toExecute = 0;
	private Long tasksNumber = (long)0;
	
	@PersistenceContext
	private EntityManager em;
	
	public Long getNumberofTasks() {
		Query query = em.createQuery("SELECT count(*) FROM Task t");
		return (long)query.getSingleResult();
	}
	
	@Schedule(second="*", minute="*/1", hour="*")
	public void executeTasks() {
		
	}
	
}
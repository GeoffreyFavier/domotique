package facades;

import java.util.List;

import javax.ejb.Local;

import beans.Objet;
import beans.User;

@Local
public interface UserInterface {
	
	public void addUser(User user);
	
	public User getUser(String login);
	
	public List<User> getUserList();
	
	public boolean isAdmin(String login);
	
	public void update(User user);
	
	public void deleteUser(String login);
	
	public boolean login(String login, String password);
	
	public int zonesUser(String login);
	
	public void addObject(String login, Objet objet);
	
	public List<User> findUserLike(String userToFind);
}

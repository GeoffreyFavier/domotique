package facades;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import beans.Objet;
import beans.User;

/**
 * Gère les liens avec la bdd
 * @author Gauthier Jolly
 *
 */
@Stateless
public class UserFacade implements UserInterface {
	@PersistenceContext
	private EntityManager bdd;
	
	/**
	 * Ajoute un utilisateur à la bdd
	 * @param user
	 */
	public void addUser(User user){
		bdd.persist(user);
	}
	
	/**
	 * Retourne l'utilisateur dont le login est "login"
	 * @param login
	 * @return user | user.getLogin().equals(login)
	 */
	public User getUser(String login){
		return bdd.find(User.class, login);
	}
	
	/**
	 * Retourne la liste des utilisateurs
	 * @return userList
	 */
	public List<User> getUserList(){
		return bdd.createQuery("select u From User u", User.class).getResultList();
	}
	
	/**
	 * Indique si l'utilisateur dont le login est donné est admin ou non
	 * @param login
	 * @return isAdmin
	 */
	public boolean isAdmin(String login){
		return bdd.find(User.class, login).getAdmin();
	}
	
	/**
	 * Met a jour la base de donnée en fonction de l'objet donné
	 * @param user
	 */
	public void update(User user){
		bdd.merge(user);
	}
	
	/**
	 * Supprime un user de la bdd
	 * @param login
	 */
	public void deleteUser(String login){
		User user = bdd.find(User.class, login);
		bdd.remove(user);
	}
	
	/**
	 * Indique si le couple login/pswd est bon
	 * @param login
	 * @param password
	 * @return true si ok, false sinon
	 */
	public boolean login(String login, String password){
		boolean result = false;
		try {
			if (bdd.find(User.class, login).getPassword().equals(password))
				result = true;
		} catch (NullPointerException e){ //si l'utilisateur n'est pas dans la bdd
			//Le resultat reste faux
		}
		return result;
	}
	
	public int zonesUser(String login){
		User user = bdd.find(User.class, login);
		return user.getZone().getId();
	}
	
	public void addObject(String login, Objet objet){
		User user = bdd.find(User.class, login);
		user.getObjets().add(objet);
	}
	
	public List<User> findUserLike(String userToFind){
		Query userList = bdd.createQuery("SELECT user FROM User user WHERE LCASE(user.login) LIKE LCASE(:input) "
				+ "OR LCASE(user.name) LIKE LCASE(:input)", User.class);
		userList.setParameter("input", "%" + userToFind + "%");
		userList.setMaxResults(5);
		return userList.getResultList();
	}
}

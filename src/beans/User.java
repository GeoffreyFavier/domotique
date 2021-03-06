package beans;

import java.util.Collection;
import java.util.Iterator;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import crypto.Hash;
/**
 * 
 * @author Gauthier Jolly
 * Décrit un utilisateur inscrit sur l'application
 */
@Entity
public class User {
	
	@Id
	private String login;
	
	private String name;
	private String email;
	private String password;
	private boolean admin;
	
	/**
	 * Zone (unique) propre a l'utilisateur. Cette zone contiendra toutes les zones que l'utilisateur créera par la suite
	 * (évite d'avoir a recoder les méthodes de Zone dans User)
	 */
	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.REMOVE)
	private Zone zonePrincipale;
	
	@OneToMany(fetch = FetchType.EAGER)
	private Collection<Objet> objets;
	
	public User(){}
	
	public User(String login, String email, String name, String password){
		this.login = login;
		this.name = name;
		this.email = email;
		this.password = Hash.sha265(password);
		this.admin = false;
	}
	
	public void setAdmin(boolean admin){
		this.admin = admin;
	}
	public boolean getAdmin(){
		return admin;
	}
	public String getPassword(){
		return password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Zone getZone() {
		return this.zonePrincipale;
	}
	
	public void setZone(Zone zone) {
		this.zonePrincipale = zone;
	}
	
	public String toString(){
		return login;
	}
	
	public Collection<Objet> getObjets(){
		return objets;
	}
	
	public Objet getObjet(int id){
		for (Iterator<Objet> iterator = this.objets.iterator(); iterator.hasNext();) {
			  Objet iObjet = (Objet) iterator.next();
			  if (iObjet.getId() == id) {
				  return iObjet;
			  }
			}
		return new Objet();
	}
	
	public void setObjets(Collection<Objet> objets){
		this.objets = objets;
	}
	
}

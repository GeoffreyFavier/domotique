package facades;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import beans.Objet;
import beans.User;
import beans.Zone;

@Stateless
public class ObjetFacade implements ObjetInterface {

	@PersistenceContext
	EntityManager bdd;
	
	public int newObjet(String name, String description, String loginOwner, int zoneId){
		User userOwner = bdd.find(User.class, loginOwner);
		Objet newObjet = new Objet(name, description, userOwner);
		bdd.persist(newObjet);
		userOwner.getObjets().add(newObjet);
		return newObjet.getId();
	}
	
	public void addObjet(Objet objet) {
		bdd.persist(objet);
	}
	
	public void removeObjet(String nom) {
		bdd.remove(bdd.find(Objet.class, nom));
	}
	
	public void addZone(int idZone, int idObjet) {
		Zone zone = bdd.find(Zone.class, idZone);
		Objet objet = bdd.find(Objet.class, idObjet);
		objet.addZone(zone);
	}
}

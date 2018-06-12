package facades;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import beans.Objet;
import beans.User;
import beans.Zone;

@Stateless
public class ZoneFacade implements ZoneInterface {
	@PersistenceContext
	private EntityManager em;
	
	public int addZone(String nom, String description){
		Zone zone = new Zone(nom, description);
		em.persist(zone);
		return zone.getId();
	}
	
	public void updateZone(Zone zone){
		em.merge(zone);
	}
	
	public Zone findZone(int id) {
		Zone zone = em.find(Zone.class, id);
		return zone;
	}
	
	public Zone getParent(int id) {
		Zone zone = findZone(id).getParent();
		return zone;
	}
	
	public void deleteZone(int id) {
		Zone zone = em.find(Zone.class, id);
		System.out.println("ZONE = " + zone.getName());
		em.remove(zone);
		//Query query = em.createNativeQuery("DELETE FROM ZONE WHERE ID = " + id);
		//query.executeUpdate();
	}
	
	public void associerZone(int idParent, int idEnfant) {
		Zone parent = findZone(idParent);
		Zone enfant = findZone(idEnfant);
		enfant.setProprietaire(parent.getProprietaire());
		enfant.setIdParent(parent);
	}

	public void setZoneRoot(int id, boolean root) {
		Zone zone = em.find(Zone.class, id);
		zone.setRoot(root);
	}

	public void setZoneProprietaire(String login, int idZone) {
		Zone zone = em.find(Zone.class, idZone);
		User proprietaire = em.find(User.class, login);
		zone.setProprietaire(proprietaire);
		proprietaire.setZone(zone);
		updateZone(zone);
	}
	
	public void addObjet(int zoneId, int objetId){
		Objet objet = em.find(Objet.class, objetId);
		Zone zone = em.find(Zone.class, zoneId);
		zone.addObjet(objet);
	}
	
}
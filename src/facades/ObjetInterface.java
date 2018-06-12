package facades;

import javax.ejb.Local;

import beans.Objet;

@Local
public interface ObjetInterface {

	public int newObjet(String name, String description, String loginOwner, int zoneId);
	
	public void addObjet(Objet objet);
	
	public void removeObjet(String nom);
	
	public void addZone(int idZone, int idObjet);
}
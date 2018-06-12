package beans;

import java.util.Collection;
import java.util.List;
import java.util.Timer;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;


@Entity
public class Objet {
	
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	private int id;
	
	private String nom;
	private String description;
	private transient Timer timer;
	
	@ManyToOne
	private User owner;
	
	@LazyCollection(LazyCollectionOption.FALSE)
	@ManyToMany
	private List<Zone> zones;
	
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(mappedBy="mandataire")
	private List<Task> tasks;
	
	
	
	public Objet() {}
	
	public Objet(String nom, String description, User owner){
		this.nom = nom;
		this.description = description;
		this.owner = owner;
	}
	
	public int getId() {
		return this.id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public void setDescription(String description){
		this.description = description;
	}
	
	public String getDescription(){
		return description;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getNom() {
		return this.nom;
	}
	
	public List<Zone> getZones(){
		return zones;
	}
	
	public void setZone(List<Zone> zones){
		this.zones = zones;
	}
	
	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	
	public List<Task> getTasks() {
		return this.tasks;
	}
	
	public Timer getTimer() {
		return this.timer;
	}
	
	public void setTimer(Timer timer) {
		this.timer = timer;
	}
	
	public void addZone(Zone zone) {
		this.zones.add(zone);
	}
	
}

package beans;
import java.util.*;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Task {
	
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	private int id;
	
	@ManyToOne
	private Objet mandataire;
	
	private Date date;
	private String method;
	private String[] args;
	
	public Task() {}
	
	public Task(Date date, String method, String[] args, Objet mandataire) {
		this.date = date;
		this.method = method;
		this.args = args;
		this.mandataire = mandataire;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
	}
	
	public void setMandataire(Objet objet) {
		this.mandataire = objet;
	}
	
	public Objet getMandataire() {
		return this.mandataire;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public Date getDate() {
		return this.date;
	}
	
	public void setMethod(String method) {
		this.method = method;
	}
	
	public String getMethod() {
		return this.method;
	}
	
	public void setArgs(String[] arguments) {
		this.args = arguments;
	}
	
	public String[] getArgs() {
		return this.args;
	}

}
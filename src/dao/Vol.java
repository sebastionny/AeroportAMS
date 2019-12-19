package dao;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

public class Vol implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer volDepart;
	private String numVol;
	private String idCompagnie;
	private String codeAerDepart;
	private String aeroportDestination;
	private Time heurePanifie;
	private Time heureEstime;
	private String statutChange;
	private String idVille;
    private Date dateVol;
	
	

	


	
	public Vol(Integer volDepart, String numVol, String idCompagnie, String codeAerDepart, String aeroportDestination,
			Time heurePanifie, Time heureEstime, String statutChange, String idVille, Date dateVol) {
		super();
		this.volDepart = volDepart;
		this.numVol = numVol;
		this.idCompagnie = idCompagnie;
		this.codeAerDepart = codeAerDepart;
		this.aeroportDestination = aeroportDestination;
		this.heurePanifie = heurePanifie;
		this.heureEstime = heureEstime;
		this.statutChange = statutChange;
		this.idVille = idVille;
		this.dateVol = dateVol;
	}







	public Integer getVolDepart() {
		return volDepart;
	}







	public void setVolDepart(Integer volDepart) {
		this.volDepart = volDepart;
	}







	public String getNumVol() {
		return numVol;
	}







	public void setNumVol(String numVol) {
		this.numVol = numVol;
	}







	public String getIdCompagnie() {
		return idCompagnie;
	}







	public void setIdCompagnie(String idCompagnie) {
		this.idCompagnie = idCompagnie;
	}







	public String getCodeAerDepart() {
		return codeAerDepart;
	}







	public void setCodeAerDepart(String codeAerDepart) {
		this.codeAerDepart = codeAerDepart;
	}







	public String getAeroportDestination() {
		return aeroportDestination;
	}







	public void setAeroportDestination(String aeroportDestination) {
		this.aeroportDestination = aeroportDestination;
	}







	public Time getHeurePanifie() {
		return heurePanifie;
	}







	public void setHeurePanifie(Time heurePanifie) {
		this.heurePanifie = heurePanifie;
	}







	public Time getHeureEstime() {
		return heureEstime;
	}







	public void setHeureEstime(Time heureEstime) {
		this.heureEstime = heureEstime;
	}







	public String getStatutChange() {
		return statutChange;
	}







	public void setStatutChange(String statutChange) {
		this.statutChange = statutChange;
	}







	public String getIdVille() {
		return idVille;
	}







	public void setIdVille(String idVille) {
		this.idVille = idVille;
	}







	public Date getDateVol() {
		return dateVol;
	}







	public void setDateVol(Date dateVol) {
		this.dateVol = dateVol;
	}







	public Vol() {}
	

	
}

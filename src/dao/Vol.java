package dao;

import java.sql.Time;
import java.util.Date;

public class Vol {
	
	private String numVol;
	private String codeAerDepart;
	private Date dateVol;
	private String aeroportDestination;
	private Time heurePanifie;
	private String idCompagnie;
	private Integer idVille;
	private Integer codeCalendrier;
	private Integer volDepart;
	
	public Vol() {}
	public String getNumVol() {
		return numVol;
	}
	public void setNumVol(String numVol) {
		this.numVol = numVol;
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
	public String getIdCompagnie() {
		return idCompagnie;
	}
	public void setIdCompagnie(String idCompagnie) {
		this.idCompagnie = idCompagnie;
	}
	public Integer getIdVille() {
		return idVille;
	}
	public void setIdVille(Integer idVille) {
		this.idVille = idVille;
	}
	public Integer getCodeCalendrier() {
		return codeCalendrier;
	}
	public void setCodeCalendrier(Integer codeCalendrier) {
		this.codeCalendrier = codeCalendrier;
	}
	public Integer getVolDepart() {
		return volDepart;
	}
	public void setVolDepart(Integer volDepart) {
		this.volDepart = volDepart;
	}
	public Date getDateVol() {
		return dateVol;
	}
	public void setDateVol(Date dateVol) {
		this.dateVol = dateVol;
	}
	public Vol(String numVol, String codeAerDepart, Date dateVol, String aeroportDestination, Time heurePanifie,
			String idCompagnie, Integer idVille, Integer codeCalendrier, Integer volDepart) {
		super();
		this.numVol = numVol;
		this.codeAerDepart = codeAerDepart;
		this.dateVol = dateVol;
		this.aeroportDestination = aeroportDestination;
		this.heurePanifie = heurePanifie;
		this.idCompagnie = idCompagnie;
		this.idVille = idVille;
		this.codeCalendrier = codeCalendrier;
		this.volDepart = volDepart;
	}

	
}

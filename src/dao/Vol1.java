package dao;

import java.util.Date;

public class Vol1 {
private String numVol;
private String codeAerDepart;
private Date dateVol;
private String aeroportDestination;
private String heurePanifie;
private String idCompagnie;
private String codeCalendrier;
private String volDepart;
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
public Date getDateVol() {
	return dateVol;
}
public void setDateVol(Date dateVol) {
	this.dateVol = dateVol;
}
public String getAeroportDestination() {
	return aeroportDestination;
}
public void setAeroportDestination(String aeroportDestination) {
	this.aeroportDestination = aeroportDestination;
}
public String getHeurePanifie() {
	return heurePanifie;
}
public void setHeurePanifie(String heurePanifie) {
	this.heurePanifie = heurePanifie;
}
public String getIdCompagnie() {
	return idCompagnie;
}
public void setIdCompagnie(String idCompagnie) {
	this.idCompagnie = idCompagnie;
}
public String getCodeCalendrier() {
	return codeCalendrier;
}
public void setCodeCalendrier(String codeCalendrier) {
	this.codeCalendrier = codeCalendrier;
}
public String getVolDepart() {
	return volDepart;
}
public void setVolDepart(String volDepart) {
	this.volDepart = volDepart;
}
public Vol1(String numVol, String codeAerDepart, Date dateVol, String aeroportDestination, String heurePanifie,
		String idCompagnie, String codeCalendrier, String volDepart) {
	super();
	this.numVol = numVol;
	this.codeAerDepart = codeAerDepart;
	this.dateVol = dateVol;
	this.aeroportDestination = aeroportDestination;
	this.heurePanifie = heurePanifie;
	this.idCompagnie = idCompagnie;
	this.codeCalendrier = codeCalendrier;
	this.volDepart = volDepart;
}
public Vol1() {}

}

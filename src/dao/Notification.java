package dao;

import java.util.Date;

public class Notification {
	
	
	private String telClient;
    private String numVol;
    private Date dateVol;
    private boolean arret;
    private Integer idNotification;
    
    
    
    public Notification() {		
	}
    
    
	public Notification(String telClient, String numVol, Date dateVol, boolean arret, Integer idNotification) {
		super();
		this.telClient = telClient;
		this.numVol = numVol;
		this.dateVol = dateVol;
		this.arret = arret;
		this.idNotification = idNotification;
	}




	public String getTelClient() {
		return telClient;
	}




	public void setTelClient(String telClient) {
		this.telClient = telClient;
	}




	public String getNumVol() {
		return numVol;
	}




	public void setNumVol(String numVol) {
		this.numVol = numVol;
	}




	public Date getDateVol() {
		return dateVol;
	}




	public void setDateVol(Date dateVol) {
		this.dateVol = dateVol;
	}




	public boolean isArret() {
		return arret;
	}




	public void setArret(boolean arret) {
		this.arret = arret;
	}




	public Integer getIdNotification() {
		return idNotification;
	}




	public void setIdNotification(Integer idNotification) {
		this.idNotification = idNotification;
	}




	@Override
	public String toString() {
		return "Notification [telClient=" + telClient + ", numVol=" + numVol + ", dateVol=" + dateVol + ", arret="
				+ arret + ", idNotification=" + idNotification + "]";
	}
    
    
    
    

	
}

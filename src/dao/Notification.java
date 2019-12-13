package dao;

import java.sql.Date;
import java.sql.Time;

public class Notification {
	
	private Integer idNotification;
	private String telClient;
    private String numVol;
    private boolean arret;
    
    
    
    public Notification() {

	}
    
   
    public Notification(Integer idNotification, String telClient, String numVol,boolean arret) {
		super();
		this.idNotification = idNotification;
		this.telClient = telClient;
		this.numVol = numVol;
		this.arret = arret;
	}
    




	public Integer getIdNotification() {
		return idNotification;
	}
	public void setIdNotification(Integer idNotification) {
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
	public boolean getArret() {
		return arret;
	}
	public void setArret(boolean arret) {
		this.arret = arret;
	}
	
    

	
}

package dao;


import java.util.Date;

public class Notification {
	
	
	private String telClient;
    private String numVol;
    private boolean arret;
    
    
    
    public Notification() {

	}
    
   
       
    
	public Notification(String telClient, String numVol, Date dateVol, boolean arret, Integer idNotification) {
		super();
		this.idNotification = idNotification;
		this.telClient = telClient;
		this.numVol = numVol;
		this.arret = arret;
	}
    

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

package services;

import java.util.Date;
import java.util.List;

import dao.Notification;
import dao.User;
import dao.Vol;
import dao.Vol1;
import dao.volajour;


/*public interface VolMetier {

	public List<Vol> getAllVols();
	public List<Vol> getVolByNumVol(String id);
	public List<Vol> getVolByComp(String comp);
	public List<Vol> getVolByDepartVol();
	public List<Vol> getVolByArriveVol();
	public List<Vol> getVolByAujVol();
	public List<Vol> getVolByDemainVol();
	public void addVol(Vol1 v);
	public void addVolaJour(volajour v);
	public User getInfoAdmin(String user, String password);
	public List<Vol> getVolByAer(String aer); 
	public void updateVol(String id,String date,String heurEst,String status);
	
	
}
*/

import java.util.Date;
import java.util.List;

import dao.Notification;
import dao.User;
import dao.Vol;
import dao.Vol1;
import dao.volajour;


public interface VolMetier {

	public List<Vol> getAllVols();
	public List<Vol> getVolByNumVol(String id);
	public List<Vol> getVolByComp(String comp);
	
	// ------ Methode Arrive et depart
	public List<Vol> getVolByDepartVol();
	public List<Vol> getVolByArriveVol();
	
	// ------ Methode Aujourd' hui et demain	
	public List<Vol> getVolByAujVol();
	public List<Vol> getVolByDemainVol();
	
	
	
	// ------ Methode Aujourd'hui
	public List<Vol> getVolByAujDepartVol();
	public List<Vol> getVolByAujArriveVol();
	
	// ------ Methode Demain
	public List<Vol> getVolByDemDepartVol();
	public List<Vol> getVolByDemArriveVol();
	
	public void addVol(Vol1 v);
	public void addVolaJour(volajour v);
	public User getInfoAdmin(String user, String password);
	public List<Vol> getVolByAer(String aer); 
	public void updateVol(String id,String date,String heurEst,String status);
	
	
}

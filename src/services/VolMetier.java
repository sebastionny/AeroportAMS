package services;

import java.util.List;

import dao.User;
import dao.Vol;
import dao.Vol1;


public interface VolMetier {

	public List<Vol> getAllVols();
	public List<Vol> getVolByNumVol(String id);
	public List<Vol> getVolByComp(String comp);
	public List<Vol> getVolByDepartVol();
	public List<Vol> getVolByArriveVol();
	public List<Vol> getVolByAujVol();
	public List<Vol> getVolByDemainVol();
	public void addVol(Vol1 v);
	public User getInfoAdmin(String user, String password);
	//public User getInfoAdmin(String user);
	
}

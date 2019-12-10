package services;

import java.util.List;

import dao.User;
import dao.Vol;
import dao.Vol1;
import dao.VolDAO;
import dao.volajour;


public class VolImplMetier implements VolMetier {
	
	private VolDAO dao;
	
	
	public List<Vol> getAllVols() {
		return dao.getAllVols();
	}

	

	public void setDao(VolDAO dao) {
		this.dao = dao;
	}


	public List<Vol> getVolByNumVol(String id) {
		// TODO Auto-generated method stub
		return  dao.getVolByNumVol(id);
	}



	public List<Vol> getVolByComp(String comp) {
		return dao.getVolByComp(comp);
	}



	public List<Vol> getVolByDepartVol() {
		// TODO Auto-generated method stub
		return dao.getVolByDepartVol();
	}



	public List<Vol> getVolByArriveVol() {
		// TODO Auto-generated method stub
		return dao.getVolByArriveVol();
	}



	public List<Vol> getVolByAujVol() {
		// TODO Auto-generated method stub
		return dao.getVolByAujVol();
	}



	public List<Vol> getVolByDemainVol() {
		// TODO Auto-generated method stub
		return dao.getVolByDemainVol();
	}



	public void addVol(Vol1 v) {
	dao.addVol(v);
		
	}
	public User getInfoAdmin(String user, String password) {
		
		return dao.getInfoAdmin(user, password);
	}



	public void addVolaJour(volajour v) {
		// TODO Auto-generated method stub
		dao.addVolaJour(v);
	}


	public List<Vol> getVolByAer(String aer) {
		return dao.getVolByAer(aer);
	}


	
}

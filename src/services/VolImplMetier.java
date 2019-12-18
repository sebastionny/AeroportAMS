/*package services;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import dao.Notification;
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



	public void updateVol(String id, String date, String heurEst, String status) {
		try {
			dao.updateVol(id, date, heurEst, status);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	
	
}*/

package services;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import dao.Notification;
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

	
	
	public List<Vol> getVolByAujDepartVol() {
		// TODO Auto-generated method stub
		return dao.getVolByAujDepartVol();
	}



	public List<Vol> getVolByAujArriveVol() {
		// TODO Auto-generated method stub
		return dao.getVolByAujArriveVol();
	}



	public List<Vol> getVolByDemDepartVol() {
		// TODO Auto-generated method stub
		return dao.getVolByDemDepartVol();
	}



	public List<Vol> getVolByDemArriveVol() {
		// TODO Auto-generated method stub
		return dao.getVolByDemArriveVol();
	}


	public void updateVol(String id, String date, String heurEst, String status) {
		try {
			dao.updateVol(id, date, heurEst, status);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	
	
}


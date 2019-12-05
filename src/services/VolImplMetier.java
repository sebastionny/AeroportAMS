package services;

import java.util.List;

import dao.Vol;
import dao.VolDAO;

public class VolImplMetier implements VolMetier {
	
	private VolDAO dao;
	
	
	public List<Vol> getAllVols() {
		return dao.getAllVols();
	}


	public void setDao(VolDAO dao) {
		this.dao = dao;
	}
	
	
}

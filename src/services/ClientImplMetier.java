package services;

import java.util.List;

import dao.Client;
import dao.ClientDAO;


public class ClientImplMetier implements ClientMetier {
	
	private ClientDAO dao;
	
	
	
	

	public ClientDAO getDao() {
		return dao;
	}





	public void setDao(ClientDAO dao) {
		this.dao = dao;
	}





	public List<Client> getAllClients() {
		// TODO Auto-generated method stub
		return dao.getAllClients();
	}





	public boolean addClient(Client c) {
		// TODO Auto-generated method stub
		return dao.addClient(c);
		
	}




	
}

package services;

import java.util.List;

import dao.client.Client;
import dao.client.ClientDAO;


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





	public void addClient(Client c) {
		// TODO Auto-generated method stub
		dao.addClient(c);
		
	}




	
}

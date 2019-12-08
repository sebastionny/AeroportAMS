package services;

import java.util.List;

import dao.client.Client;



public interface ClientMetier {

	public List<Client> getAllClients();
	public void addClient(Client c);

}

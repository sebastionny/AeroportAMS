package services;

import java.util.List;

import dao.Client;





public interface ClientMetier {

	public List<Client> getAllClients();
	public boolean addClient(Client c);

}

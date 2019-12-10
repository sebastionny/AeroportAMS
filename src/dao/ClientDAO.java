package dao;

import java.util.List;

public interface ClientDAO {
	

	public List<Client> getAllClients();
	public boolean addClient(Client c);
	

	
}


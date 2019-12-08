package dao.client;

import java.util.List;

import org.hibernate.Session;

import dao.Vol1;
import util.HibernateUtil;

public class ClientImplDataBase implements ClientDAO{


	public List<Client> getAllClients() {
		System.out.println(" Hola Methode getAllclient ");
		return null;
	}
	
	public void addClient(Client c) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(c);
		session.getTransaction().commit();
	}

	

}

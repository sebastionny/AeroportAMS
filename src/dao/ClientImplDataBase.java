package dao;

import java.util.List;

import org.hibernate.Session;

import dao.Vol1;
import util.HibernateUtil;

public class ClientImplDataBase implements ClientDAO{


	public List<Client> getAllClients() {
		System.out.println(" Hola Methode getAllclient ");
		return null;
	}
	
	public boolean addClient(Client c) {
		
		try {
			Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.save(c);
			session.getTransaction().commit();
			return true;
		}catch (Exception e){
			return false;
		}
	}

	

}

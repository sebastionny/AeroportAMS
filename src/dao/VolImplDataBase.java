package dao;

import java.util.List;

import org.hibernate.Session;

import util.HibernateUtil;

public class VolImplDataBase implements VolDAO {

	
	public List<Vol> getAllVols() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createQuery("from Vol").list();
	}

	
	
	public void init(){
		System.out.println("hibernate framework !! ");
	}
}

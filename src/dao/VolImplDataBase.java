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



	public List<Vol> getVolByNumVol(String id) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createQuery("from Vol where numVol='"+id+"'").list();
	}



	public List<Vol> getVolByComp(String id) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createQuery("from Vol where idCompagnie='"+id+"'").list();
	}



	public List<Vol> getVolByDepartVol() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createQuery("from Vol where volDepart='"+1+"'").list();
	}



	public List<Vol> getVolByArriveVol() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createQuery("from Vol where volDepart='"+0+"'").list();
	}



	public List<Vol> getVolByAujVol() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createQuery("from Vol where dateVol=current_date").list();
	}



	public List<Vol> getVolByDemainVol() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createQuery("from Vol where dateVol=current_date+1").list();
	}
}

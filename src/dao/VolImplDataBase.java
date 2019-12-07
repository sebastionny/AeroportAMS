package dao;

import java.util.List;

import org.hibernate.Session;

import util.HibernateUtil;

public class VolImplDataBase implements VolDAO{

	
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



	public void addVol(Vol1 v) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(v);
		session.getTransaction().commit();
		
	}

		public User getInfoAdmin(String user, String password) {
		
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		User adm = new User ();
		adm=(User)session.createQuery("from User where usager='"+user+"' and motdepasse='"+password+"'").uniqueResult();
		if(adm !=null) {
		return adm;
		}
		else
		
		/*User u=(User)session.load(User.class,user);
		return u;*/
		//Query query = session.createQuery(sql);
		//query.setString("username", username);
		//query.setString("password", password);
		//List<User> users = session.createQuery("from User where usager='"+user+"' and motdepasse='"+password+"'" ).list();
		//if(users.size() == 0) {
		//	return null;
		//}
		//return users.get(0);
		return null;
	
	}






}

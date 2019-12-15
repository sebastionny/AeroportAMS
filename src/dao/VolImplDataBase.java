package dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import util.HibernateUtil;

public class VolImplDataBase implements VolDAO{

	
	public List<Vol> getAllVols() {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		return session.createQuery("from Vol where dateVol=current_date or dateVol=current_date+1").list();
	}

	
	
	public void init(){
		System.out.println("hibernate framework !! ");
	}



	public List<Vol> getVolByNumVol(String id) {
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		id=id.trim();
		return session.createQuery("from Vol where numVol='"+id+"' ").list();
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
	
		return null;
	
	}



public void addVolaJour(volajour v) {
	Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
	session.beginTransaction();
	session.save(v);
	session.getTransaction().commit();
	
	
}

public List<Vol> getVolByAer(String id) {
	Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
	session.beginTransaction();
	id=id.trim();
	return session.createQuery("from Vol where aeroportDestination='"+id+"' or codeAerDepart='"+id+"'" ).list();
	}



public void updateVol(String id, String date, String heurEst, String status) throws ParseException {
	Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
	session.beginTransaction();
	// volajour vol = (volajour) session.createQuery("from volajour where numVol='"+id+"' ").uniqueResult();
	//Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(date);
	//System.out.println("la date est "+date1);
	volajour vol = (volajour) session.createQuery("from volajour where numVol='"+id+"' and dateVol='"+date+"'").uniqueResult();
	 vol.setHeureEstime(heurEst);
	 vol.setStatutChange(status);
     session.update(vol);
     session.getTransaction().commit();
     
	
}




}

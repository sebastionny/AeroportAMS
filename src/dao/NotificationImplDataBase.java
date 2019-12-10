package dao;

import java.util.List;

import org.hibernate.Session;

import util.HibernateUtil;

public class NotificationImplDataBase implements NotificationDAO{

	public List<Notification> getAllNotifications() {

		System.out.println(" HOLAAAAAAA getAllNotifications() ");

		return null;
	}

	public boolean addNotification(Notification n) {
		
		try {
			Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.save(n);
			session.getTransaction().commit();
			return true;
		}catch (Exception e){
			return false;
		}
	
	}
		


}

package services;

import java.util.List;


import dao.Notification;
import dao.NotificationDAO;
public class NotificationImplMetier implements NotificationMetier {
	
	private NotificationDAO dao;
	

	public NotificationDAO getDao() {
		return dao;
	}


	public void setDao(NotificationDAO dao) {
		this.dao = dao;
	}

	public List<Notification> getAllNotifications() {
		// TODO Auto-generated method stub
		return dao.getAllNotifications();
	}
	
	
	public boolean addNotification(Notification n) {
		// TODO Auto-generated method stub
		return dao.addNotification(n);
	}




	public List<Notification> getNotInscrit(String id, String date) {
		return dao.getNotInscrit(id, date);
	}
	
	

	
}

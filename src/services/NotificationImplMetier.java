package services;

import java.util.List;

import dao.client.Client;
import dao.notification.Notification;
import dao.notification.NotificationDAO;



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
	
	
	public void addNotification(Notification n) {
		// TODO Auto-generated method stub
		dao.addNotification(n);
	}
	
	

	
}

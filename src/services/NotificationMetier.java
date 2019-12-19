package services;

import java.util.List;

import dao.Notification;



public interface NotificationMetier {

	public List<Notification> getAllNotifications();
	public boolean addNotification(Notification n);
	public List<Notification> getNotInscrit(String id,String date);
	
}

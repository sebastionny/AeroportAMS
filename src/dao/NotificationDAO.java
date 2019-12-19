package dao;

import java.util.List;

public interface NotificationDAO {
	

	public List<Notification> getAllNotifications();


	public boolean addNotification(Notification n);
	public List<Notification> getNotInscrit(String id, String date);

	
}


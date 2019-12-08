package dao.notification;

import java.util.List;

public interface NotificationDAO {
	

	public List<Notification> getAllNotifications();

	public void addNotification(Notification n);

	
}


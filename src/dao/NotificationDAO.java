package dao;

import java.util.List;

public interface NotificationDAO {
	

	public List<Notification> getAllNotifications();
	public List<Notification> getNotInscrit(String numVol);

	public boolean addNotification(Notification n);

	
}


package controller;


import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.aspectj.weaver.ast.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import dao.Vol;
import dao.client.Client;
import dao.notification.Notification;

import services.NotificationMetier;
import services.ClientMetier;
import services.VolMetier;



@Controller
public class NotificationController  {
	
	
	@Autowired
	VolMetier servicesVol;	

	@Autowired
	NotificationMetier servicesNotification;
	@Autowired
	ClientMetier servicesClient;
	
	
	@RequestMapping(value="/suivi")
	public String pageSuivi(Model model){

		model.addAttribute("listeVols", servicesVol.getAllVols());
		model.addAttribute("listeNotification", servicesNotification.getAllNotifications());
		model.addAttribute("listeClient", servicesClient.getAllClients());
				
		return "suivi";
		
	}
	
	
}


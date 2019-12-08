package controller;


import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;


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
	

	
	// Il recupere l'information du vol a suivre
	
	@RequestMapping(value="/suiviVol")
	public String searchVol(Model model, @RequestParam String id){

		model.addAttribute("vol", servicesVol.getVolByNumVol(id));
		return "suivi";
		
	}
	
	
	// Il enregistre le client y demarre le notificación.
	@RequestMapping(value="/savesuivi")
	public String singNotification(Model model, @RequestParam String idVol, @RequestParam String telClient){
		
		model.addAttribute("vol", servicesVol.getVolByNumVol(idVol));
		
		try{	
			servicesClient.addClient(new Client(telClient));
			servicesNotification.addNotification(new Notification( new Random().nextInt(999999999) , telClient , idVol , true ));
			
			model.addAttribute("mgs", "Notification enregistrée !!!!");
		}
		
		catch (Exception e){

			model.addAttribute("mgs", "Notification pas enregistrée!!!!");
		}

		//model.addAttribute("vol", servicesVol.getVolByNumVol(id));
		return "suivi";
		
	}
	
	
}


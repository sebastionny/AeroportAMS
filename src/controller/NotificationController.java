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
import dao.Client;
import dao.Notification;

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
		String mgs= null;
		
		try{
			
			if(telClient == "" || telClient == null) {
				mgs = "Il faut avoir un numéro valide.";
				throw new Exception("Il faut avoir un numéro valide.");
			}
			if(!servicesClient.addClient(new Client(telClient)) ){
				
				if(!servicesNotification.addNotification(new Notification( new Random().nextInt(999999999) , telClient , idVol , true ))) {
					mgs = "Vous suivez déjà cette vol";
					throw new Exception("Vous suivez déjà cette vol");
				}
				mgs = "Notification enregistrée !!!!";
			};
			
			servicesNotification.addNotification(new Notification( new Random().nextInt(999999999) , telClient , idVol , true ));
			mgs = "Notification enregistrée !!!!";
		
			
			model.addAttribute("mgs", mgs);
		}
		
		catch (Exception e){

			model.addAttribute("mgs", mgs);
		}

		//model.addAttribute("vol", servicesVol.getVolByNumVol(id));
		return "suivi";
		
	}
	
	
}


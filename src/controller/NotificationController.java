package controller;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Time;
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
	
	

	public static final String ACCOUNT_SID =
            "";
    public static final String AUTH_TOKEN =
            "";
	
	// Il recupere l'information du vol a suivre
	
	@RequestMapping(value="/suiviVol")
	public String searchVol(Model model, @RequestParam String id){

		model.addAttribute("vol", servicesVol.getVolByNumVol(id));
		return "suivi";
		
	}
	
	
	// Il enregistre le client y demarre le notificación.
	@RequestMapping(value="/savesuivi")
	public String singNotification(Model model,  @RequestParam String telClient ,  @RequestParam String idVol){
		model.addAttribute("vol", servicesVol.getVolByNumVol(idVol));
		String mgs= null;
		
		try{
			
			Date date = new Date();
			System.out.println("--------> date: " + date);
			
			if(telClient == "" || telClient == null) {
				mgs = "Il faut avoir un numéro valide.";
				throw new Exception("Il faut avoir un numéro valide.");
			}
			if(!servicesClient.addClient(new Client(telClient)) ){
				
if(!servicesNotification.addNotification(new Notification( telClient , idVol , date ,true,  new Random().nextInt(999999999) ))) {
					mgs = "Vous suivez déjà cette vol";
					throw new Exception("Vous suivez déjà cette vol");
				}
				
				mgs = "Notification enregistrée !!!!";
			};
			
			servicesNotification.addNotification(new Notification( telClient , idVol , date ,false,  new Random().nextInt(999999999)));
			mgs = "Notification enregistrée !!!!";
			
			envoyer (telClient, idVol);
			model.addAttribute("mgs", mgs);

			    
			   
		
		}
		
		
		catch (Exception e){

			model.addAttribute("mgs", mgs);
		}

		//model.addAttribute("vol", servicesVol.getVolByNumVol(id));
		return "suivi";
		
	
	}
	
	 public static void envoyer (String telClient, String numVol) {
	    	
	   Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
	            Message message = Message
	                .creator(new PhoneNumber(telClient), // to
	                        new PhoneNumber(""), // from 
	                        "Vous �tes inscrit pour le vol " + numVol )
	                .create();
	        System.out.println(message.getSid());
	    	
	    }
	
	
}


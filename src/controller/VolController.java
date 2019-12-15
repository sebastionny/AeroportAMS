package controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.aspectj.weaver.ast.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import dao.Notification;
import dao.User;
import dao.Vol;
import dao.Vol1;
import dao.volajour;
import services.NotificationMetier;

import services.VolMetier;



@Controller
public class VolController  {
	 public static final String ACCOUNT_SID =
	            "AC9eded85e6aee1a5174798a7222894504";
	    public static final String AUTH_TOKEN =
	            "3004ffbf38a00dff203d190e9f036bb7";
	Timer processus1;
	boolean demarer=true;
	String Demarre="Demarrer";
	String mge="le Processus est arretÈ Cliquez sur le bouton pour le dÈmarrer";
	@Autowired
	VolMetier services;
	@Autowired
	NotificationMetier services2;
	
	

	// index.jsp
	@RequestMapping(value="/index")
	public String pageIndex(Model model){
		// trai....
		model.addAttribute("listeVols", services.getAllVols());
		return "index";
		
	}
	@RequestMapping(value="/processus")
	public String pageProcessus(Model model){
		
	if(demarer==true) {
		Demarre="Arreter";
	
		mge="le Processus est demarrÈ Cliquez sur le bouton pour l'arreter";
		demarer=false;
		processus1=new Timer();
		processus1.schedule(new TimerTask()  {
		
			@Override
			public void run()  {
				String fichier ="C:\\Users\\assia\\Desktop\\majour.txt";
				ArrayList<String> liste=new ArrayList<String>();
			
			

				//lecture du fichier texte
				try{
				  InputStream ips=new FileInputStream(fichier);
				  InputStreamReader ipsr=new InputStreamReader(ips);
				  BufferedReader br=new BufferedReader(ipsr);
				  String ligne;
				  while ((ligne=br.readLine())!=null){
					
					  liste.add(ligne);
				  }
				  br.close();
				}    
				catch (Exception e){
				
				}
				try{
				for (String l : liste) {
				String[]  mots = l.split(",");
				
				services.updateVol(mots[0], mots[1], mots[2], mots[3]);
			
				for (Notification n : services2.getNotInscrit(mots[0])) {
					
				envoyer (n.getTelClient(), mots[0],mots[2],mots[3]);
				
				}
			
				}
				liste.clear();
					
				}catch (Exception e){
					System.out.println("erreur");
				}}
		}, 1000,60*1000);
	}else {
		demarer=true;
		Demarre="Demarrer";
		mge="le Processus est arretÈ Cliquez sur le bouton pour le dÈmarrer";
		processus1.cancel();
		
		
	}
	model.addAttribute("Demarre", Demarre);
	model.addAttribute("mge", mge);
	
		
					return "espaceAdm";
			
	
		

	}

	@RequestMapping(value="/searchVol")
	public String searchVol(Model model, @RequestParam String id, @RequestParam String val){
		if(val.contentEquals("aer")) {
			model.addAttribute("listeVols", services.getVolByAer(id));
			}
		if(val.contentEquals("num")) {
		model.addAttribute("listeVols", services.getVolByNumVol(id));
		}
		if(val.contentEquals("comp")) {
		model.addAttribute("listeVols", services.getVolByComp(id));
		}
		
		return "index";
		
	}
	@RequestMapping(value="/espaceAdm")
	public String pageConnection(Model model){
		
		model.addAttribute("Demarre", Demarre);
		model.addAttribute("mge", mge);
		return "espaceAdm";
		
	}
	@RequestMapping(value="/filtreD")
	public String searchVolD(Model model){
		
		
		model.addAttribute("listeVols", services.getVolByDepartVol());
		
		return "index";
		
	}
	@RequestMapping(value="/filtreA")
	public String searchVolA(Model model){
		
		
		model.addAttribute("listeVols", services.getVolByArriveVol());
		
		return "index";
		
	}
	@RequestMapping(value="/filtreAuj")
	public String searchVolAuj(Model model){
		
		
		model.addAttribute("listeVols", services.getVolByAujVol());
		model.addAttribute("activeAuj", "btn-solid");
		model.addAttribute("titre", "AUJOURD'HUI");
		
		return "index";
		
	}
	@RequestMapping(value="/filtreDemain")
	public String searchVolDemain(Model model){
		
		
		model.addAttribute("listeVols", services.getVolByDemainVol());
		model.addAttribute("activeDem", "btn-solid");
		model.addAttribute("titre", "DEMAIN");
		
		return "index";
		
	}
	
	@RequestMapping(value="/connection")
	public String pageConnection(Model model,String nom,String motpasse){
		// trai....
		
					return "connection";
			
	
		

	}
	
	@RequestMapping(value="/chargerFichier")
	public String chargerFichier(Model model) throws ParseException{
	String fichier ="calendrier.txt";
		ArrayList<String> liste=new ArrayList<String>();
		ArrayList<Vol1> tests=new ArrayList<Vol1>();

		String chaine="";

		//lecture du fichier texte
		try{
		  InputStream ips=new FileInputStream(fichier);
		  InputStreamReader ipsr=new InputStreamReader(ips);
		  BufferedReader br=new BufferedReader(ipsr);
		  String ligne;
		  while ((ligne=br.readLine())!=null){
			
			  liste.add(ligne);
			
		  }
		  br.close();


	
		}    
		catch (Exception e){
			model.addAttribute("erreur", "Le fichier n'existe pas!");
		  return "espaceAdm";
		}
		try{
		
		for (String l : liste) {
		String[]  mots = l.split(",");
			Vol1 v=new Vol1();
			volajour va=new volajour(); 
			v.setNumVol(mots[0]);
			va.setNumVol(mots[0]);
			v.setCodeAerDepart(mots[1]);
			Date date=new SimpleDateFormat("yyyy-MM-dd").parse(mots[2]);
			v.setDateVol(date);
			va.setDateVol(date);
			v.setAeroportDestination(mots[3]);
			v.setHeurePanifie(mots[4]);
			va.setHeureEstime(mots[4]);
			v.setIdCompagnie(mots[5]);
			v.setCodeCalendrier(mots[6]);
			v.setVolDepart(mots[7]);
			if(Integer.parseInt(mots[7])==1) {
				va.setStatutChange("Depart");
			}else  {
				va.setStatutChange("Arriv√©");
			}

		
			
			services.addVol(v);
		services.addVolaJour(va);
			
		}
		model.addAttribute("erreur", "Le calendrier a √©t√© charg√© avec succ√©e!");
		}    
		catch (Exception e){
			model.addAttribute("erreur", "Le calendrier a √©t√© charg√©!");
		  return "espaceAdm";
		}
		
		

		return "espaceAdm";
	
		

}
	
	@RequestMapping(value="/espaceAdmin")
	public String espaceAdmin(Model model, @RequestParam String user, @RequestParam String password){
		String error="";
		model.addAttribute("listeAdm", services.getInfoAdmin(user,password));
		User admin= new User ();
		admin=services.getInfoAdmin(user, password);
		if(admin !=null) {
		if(admin.getUsager().contentEquals(user) && admin.getMotdepasse().contentEquals(password)) {
			return "espaceAdm";}
			else {
				error="Vous n'√©tes pas connect√©s!";
				return "connection";
			}
		
		}
		else 
			model.addAttribute("error",error);
		model.addAttribute("Demarre", Demarre);
		model.addAttribute("mge", mge);
			return "connection";
		
	
		
	}
	 public static void envoyer (String telClient, String numVol,String heureEstime,String statutChange) {
	    	
		   Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
		            Message message = Message
		                .creator(new PhoneNumber(telClient), // to
		                        new PhoneNumber("+14107775709"), // from 
		                        "\n Derniere Mise A jour du  vol " + numVol+"\n"+"Heure EstimÈe : "+heureEstime+"\n"+"Status : "+statutChange+"\n" )
		                .create();
		        System.out.println(message.getSid());
		    	
		    }
	}

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

import org.aspectj.weaver.ast.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.User;
import dao.Vol;
import dao.Vol1;
import dao.volajour;
import services.VolMetier;



@Controller
public class VolController  {
	
	@Autowired
	VolMetier services;

	// index.jsp
	@RequestMapping(value="/index")
	public String pageIndex(Model model){
		// trai....
		model.addAttribute("listeVols", services.getAllVols());
		return "index";
		
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
				va.setStatutChange("Arrivé");
			}

		
			
			services.addVol(v);
		services.addVolaJour(va);
			
		}
		model.addAttribute("erreur", "Le calendrier a été chargé avec succée!");
		}    
		catch (Exception e){
			model.addAttribute("erreur", "Le calendrier a été chargé!");
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
				error="Vous n'étes pas connectés!";
				return "connection";
			}
		
		}
		else 
			model.addAttribute("error",error);
			return "connection";
		
	
		
	}
	}

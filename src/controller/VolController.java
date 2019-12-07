package controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
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

import dao.User;
import dao.Vol;
import dao.Vol1;
//import services.ClientMetier;
//import services.NotificationMetier;
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
	//searchVol.aspx
/*	@RequestMapping(value="/searchVol")
	public String searchVol1(Model model, @RequestParam String id){
		
		model.addAttribute("listeVols", services.getVolByNumVol(id));
		
		return "index";
	}*/
	
	@RequestMapping(value="/searchVol")
	public String searchVol(Model model, @RequestParam String id, @RequestParam String val){
		
		if(val.contentEquals("num")) {
		model.addAttribute("listeVols", services.getVolByNumVol(id));
		}
		if(val.contentEquals("comp")) {
		model.addAttribute("listeVols", services.getVolByComp(id));
		}
		return "index";
		
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
			else
				error="Vous n'etes pas connect�s!";
				
				return "connection";
		
		}
		else 
			model.addAttribute("error",error);
			return "connection";

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
		
		return "index";
		
	}
	@RequestMapping(value="/filtreDemain")
	public String searchVolDemain(Model model){
		
		
		model.addAttribute("listeVols", services.getVolByDemainVol());
		
		return "index";
		
	}
	
	@RequestMapping(value="/connection")
	public String pageConnection(Model model,String nom,String motpasse){
		// trai....
		String con="";
		if(nom=="assia" && motpasse=="123")
				{
			con="vous ete connecter";
			model.addAttribute("con",con);
			return "admin";
				}else {
					con="vous n' ete pas connecter";
					model.addAttribute("con",con);
					return "connection";
				}
					
	
		
	//	model.addAttribute("a", "salut");
		
		//   /Pages/produit.jsp
	}
	@RequestMapping(value="/admin")
	public String pageConnection(){
		// trai....
		
	
		return "admin";
		//   /Pages/produit.jsp
	}
	@RequestMapping(value="/chargerFichier")
	public String chargerFichier(Model model) throws ParseException{
	String fichier ="C:\\Users\\assia\\Desktop\\fichier.txt";//C:\Users\admin\Desktop
	
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
			model.addAttribute("erreur", "Le fichier n'existe pas !!!!");
		  return "admin";
		}
	
		
		for (String l : liste) {
		String[]  mots = l.split(",");
			Vol1 v=new Vol1();
			v.setNumVol(mots[0]);
			v.setCodeAerDepart(mots[1]);
			v.setAeroportDestination(mots[2]);
			v.setCodeCalendrier(mots[3]);
		//	Date date = mots[4].;
			//v.setDateVol(date);
		/*	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
	       Date date = formatter.parse(mots[4]);
	       v.setDateVol(date);*/
		v.setHeurePanifie(mots[4]);
			v.setIdCompagnie(mots[5]);
			v.setVolDepart(mots[6]);
		try{	
			services.addVol(v);
			model.addAttribute("erreur", "Le calandrier a Charg� avec succee !!!!");
			 return "admin";
			}	catch (Exception e){
				model.addAttribute("erreur", "Le calandrier a Charg� avec succee !!!!");
			  return "admin";
			}
		}
		
	//	model.addAttribute("tests", tests);
		return "admin";

	
	}
	
		
	
	
	
	}

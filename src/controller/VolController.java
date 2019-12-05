package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.Vol;

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
	

}

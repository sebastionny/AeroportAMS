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
		//   /Pages/produit.jsp
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
		
	
		return "admin La application";
		//   /Pages/produit.jsp
	}
	

}

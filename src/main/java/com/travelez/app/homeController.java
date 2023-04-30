package com.travelez.app;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homeController {
	
	@GetMapping(value = "home.do")
	public String home(Model model, String teId) {
		System.out.println("MemberController home" + new Date());
		
		return "home";
	}
}

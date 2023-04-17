package com.scribble.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DashboardController {	
	
	@RequestMapping(value = { "/", "/dashboard" }, method = RequestMethod.GET)
	public ModelAndView dashboardPage() {
		ModelAndView model = new ModelAndView();
		model.addObject("page", "dashboard-sections/home.jsp");
		model.setViewName("dashboard");
		return model;
	}
}

package com.ximelon.xmlife.web.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("index")
public class HomeController {
	
	@RequestMapping(method=GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping("loadLifeList.do")
	public ModelAndView loadLifeList(){
		ModelAndView mav = new ModelAndView("lifeList");
		return mav;
	}

}

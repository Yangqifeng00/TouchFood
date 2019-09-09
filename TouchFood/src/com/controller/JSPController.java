package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/jspController")
public class JSPController {
	
	@RequestMapping(value="/login")
	public ModelAndView login(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping(value="/register")
	public ModelAndView register(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("register");
		return mv;
	}
	
	@RequestMapping(value="/index")
	public ModelAndView index(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(value="/buyCart")
	public ModelAndView buyCart(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("buyCart");
		return mv;
	}
}

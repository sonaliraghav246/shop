package com.niit.controller;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.back.dao.UserDAO;
import com.niit.back.dao.impl.UserDAOImpl;
import com.niit.back.model.User;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private User user;
	
	@Autowired
	private HttpSession session;
	
	
	@RequestMapping("/")
	public ModelAndView ShowHomePage()
	{
		System.out.println("Welcome to home page");
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("msg", "Welcome to shopping cart");
		return mv;
	}
	
	@RequestMapping("/login")
	public ModelAndView ShowLoginPage()
	{
		System.out.println("Welcome to login page");
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("user",user);
		mv.addObject("Isuserclickedlogin", "true");
		return mv;
	}
	
	@RequestMapping("/register")
	public ModelAndView Showregistration()
	{
		System.out.println("clicked a register page");
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("user",user);
		mv.addObject("Isuserclickedregister", "true");
		return mv;
	}
	
	@RequestMapping("/validate")
	public ModelAndView ValidateCredentials(@RequestParam("userId") String id, @RequestParam("pwd") String p) {
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("isUserloggedin", "false");
	    userDAO=new UserDAOImpl();
		if (userDAO.validate(id, p) == true) {
			mv.addObject("isUserloggedin","true");
			user = userDAO.gUserById(id);
			if (user.getRole().equals("Admin")) {
				mv.addObject("isAdmin", "true");
			} else {
				mv.addObject("isAdmin", "false");
			}
			mv.addObject("successmessage", "valid credentials");
			session.setAttribute("loginmessage", "Welcome : " + id);
		} else {
			
			mv.addObject("errormessage", "Invalid credentials..... plz try again");
		}

	return mv;
	}
	
	@RequestMapping("/logout")
	public ModelAndView Logout()
	{
		ModelAndView mv = new ModelAndView("/home");
		session.removeAttribute("loginmessage");
		return mv;
	}
}


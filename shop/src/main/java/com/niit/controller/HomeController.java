package com.niit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.tomcat.util.net.jsse.openssl.Authentication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.back.dao.ProductDAO;
import com.niit.back.dao.UserDAO;
import com.niit.back.model.Product;
import com.niit.back.model.User;



@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private User user;
	
	@Autowired
	private Product product;
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private HttpSession session;
	private static Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public ModelAndView ShowHomePage()
	{
		System.out.println("Welcome to home page");
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("msg", "Welcome to shopping cart");
		return mv;
	}
	
	@RequestMapping("/login")
	public ModelAndView ShowLoginPage(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) 
	{
		System.out.println("Welcome to login page");
		ModelAndView mv = new ModelAndView("/home");
		if (error != null) {
			mv.addObject("error", "Invalid username and password!");
		  }
		else
		{
			
		}

		  if (logout != null) {
			mv.addObject("msg", "You've been logged out successfully.");
		  }
		mv.addObject("user",user);
		mv.addObject("Isuserclickedlogin", "true");
		return mv;
	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public ModelAndView Showregistration(@Valid User user,BindingResult result)
	{
		
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("user",new User());
		mv.addObject("Isuserclickedregister", "true");
		return mv;
	}
	
	@RequestMapping("/403")
	public ModelAndView errorpage()
	{
	
		ModelAndView mv = new ModelAndView("/error");
		/*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		  if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			m.addObject("username", userDetail.getUsername());
		  }

		  model.setViewName("403");
		*/
		return mv;
	}
	
	@RequestMapping("/validate")
	public ModelAndView ValidateCredentials(@RequestParam("userId") String id, @RequestParam("pwd") String p,@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		log.debug("Welcome to administrator page");
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("isUserloggedin", "false");
		if (error != null) {
			mv.addObject("error", "Invalid username and password!");
		  }

		  if (logout != null) {
			mv.addObject("msg", "You've been logged out successfully.");
		  }
		//mv.addObject("user",user);
		mv.addObject("Isuserclickedlogin", "false");
	//	if (userDAO.validate(id, p) == true) {
			log.debug("Welcome to administrator page");
		//	mv.addObject("isUserloggedin","true");
			user = userDAO.getUserById(id);
			if(user!=null)
			{
			if (user.getRole().equals("Admin")) {
				mv.addObject("isAdmin", "true");
			} else {
				
				mv.addObject("isAdmin","false");
				mv.addObject("productlist",productDAO.getallProducts());
	
			}
			mv.addObject("successmessage", "valid credentials");
			session.setAttribute("loginmessage", "Welcome : " + id);
		} else {
			log.debug("Welcome to invalid username");
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
	
	@RequestMapping(value="/signup",method=RequestMethod.GET)
	public ModelAndView registration(@Valid User user,BindingResult result,@RequestParam("id") int id, @RequestParam("name")String name,@RequestParam("mail")String mail,@RequestParam("role")String role,@RequestParam("pwd")String p, @RequestParam("contact")String con)
	{
		ModelAndView mv = new ModelAndView("/home");
//		User user= new User();
		user.setId(id);
		user.setName(name);
		user.setPassword(p);
		user.setContact(con);
		user.setMail(mail);
		user.setRole("Employee");
		
		if(userDAO.save(user)==true)
		{
			mv.addObject("msg", "User successfully registered");
		}
		else
		{
			mv.addObject("msg","User not successfully registered");
		}
		return mv;	
	}
	
	@RequestMapping(value="/viewproducts",method=RequestMethod.GET)
	public ModelAndView listproducts()
	{
	System.out.println("view userproduct");
	ModelAndView mv = new ModelAndView("/productlist");
	//List<Product> productlist = productDAO.getallProducts();
		//model.addAttribute("product",product);
		mv.addObject("productlist",productDAO.getallProducts());
		mv.addObject("isAdmin","false");
		return mv;
	}
}


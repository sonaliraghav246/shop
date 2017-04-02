package com.niit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
					@RequestMapping("/manage_categories")
					public ModelAndView managecategories()
					{
						System.out.println("Manage Cateogories");
						ModelAndView mv = new ModelAndView();
						mv.addObject("isUserClickedCateogories","true");
						return mv;
					}
					
					@RequestMapping("/manage_products")
					public ModelAndView manageproducts()
					{
						System.out.println("Manage Products");
						ModelAndView mv = new ModelAndView();
						mv.addObject("isUserClickedProducts", "true");
						return mv;
					}
					
					@RequestMapping("/manage_suppliers")
					public ModelAndView managesuppliers()
					{
						System.out.println("Manage Suppliers");
						ModelAndView mv = new ModelAndView();
						mv.addObject("isUserClickedSupplier","true");
						return mv;
					}
}

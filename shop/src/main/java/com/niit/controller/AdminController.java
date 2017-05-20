package com.niit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.back.dao.CategoryDAO;
import com.niit.back.model.Category;

@Controller
public class AdminController {

	@Autowired
	private CategoryDAO categoryDAO;
	
	
					@RequestMapping("/manage_categories")
					public ModelAndView managecategories()
					{
						System.out.println("Manage Cateogories");
						ModelAndView mv = new ModelAndView("/Admin/adminhome");
						mv.addObject("isUserClickedCateogories","true");
						
					
						List<Category> categoryList =categoryDAO.getallCategories();
						mv.addObject("categoryList",categoryList);
						
						return mv;
					}
					
					
					@RequestMapping("/manage_products")
					public ModelAndView manageproducts()
					{
						System.out.println("Manage Products");
						ModelAndView mv = new ModelAndView("/Admin/adminhome");
						mv.addObject("isUserClickedProducts", "true");
						return mv;
					}
					
					@RequestMapping("/manage_suppliers")
					public ModelAndView managesuppliers()
					{
						System.out.println("Manage Suppliers");
						ModelAndView mv = new ModelAndView("/Admin/adminhome");
						mv.addObject("isUserClickedSupplier","true");
						return mv;
					}
}

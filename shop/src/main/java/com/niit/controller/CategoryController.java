package com.niit.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.niit.back.dao.CategoryDAO;
import com.niit.back.model.Category;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Category category;
	private static Logger log = LoggerFactory.getLogger(CategoryController.class);

	@RequestMapping(value = "/manage_categories", method = RequestMethod.GET)
	public String listCategories(Model model) {
		log.debug(" Starting of the method listCategories");
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryDAO.getallCategories());
		model.addAttribute("isUserClickedCateogories","true");
		log.debug(" End of the method listCategories");
		return "/Admin/adminhome";
	}
	
	@PostMapping("/manage_categories_add")
	public ModelAndView createcategories(@RequestParam("id") String id,@RequestParam("name") String name,@RequestParam("description")String description)
	{
		log.debug(" Starting of the addmethod");
		ModelAndView mv = new ModelAndView("redirect:/manage_categories");
		
			//new person, add it
			category.setId(id);
			category.setName(name);
			category.setDescription(description);
			categoryDAO.save(category);
			mv.addObject("messsage","Successfully Category created");
		
		
		
		//ModelAndView mv = new ModelAndView("redirect:/manage_categories");
//		if(categoryDAO.save(category))
//		{
//			mv.addObject("messsage","Successfully Category created");
//		}
//		else
//		{
//			mv.addObject("message","Not able to create category. please contact administrator");
//		}
		return mv;
	}
	@PostMapping("/manage_categories_update")
	public ModelAndView updatecategories(@ModelAttribute Category category,@RequestParam("id") String id,@RequestParam("name") String name,@RequestParam("description")String description)
	{
		log.debug(" Starting of the addmethod");
		ModelAndView mv = new ModelAndView("redirect:/manage_categories");
		
			//new person, add it
			category.setId(id);
			category.setName(name);
			category.setDescription(description);
			categoryDAO.update(category);
			mv.addObject("messsage","Successfully Category created");
		
		
		
		//ModelAndView mv = new ModelAndView("redirect:/manage_categories");
//		if(categoryDAO.save(category))
//		{
//			mv.addObject("messsage","Successfully Category created");
//		}
//		else
//		{
//			mv.addObject("message","Not able to create category. please contact administrator");
//		}
		return mv;
	}
	
	@GetMapping("/manage_categories_remove/{id}")
	public ModelAndView deletecategory(@PathVariable("id")String id)
	{
		category=categoryDAO.getCategoryByID(id);
		ModelAndView mv = new ModelAndView("redirect:/manage_categories");
		if(categoryDAO.delete(category))
		{
			mv.addObject("messsage","Successfully delete");
		}
		else
		{
			mv.addObject("message","Not able to delete category. Please comtact administrator");
		}
		return mv;
	}
			@GetMapping("/manage_categories_edit/{id}")
			public ModelAndView updatecategory(@PathVariable("id")String id)
			{
				ModelAndView mv = new ModelAndView("forward:/manage_categories");
				category=categoryDAO.getCategoryByID(id);
				/*ModelAndView mv = new ModelAndView("redirect:/manage_categories");
				mv.addObject("category",categoryDAO.getCategoryByID(id));*/
				
				
//				category.setId(id);
//				category.setName(name);
//				category.setDescription(description);
//				if(categoryDAO.update(category))
//				{
//					mv.addObject("message","Successfully update category");
//				}
//				else
//				{
//					mv.addObject("message","Not able to update category.Please contact administrator");
//				}
				return mv;
			}

}

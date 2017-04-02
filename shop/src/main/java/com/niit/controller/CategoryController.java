package com.niit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.back.dao.CategoryDAO;
import com.niit.back.model.Category;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Category category;

	public ModelAndView getallcategories()
	{
		ModelAndView mv = new ModelAndView("Admin/adminhome");
		List<Category> categoryList = categoryDAO.getallCategories();
		mv.addObject("categoryList",categoryList);
		return mv;
	}
	
	@PostMapping("/manage_categories_add")
	public ModelAndView createcategories(@RequestParam("id") String id,@RequestParam("name") String name,@RequestParam("description")String description)
	{
		category.setId(id);
		category.setName(name);
		category.setDescription(description);
		ModelAndView mv = new ModelAndView("redirect:/manage_categories");
		if(categoryDAO.save(category))
		{
			mv.addObject("messsage","Successfully Category created");
		}
		else
		{
			mv.addObject("message","Not able to create category. please contact administrator");
		}
		return mv;
	}
	
	@GetMapping("/manage_categories_remove/{id}")
	public ModelAndView deletecategory(@PathVariable("id")String id)
	{
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
			public ModelAndView updatecategory(@RequestParam("id")String id, @RequestParam("name")String name,@RequestParam("description")String description)
			{
				ModelAndView mv = new ModelAndView("redirect:/manage_categories"); 
				category.setId(id);
				category.setName(name);
				category.setDescription(description);
				if(categoryDAO.update(category))
				{
					mv.addObject("message","Successfully update category");
				}
				else
				{
					mv.addObject("message","Not able to update category.Please contact administrator");
				}
				return mv;
			}

}

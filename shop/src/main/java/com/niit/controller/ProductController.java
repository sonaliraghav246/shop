package com.niit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.back.dao.ProductDAO;
import com.niit.back.model.Product;
import com.sun.javafx.sg.prism.NGShape.Mode;

@Controller
public class ProductController {
	
	@Autowired
	private Product product;
	
	@Autowired
	private ProductDAO productDAO;
	
				public ModelAndView getallproducts()
				{
					ModelAndView mv = new ModelAndView("Admin/adminhome");
					List<Product> productlist = productDAO.getallProducts();
					mv.addObject("productlist",productlist);
					return mv;
				}
				
				@RequestMapping("/manage_products_edit")
				public ModelAndView createproduct(@RequestParam("id")String id,@RequestParam("name")String name,@RequestParam("amount")String amount,@RequestParam("quantity")String quantity)
				{
					product.setId(id);
					product.setName(name);
					product.setAmount(amount);
					product.setQuantity(quantity);
					ModelAndView mv = new ModelAndView("redirect:/manage_products");
					if(productDAO.save(product))
					{
						mv.addObject("message","successfully product created");
					}
					else
					{
						mv.addObject("message","Not able to create product");
					}
					return mv;
				}
				
				@RequestMapping("/manage_products_update/{id}")
				public ModelAndView updateproduct(@RequestParam("id")String id,@RequestParam("name")String name,@RequestParam("amount")String amount,@RequestParam("quantity")String quantity)
				{
					product.setId(id);
					product.setName(name);
					product.setAmount(amount);
					product.setQuantity(quantity);
					ModelAndView mv = new ModelAndView("redirect:/manage_products");
					if(productDAO.update(product))
					{
						mv.addObject("message","successfully product updated");
					}
					else
					{
						mv.addObject("message","Not able to update product");
					}
					return mv;
				}
				
				@RequestMapping("/manage_products_remove/{id}")
				public ModelAndView deleteproducts(@PathVariable("id")String id)
				{
					ModelAndView mv = new ModelAndView("redirect:/manage_products");
					if(productDAO.delete(product))
					{
						mv.addObject("message","Successfully deleted product");
					}
					
					else
					{
						mv.addObject("message","Not able to delete product");
					}
					return mv;
				}

}

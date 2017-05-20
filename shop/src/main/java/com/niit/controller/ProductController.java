package com.niit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
				@RequestMapping(value="/manage_products",method=RequestMethod.GET)
				public String listproducts(Model model)
				{
//					System.out.println("view product");
				//	ModelAndView mv = new ModelAndView("Admin/adminhome");
					//List<Product> productlist = productDAO.getallProducts();
					model.addAttribute("product",product);
					model.addAttribute("productlist",productDAO.getallProducts());
					model.addAttribute("isUserClickedProducts","true");
					return "/Admin/adminhome";
				}
				
				@RequestMapping("/manage_products_add")
				public ModelAndView createproduct(@RequestParam("id")String id,@RequestParam("name")String name,@RequestParam("amount")float amount,@RequestParam("quantity")int quantity,@RequestParam("price")float price)
				{
					product.setId(id);
					product.setName(name);
					product.setAmount(amount);
					product.setQuantity(quantity);
					product.setPrice(price);
					amount=price*quantity;
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
				
				@PostMapping("/manage_products_update")
				public ModelAndView updateproduct(@RequestParam("id")String id,@RequestParam("name")String name,@RequestParam("amount")float amount,@RequestParam("quantity")int quantity,@RequestParam("price")float price)
				{
					
					product.setId(id);
					product.setName(name);
					product.setAmount(amount);
					product.setQuantity(quantity);
					product.setPrice(price);
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
					product=productDAO.getProductById(id);
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
				
				@GetMapping("/manage_products_edit/{id}")
				public ModelAndView updatecategory(@PathVariable("id")String id)
				{
					ModelAndView mv = new ModelAndView("forward:/manage_products");
					product=productDAO.getProductById(id);
					/*ModelAndView mv = new ModelAndView("redirect:/manage_categories");
					mv.addObject("category",categoryDAO.getCategoryByID(id));*/
					
					
//					product.setId(id);
//					product.setName(name);
//					product.setDescription(description);
//					if(productDAO.update(product))
//					{
//						mv.addObject("message","Successfully update category");
//					}
//					else
//					{
//						mv.addObject("message","Not able to update category.Please contact administrator");
//					}
					return mv;
				}


}

package com.niit.controller;

import java.util.Date;

import org.hibernate.Session;
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

import com.niit.back.dao.CartDAO;
import com.niit.back.dao.OrderDetailDAO;
import com.niit.back.dao.ProductDAO;
import com.niit.back.dao.UserDAO;
import com.niit.back.model.Cart;
import com.niit.back.model.OrderDetail;
import com.niit.back.model.Product;
import com.niit.back.model.User;


@Controller
public class CartController {
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private Cart cart;
	@Autowired
	private User user;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private Product product;
	@Autowired
	private OrderDetail orderDetail;
	@Autowired
	private OrderDetailDAO orderDetailDAO;

	private Date orderDate;

	private float price;

	private int quantity;
	//@Autowired
	//private Session session;
	
			@GetMapping("/addtocart")
			public ModelAndView addcart(@RequestParam("id")String id,@RequestParam("name")String name, @RequestParam("price")float price,@RequestParam("quantity")int quantity,@RequestParam("amount")float amount)
			{
				ModelAndView mv = new ModelAndView("redirect:/viewcart");
				product=productDAO.getProductById(id);
				//String userid=session.getAttribute(id);
				user=userDAO.getUserById("4");
				orderDetail.setId(0);
				orderDetail.setPrice(price);
				orderDate=new Date();
				orderDetail.setOrderDate(orderDate);
				orderDetail.setPrice(price);
				orderDetail.setQuantity(quantity);
				amount=price*quantity;
				orderDetail.setAmount(amount);
				orderDetail.setProduct(product);
				cart=cartDAO.getCartById("4");
				if(cart!=null)
				{
					orderDetail.setCart(cart);
					orderDetailDAO.saveorderdetail(orderDetail);
				}
				else
				{   
					cart=new Cart();
					cart.setId("4");
					cart.setUser(user);
					cart.setCustomerAddress("");
					cart.setCustomerEmail("");
					cart.setCustomerName("");
					cart.setCustomerPhone(0);
					cartDAO.savecart(cart);
					orderDetail.setCart(cart);
					orderDetailDAO.saveorderdetail(orderDetail);
				}
				return mv;
		}
			
			@PostMapping("/cart_edit")
			public ModelAndView updatecart(@RequestParam("id")int id,@RequestParam("name")String name, @RequestParam("price")float price,@RequestParam("quantity")int quantity,@RequestParam("amount")float amount)
			{
				ModelAndView mv = new ModelAndView("redirect:/viewcart");
				orderDetail.setId(id);
				orderDetail.setQuantity(quantity);
				amount=price*quantity;
				orderDetail.setAmount(amount);
				if(orderDetailDAO.updateorderdetail(orderDetail))
				{
					mv.addObject("message","successfully order updated");
				}
				else
				{
					mv.addObject("message","Not able to update order");
				}
				return mv;
			}

			@GetMapping("/cart_remove")
			public ModelAndView removecart(@RequestParam("id")int id)
			{
				ModelAndView mv = new ModelAndView("redirect:/viewcart");
				orderDetail=orderDetailDAO.getOrderDetailById(id);
				if(orderDetailDAO.removeorderdetail(orderDetail))
				{
					mv.addObject("message","Successfully deleted order");
				}
				
				else
				{
					mv.addObject("message","Not able to delete order");
				}
				
				return mv;
			}
			
			@GetMapping("/viewcart")
			public ModelAndView OrderDetail()
			{
				ModelAndView mv = new ModelAndView("/mycart");
				//mv.addObject("orderDetail",orderDetail);
				mv.addObject("orderDetails",orderDetailDAO.getorderDetailsByCartId("4"));
				mv.addObject("isUserClickedaddtocart",true);				
				return mv;
			}
			
}
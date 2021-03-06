package com.niit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.back.dao.SupplierDAO;
import com.niit.back.model.Supplier;

public class SupplierController {
	
	@Autowired
	private Supplier supplier;
	
	@Autowired
	private SupplierDAO supplierDAO;

	
//	@RequestMapping(value = "/manage_suppliers", method = RequestMethod.GET)
//	public String listSuppliers(Model model) {
//		
//		model.addAttribute("supplier",supplier);
//		model.addAttribute("supplierlist", supplierDAO.list());
//		model.addAttribute("isUserClickedSupplier","true");
//			return "/Admin/adminhome";
//	}
//				@RequestMapping(value="/")
//				public ModelAndView getallsuppliers(ModelAndView model)
//				{
//					ModelAndView mv = new ModelAndView("Admin/adminhome");
//					List<Supplier>supplierlist=supplierDAO.list();
//					mv.addObject("supplierlist",supplierlist);
//					mv.setViewName("manage_suppliers");
//					return mv;
//				}
//				

				 @RequestMapping(value = {"/manage_suppliers" })
			       public String listsupplier(Map<String, Object> map) {

			              map.put("supplier", new Supplier());

			              map.put("suppler", supplierDAO.list());

			              return "Admin/adminhome";
			       }
				@RequestMapping("/manage_suppliers_add")
				public ModelAndView createsupplier(@RequestParam("id")String id,@RequestParam("name")String name,@RequestParam("address")String address,@RequestParam("contact")String contact)
				{
					supplier.setId(id);
					supplier.setName(name);
					supplier.setAddress(address);
					supplier.setContact(contact);
					ModelAndView mv = new ModelAndView("redirect:/manage_suppliers");
					if(supplierDAO.save(supplier))
					{
						mv.addObject("message","successfully supplier created");
					}
					else
					{
						mv.addObject("message","Not able to create supplier");
					}
					return mv;
				}
				
				@RequestMapping("/manage_suppliers_update")
				public ModelAndView updatesupplier(@RequestParam("id")String id,@RequestParam("name")String name,@RequestParam("address")String address,@RequestParam("contact")String contact)
				{
					supplier.setId(id);
					supplier.setName(name);
					supplier.setAddress(address);
					supplier.setContact(contact);
					ModelAndView mv = new ModelAndView("redirect:/manage_suppliers");
					if(supplierDAO.update(supplier))
					{
						mv.addObject("message","successfully supplier updated");
					}
					else
					{
						mv.addObject("message","Not able to update supplier");
					}
					return mv;
				}
				
				@RequestMapping("/manage_suppliers_remove/{id}")
				public ModelAndView deletesuppliers(@PathVariable("id")String id)
				{
					ModelAndView mv = new ModelAndView("redirect:/manage_suppliers");
					if(supplierDAO.delete(supplier))
					{
						mv.addObject("message","Successfully deleted supplier");
					}
					
					else
					{
						mv.addObject("message","Not able to delete supplier");
					}
					return mv;
				}
				@GetMapping("/manage_suppliers_edit/{id}")
				public ModelAndView updatecategory(@PathVariable("id")String id)
				{
					ModelAndView mv = new ModelAndView("forward:/manage_suppliers");
					supplier=supplierDAO.getSupplierById(id);
						return mv;
				}

	
}

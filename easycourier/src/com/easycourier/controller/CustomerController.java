package com.easycourier.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.easycourier.domain.Courier;
import com.easycourier.domain.Customer;
import com.easycourier.services.CommonService;
import com.easycourier.services.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	CustomerService customerService;
	
	@Autowired
	CommonService commonService;
	
	@RequestMapping("/courierBookingPage")
	public String courierBookingPage(HttpServletRequest request,Model model) {
		System.out.println("Inside CustomerController - courierBookingPage()");
		model.addAttribute("courier",new Courier());
		model.addAttribute("courierPartners",commonService.getCourierPartnetList());
		return "booking";
	}
	
	@RequestMapping(value="/courierBooking",method=RequestMethod.POST)
	public String courierBooking(HttpServletRequest request,@ModelAttribute("courier") Courier courier,Model model) {
		System.out.println("Inside CustomerController - courierBooking()");
		Customer customer=(Customer)request.getSession().getAttribute("userObject");
		courier.setModifyBy(customer.getFirstName());
		courier.setCustomerId(customer.getCustomerId().toString());
		courier.setStatus("Request Submitted");
		String redirectTo="booking";
		System.out.println(courier.toString());
		Integer transId=customerService.insertBooking(courier);
		System.out.println(transId);
		model.addAttribute("courierPartners",commonService.getCourierPartnetList());
		if(transId!=null && transId.intValue()>0){
			model.addAttribute("courier",new Courier());
			request.setAttribute("successMessage","You booking has been registered sucessfully!!!");
			request.setAttribute("orderMessage","Your Order number is "+transId);
		}else{
			model.addAttribute("courier",courier);
			request.setAttribute("errorMessage","Booking has been failed. please check ");
		}
		return redirectTo;
	}
	
	@RequestMapping("/trackOrderPage")
	public String trackOrderPage(HttpServletRequest request,Model model) {
		System.out.println("Inside CustomerController - trackOrderPage()");
		
		return "trackorder";
	}
	
	@RequestMapping("/transHistoryPage")
	public String transHistoryPage(HttpServletRequest request,Model model) {
		System.out.println("Inside CustomerController - transHistoryPage()");
		Customer customer=(Customer)request.getSession().getAttribute("userObject");
		String transId=request.getParameter("transId");
		List<Map<String,Object>> history;
		if(transId!=null && !transId.isEmpty())
			history=customerService.getTrackOrder(customer.getCustomerId(), transId);
		else
			history=customerService.getTransHistory(customer.getCustomerId());
		request.setAttribute("transHistory", history);
		return "transhistory";
	}
	
	@RequestMapping("/getRate")
	public String getRate(HttpServletRequest request,Model model,HttpServletResponse response) {
		System.out.println("Inside CustomerController - getRate()");
		String courierPartnerId = request.getParameter("courierPartnerId");
		String rate=customerService.getRate(courierPartnerId);
		System.out.println("rate=>>>"+rate);
		try {
			response.getWriter().print(rate);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}

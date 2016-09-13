package com.easycourier.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.easycourier.domain.Courier;
import com.easycourier.domain.Customer;
import com.easycourier.domain.Employee;
import com.easycourier.services.AdminService;
import com.easycourier.services.AgentService;
import com.easycourier.services.CommonService;


@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private CommonService commonService;
	
	@Autowired
	private AgentService agentService;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/auth")
	public String loadPage(HttpServletRequest request,Model model) {
		System.out.println("Inside LoginController - auth()");
		 String email=request.getParameter("email");
		 String password=request.getParameter("password");
		 String userType=request.getParameter("userType");
		 String redirectTo="";
		 
		 if(userType!=null && "customer".equalsIgnoreCase(userType)){
			 Customer customer=commonService.authendicateCustomer(email, password);
			 if(customer.isValid()){
				 request.getSession().setAttribute("userId", customer.getCustomerId());
				 request.getSession().setAttribute("userObject", customer);
				 model.addAttribute("courierPartners",commonService.getCourierPartnetList());
				 model.addAttribute("courier",new Courier());
				 redirectTo="booking";
			 }else{
				 model.addAttribute("errorMessage", "Invalid email id/password. Please try again");
				 redirectTo="login";
			 }
				System.out.println("Customer =>"+customer.toString()); 
		 }else if(userType!=null && "agent".equalsIgnoreCase(userType)){
			 Employee employee=commonService.authendicateEmployee(email, password, "AGENT");
			 if(employee.isValid()){
				 request.getSession().setAttribute("userId", employee.getEmployeeId());
				 request.getSession().setAttribute("userObject", employee);
				 List<Map<String,Object>> results=agentService.getCourierPickupRequests(employee.getEmployeeId().toString());
				 request.setAttribute("courierRequests", results);
				 redirectTo="agentcourierrequests";
			 }else{
				 model.addAttribute("errorMessage", "Invalid email id/password. Please try again");
				 redirectTo="login";
			 }
		 }else if(userType!=null && "admin".equalsIgnoreCase(userType)){
			 Employee employee=commonService.authendicateEmployee(email, password, "ADMIN");
			 if(employee.isValid()){
				 request.getSession().setAttribute("userId", employee.getEmployeeId());
				 request.getSession().setAttribute("userObject", employee);
				 List<Map<String,Object>> results=adminService.getAllCourierPickupRequests();
				 List<Map<String,Object>> agents=adminService.getAllAgents();
				 request.setAttribute("courierRequests", results);
				 request.setAttribute("agents", agents);
				 redirectTo="courierrequests";
			 }else{
				 model.addAttribute("errorMessage", "Invalid email id/password. Please try again");
				 redirectTo="login";
			 }
		 }
		 
		return redirectTo;
	}
	
	@RequestMapping("/loginPage")
	public String loginPage(HttpServletRequest request,Model model) {
		System.out.println("Inside LoginController - loginPage()");
		
		return "login";
	}
	
	@RequestMapping("/registerPage")
	public String registerPage(HttpServletRequest request,Model model) {
		System.out.println("Inside LoginController - registerPage()");
		model.addAttribute("customer", new Customer());
		return "customer_registration";
	}
	
	@RequestMapping(value="/registerUser",method=RequestMethod.POST)
	public String registerUser(@ModelAttribute("customer") Customer customer,Model model) {
		System.out.println("Inside LoginController - registerUser()");
		String redirectTo="customer_registration";
		System.out.println(customer.toString());
		Integer userId=commonService.registerCustomer(customer);
		System.out.println(userId);
		
		if(userId!=null && userId.intValue()>0){
			redirectTo="login";
			model.addAttribute("successMessage","Customer has been registered sucessfully!!!");
		}else{
			model.addAttribute("customer",customer);
			model.addAttribute("errorMessage","Registration has been failed. please check ");
		}
		return redirectTo;
	}
	
	@RequestMapping("/courierBookingPage")
	public String courierBookingPage(HttpServletRequest request,Model model) {
		System.out.println("Inside LoginController - courierBookingPage()");
		
		return "booking";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,Model model) {
		System.out.println("Inside LoginController - logout()");
		request.getSession().invalidate();
		return "booking";
	}
	
}

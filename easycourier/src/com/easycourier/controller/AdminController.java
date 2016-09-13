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

import com.easycourier.domain.Employee;
import com.easycourier.services.AdminService;


import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/allPickupRequests")
	public String pickupRequests(HttpServletRequest request,Model model) {
		System.out.println("Inside AdminController - pickupRequests()");
		Integer adminId=(Integer)request.getSession().getAttribute("userId");
		System.out.println("adminId===>"+adminId);
		List<Map<String,Object>> results=adminService.getAllCourierPickupRequests();
		List<Map<String,Object>> agents=adminService.getAllAgents();
		request.setAttribute("courierRequests", results);
		request.setAttribute("agents", agents);
		return "courierrequests";
	}
	
	@RequestMapping(value="/pickupDetails")
	public String pickupDetails(HttpServletRequest request,Model model,HttpServletResponse response) {
		System.out.println("Inside AdminController - pickupDetails()");
		String transId=request.getParameter("transId");
		JSONObject pickupDetails=adminService.pickupDetails(transId);
		try {
			response.getWriter().print(pickupDetails);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value="/updateStatus")
	public String updateStatus(HttpServletRequest request,Model model,HttpServletResponse response) {
		String transId=request.getParameter("transId");
		String status=request.getParameter("status");
		String agentid=request.getParameter("agentid");
		adminService.updateStatus(transId, status,agentid);
		try {
			response.getWriter().print("Saved");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="/addAgentPage")
	public String addAgentPage(HttpServletRequest request,Model model,HttpServletResponse response) {
		System.out.println("Inside AdminController - addAgentPage()");
		model.addAttribute("employee",new Employee());
		return "addagent";
	}
	
	@RequestMapping(value="/registerAgent")
	public String registerAgent(HttpServletRequest request,Model model,@ModelAttribute("employee") Employee employee) {
		System.out.println("Inside AdminController - registerAgent()");
		employee.setPassword("agent");
		employee.setRole("AGENT");
		System.out.println(employee.toString());
		Integer agentId=adminService.registerAgent(employee);
		if(agentId!=null & agentId.intValue()>0){
			request.setAttribute("successMessage","Agent has been registered sucessfully!!!");
			model.addAttribute("employee",new Employee());
		}else{
			request.setAttribute("errorMessage","Agent creation has been failed. please check ");
			model.addAttribute("employee",employee);
		}
		return "addagent";
	}
	
	@RequestMapping(value="/viewAgentPage")
	public String viewAgentPage(HttpServletRequest request,Model model,HttpServletResponse response) {
		System.out.println("Inside AdminController - viewAgentPage()");
		request.setAttribute("agents", adminService.getAllAgents());
		return "viewagent";
	}
}

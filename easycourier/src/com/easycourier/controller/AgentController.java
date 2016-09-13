package com.easycourier.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.easycourier.services.AgentService;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/agent")
public class AgentController {

	@Autowired
	AgentService agentService;
	
	@RequestMapping(value="/pickupRequests")
	public String pickupRequests(HttpServletRequest request,Model model) {
		System.out.println("Inside AgentController - pickupRequests()");
		Integer agentId=(Integer)request.getSession().getAttribute("userId");
		System.out.println("agentId===>"+agentId);
		List<Map<String,Object>> results=agentService.getCourierPickupRequests(agentId.toString());
		request.setAttribute("courierRequests", results);
		return "agentcourierrequests";
	}
	
	@RequestMapping(value="/pickupDetails")
	public String pickupDetails(HttpServletRequest request,Model model,HttpServletResponse response) {
		System.out.println("Inside AgentController - pickupDetails()");
		String transId=request.getParameter("transId");
		JSONObject pickupDetails=agentService.pickupDetails(transId);
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
		agentService.updateStatus(transId, status);
		try {
			response.getWriter().print("Saved");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}

package com.easycourier.services;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

@Service("AgentService")
public class AgentService {

	@Autowired
	DataSource dataSource;
	
	@Autowired
	CommonService commonService;
	
	public List<Map<String,Object>> getCourierPickupRequests(String agentId){
		String SQL="SELECT CT.TRANSACTION_ID,UD.FIRST_NAME||' '||UD.LAST_NAME AS FULL_NAME,UD.PHONE_NO,UD.ADDRESS,CT.STATUS FROM COURIER_TRANSACTION CT,USER_DETAILS UD WHERE CT.COURIER_AGENT_ID=? AND UD.CUSTOMER_ID=CT.CUSTOMER_ID";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.queryForList(SQL,agentId);
		
	}
	
	public JSONObject pickupDetails(String transId){
		String SQL="SELECT CT.TRANSACTION_ID,UD.FIRST_NAME||' '||UD.LAST_NAME as FULL_NAME,UD.PHONE_NO,UD.ADDRESS,CP.COURIER_PARTNER_NAME,CT.AMOUNT FROM "; 
			   SQL=SQL+" COURIER_TRANSACTION CT,USER_DETAILS UD, COURIER_PARTNER CP";
			   SQL=SQL+" WHERE CT.TRANSACTION_ID=? AND UD.CUSTOMER_ID=CT.CUSTOMER_ID AND CT.COURIER_CPY_ID=CP.COURIER_PARTNER_ID";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		Map<String,Object> result=jdbcTemplate.queryForMap(SQL,transId);
		return JSONObject.fromObject(result);
	}
	
	public void updateStatus(String transId,String status){
		String sql="update COURIER_TRANSACTION set status=? where TRANSACTION_ID=?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql,new Object[]{status,transId});
		
	}
}

package com.easycourier.services;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.easycourier.domain.Customer;
import com.easycourier.domain.Employee;

import net.sf.json.JSONObject;

@Service("AdminService")
public class AdminService {

	@Autowired
	DataSource dataSource;
	
	@Autowired
	CommonService commonService;
	
	public List<Map<String,Object>> getAllCourierPickupRequests(){
		String SQL="SELECT CT.TRANSACTION_ID,UD.FIRST_NAME||' '||UD.LAST_NAME as CUSTOMER_NAME,UD.PHONE_NO,UD.ADDRESS,E.EMP_FIRST_NAME||' '||E.EMP_LAST_NAME AS AGENT_NAME,CT.STATUS FROM "; 
		   SQL=SQL+" COURIER_TRANSACTION CT,USER_DETAILS UD,EMPLOYEE_DETAILS E WHERE";
		   SQL=SQL+" UD.CUSTOMER_ID=CT.CUSTOMER_ID AND E.EMPLOYEE_ID(+)=CT.COURIER_AGENT_ID";
		   System.out.println("getAllCourierPickupRequests=> "+SQL);
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.queryForList(SQL);
		
	}
	
	public JSONObject pickupDetails(String transId){
		String SQL="SELECT CT.TRANSACTION_ID,UD.FIRST_NAME||' '||UD.LAST_NAME as FULL_NAME,UD.PHONE_NO,UD.ADDRESS,CP.COURIER_PARTNER_NAME,CT.AMOUNT FROM "; 
		   SQL=SQL+" COURIER_TRANSACTION CT,USER_DETAILS UD, COURIER_PARTNER CP";
		   SQL=SQL+" WHERE CT.TRANSACTION_ID=? AND UD.CUSTOMER_ID=CT.CUSTOMER_ID AND CT.COURIER_CPY_ID=CP.COURIER_PARTNER_ID";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		Map<String,Object> result=jdbcTemplate.queryForMap(SQL,transId);
		return JSONObject.fromObject(result);
	}
	
	public void updateStatus(String transId,String status,String agentid){
		String sql="update COURIER_TRANSACTION set status=?,courier_agent_id=? where TRANSACTION_ID=?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql,new Object[]{status,agentid,transId});
		
	}
	
	public List<Map<String,Object>> getAllAgents(){
		String SQL="SELECT EMPLOYEE_ID,EMP_FIRST_NAME||' '||EMP_LAST_NAME AS FULL_NAME,EMP_GENDER,EMP_PHONE_NO,EMP_ADDRESS,EMP_EMAIL_ID FROM EMPLOYEE_DETAILS WHERE UPPER(ROLE)='AGENT'";
		   System.out.println("getAllAgents=> "+SQL);
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.queryForList(SQL);
		
	}
	
	public Integer registerAgent(Employee employee){
		
		try {
			employee.setEmployeeId(commonService.getSequenceNo("EMPLOYEE_DETAIL_SEQ"));
			String sql ="Insert into EMPLOYEE_DETAILS (EMPLOYEE_ID,EMP_FIRST_NAME,EMP_LAST_NAME,EMP_GENDER,EMP_ADDRESS,EMP_EMAIL_ID,EMP_PHONE_NO,EMP_PASSWORD,ROLE) ";
					sql=sql+" values (?,?,?,?,?,?,?,?,'AGENT')";
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			jdbcTemplate.update(sql,new Object[]{employee.getEmployeeId(),employee.getFirstName(),employee.getLastName(),
									employee.getGender(),employee.getAddress(),employee.getEmail(),employee.getPhoneno(),employee.getPassword()});
			return employee.getEmployeeId();
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
	
}

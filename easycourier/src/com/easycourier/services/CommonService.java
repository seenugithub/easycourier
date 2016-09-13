package com.easycourier.services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.easycourier.domain.Customer;
import com.easycourier.domain.Employee;


@Service("CommonService")
public class CommonService {

	@Autowired
	DataSource dataSource;
	
	public Integer getSequenceNo(String seqname){
		StringBuffer SQL = new StringBuffer();
		SQL.append("SELECT ").append(seqname).append(".nextval from dual");
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.queryForObject(SQL.toString(), Integer.class);
	}
	
	public Customer authendicateCustomer(String email,String password){
		
		Customer customer = new Customer();
			String SQL="SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME,EMAIL_ID,PHONE_NO,ADDRESS,PIN_CODE,PASSWORD FROM USER_DETAILS WHERE UPPER(EMAIL_ID)=UPPER(?) AND UPPER(PASSWORD)=UPPER(?) ";
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			Map<String, Object> resultMap = new HashMap<String, Object>();
			try {
				resultMap = jdbcTemplate.queryForMap(SQL,new Object[]{email,password});
			} catch (EmptyResultDataAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(!resultMap.isEmpty()){
				customer.setCustomerId(Integer.parseInt(resultMap.get("CUSTOMER_ID").toString()));
				customer.setFirstName((String)resultMap.get("FIRST_NAME"));
				customer.setLastName((String)resultMap.get("LAST_NAME"));
				customer.setEmailId((String)resultMap.get("EMAIL_ID"));
				//customer.setPhoneNo((String)resultMap.get("PHONE_NO"));
				customer.setAddress((String)resultMap.get("ADDRESS"));
				//customer.setPincode((String)resultMap.get("PIN_CODE"));
			}
		return customer;
	}
	
	public Employee authendicateEmployee(String email,String password,String role){
		
		Employee employee = new Employee();
			String SQL="SELECT EMPLOYEE_ID,EMP_FIRST_NAME,EMP_LAST_NAME,EMP_GENDER,EMP_ADDRESS,EMP_EMAIL_ID,EMP_PHONE_NO,ROLE FROM EMPLOYEE_DETAILS WHERE UPPER(EMP_EMAIL_ID)=UPPER(?) AND UPPER(EMP_PASSWORD)=UPPER(?) AND UPPER(ROLE)=?";
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			Map<String, Object> resultMap = new HashMap<String, Object>();
			try {
				resultMap = jdbcTemplate.queryForMap(SQL,new Object[]{email,password,role});
			} catch (EmptyResultDataAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(!resultMap.isEmpty()){
				employee.setEmployeeId(Integer.parseInt(resultMap.get("EMPLOYEE_ID").toString()));
				employee.setFirstName((String)resultMap.get("EMP_FIRST_NAME"));
				employee.setLastName((String)resultMap.get("EMP_LAST_NAME"));
				employee.setGender((String)resultMap.get("EMP_GENDER"));
				employee.setAddress((String)resultMap.get("EMP_ADDRESS"));
				employee.setEmail((String)resultMap.get("EMP_EMAIL_ID"));
				employee.setPhoneno((String)resultMap.get("EMP_PHONE"));
				employee.setRole((String)resultMap.get("ROLE"));
			}
		return employee;
	}
	
	public Integer registerCustomer(Customer customer){
		
		try {
			customer.setCustomerId(getSequenceNo("USER_DETAILS_SEQ"));
			String sql ="Insert into USER_DETAILS (CUSTOMER_ID,FIRST_NAME,LAST_NAME,EMAIL_ID,PHONE_NO,ADDRESS,PIN_CODE,PASSWORD) values (?,?,?,?,?,?,?,?)";
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			jdbcTemplate.update(sql,new Object[]{customer.getCustomerId(),
												customer.getFirstName(),customer.getLastName(),customer.getEmailId(),
												customer.getPhoneNo(),customer.getAddress(),customer.getPincode(),customer.getPassword()});
			return customer.getCustomerId();
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
	
	public Map<Integer,String> getCourierPartnetList(){
		String sql="select COURIER_PARTNER_ID,COURIER_PARTNER_NAME from Courier_Partner";
		System.out.println("getCourierPartnetList =>"+sql);
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<Map<String,Object>> result = jdbcTemplate.queryForList(sql);
		System.out.println("Result : "+result);
		Map<Integer,String> courierPartners = new LinkedHashMap<Integer,String>();
		for(Map<String,Object> map :  result){
			courierPartners.put(Integer.parseInt(map.get("COURIER_PARTNER_ID").toString()),(String) map.get("COURIER_PARTNER_NAME"));
		}
		System.out.println(courierPartners);
		return courierPartners;
	}
	
	public List<Map<String,Object>> getBill(String fromDate,String toDate) {
		StringBuffer SQL = new StringBuffer();
		SQL.append("SELECT customer_no, \n");
		SQL.append("  nvl(SUM(am_amount),0)+nvl(SUM(pm_amount),0) AS bill_amount \n");
		SQL.append("FROM govardana_milkcenter.customer_transactions \n");
		SQL.append("WHERE trans_date BETWEEN to_date(?,'DD/MM/YYYY') AND to_date(?,'DD/MM/YYYY') \n");
		//SQL.append("AND (am_amount IS NOT NULL \n");
		//SQL.append("OR pm_amount   IS NOT NULL) \n");
		SQL.append("GROUP BY customer_no \n");
		SQL.append("ORDER BY customer_no ASC");
		System.out.println("Bill Query["+fromDate+","+toDate+"] =>"+SQL);
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<Map<String,Object>> billresult = jdbcTemplate.queryForList(SQL.toString(),fromDate,toDate);
		System.out.println("Bill Result : "+billresult);
		return billresult;
	}
	
	public List<Map<String,Object>> getBillDetails(String custNo, String fromDate,String toDate) {
		StringBuffer SQL = new StringBuffer();
		SQL.append("SELECT to_char(trans_date,'DD-Mon-YYYY') as trans_date, \n");
		SQL.append("  am_qty, \n");
		SQL.append("  am_fat, \n");
		SQL.append("  am_amount, \n");
		SQL.append("  pm_qty, \n");
		SQL.append("  pm_fat, \n");
		SQL.append("  pm_amount, \n");
		SQL.append("  NVL(am_amount,0)+NVL(pm_amount,0) AS total \n");
		SQL.append("FROM govardana_milkcenter.customer_transactions \n");
		SQL.append("WHERE customer_no=? \n");
		SQL.append("AND trans_date BETWEEN to_date(?,'DD/MM/YYYY') AND to_date(?,'DD/MM/YYYY') \n");
		//SQL.append("AND (am_amount IS NOT NULL \n");
		//SQL.append("OR pm_amount   IS NOT NULL) \n");
		SQL.append("ORDER BY trans_date");
		System.out.println("getBillDetails Query["+custNo+","+fromDate+","+toDate+"] =>"+SQL);
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<Map<String,Object>> billresult = jdbcTemplate.queryForList(SQL.toString(),custNo,fromDate,toDate);
		System.out.println("Bill Result : "+billresult);
		return billresult;
	}
}

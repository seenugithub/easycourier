package com.easycourier.services;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.easycourier.domain.Courier;

@Service("CustomerService")
public class CustomerService {

	@Autowired
	DataSource dataSource;
	
	@Autowired
	CommonService commonService;
	
	public Integer insertBooking(Courier courier){
		
		try {
			courier.setTransId(commonService.getSequenceNo("COURIER_TRANSACTION_SEQ"));
			String sql ="Insert into COURIER_TRANSACTION (TRANSACTION_ID,CUSTOMER_ID,TO_NAME,TO_ADDRESS,TO_PHONE_NO,WEIGHT_GRAMS,COURIER_CPY_ID,AMOUNT,STATUS,TRANSACTION_DATE,LAST_UPDATE,LAST_MODIFY_ID) values (?,?,?,?,?,?,?,?,?,to_date(?,'YYYY-MM-DD'),sysdate,?)";
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			jdbcTemplate.update(sql,new Object[]{courier.getTransId(),courier.getCustomerId(),
					courier.getToName(),courier.getToAddress(),courier.getToPhoneNo(),
					courier.getWeight(),courier.getCourierPartnerId(),courier.getAmount(),courier.getStatus(),courier.getTransDate(),courier.getModifyBy()});
			return courier.getTransId();
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
	
	public List<Map<String,Object>> getTransHistory(Integer customerId){
		String SQL="SELECT TRANSACTION_ID, TRANSACTION_DATE,TO_NAME,TO_ADDRESS,STATUS FROM COURIER_TRANSACTION WHERE CUSTOMER_ID=?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.queryForList(SQL,customerId);
	}
	public List<Map<String,Object>> getTrackOrder(Integer customerId,String transId){
		String SQL="SELECT TRANSACTION_ID, TRANSACTION_DATE,TO_NAME,TO_ADDRESS,STATUS FROM COURIER_TRANSACTION WHERE CUSTOMER_ID=? AND TRANSACTION_ID=?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate.queryForList(SQL,customerId,transId);
	}
	
	public String getRate(String courierPartnerId){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return (String)jdbcTemplate.queryForObject("select amount from courier_partner where COURIER_PARTNER_ID=?", new Object[]{courierPartnerId},String.class);
	}
}

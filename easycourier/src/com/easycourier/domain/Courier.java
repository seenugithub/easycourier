package com.easycourier.domain;

public class Courier {

	private Integer transId;
	private String customerId;
	private String toName;
	private String toAddress;
	private String toPhoneNo;
	private String weight;
	private String courierPartnerId;
	private String amount;
	private String courierAgentId;
	private String status;
	private String transDate;
	private String modifyBy;
	
	public Integer getTransId() {
		return transId;
	}
	public void setTransId(Integer transId) {
		this.transId = transId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getToName() {
		return toName;
	}
	public void setToName(String toName) {
		this.toName = toName;
	}
	public String getToAddress() {
		return toAddress;
	}
	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}
	public String getToPhoneNo() {
		return toPhoneNo;
	}
	public void setToPhoneNo(String toPhoneNo) {
		this.toPhoneNo = toPhoneNo;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getCourierPartnerId() {
		return courierPartnerId;
	}
	public void setCourierPartnerId(String courierPartnerId) {
		this.courierPartnerId = courierPartnerId;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getCourierAgentId() {
		return courierAgentId;
	}
	public void setCourierAgentId(String courierAgentId) {
		this.courierAgentId = courierAgentId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTransDate() {
		return transDate;
	}
	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}
	
	public String getModifyBy() {
		return modifyBy;
	}
	public void setModifyBy(String modifyBy) {
		this.modifyBy = modifyBy;
	}
	@Override
	public String toString() {
		return "Courier [transId=" + transId + ", customerId=" + customerId + ", toName=" + toName + ", toAddress="
				+ toAddress + ", toPhoneNo=" + toPhoneNo + ", weight=" + weight + ", courierPartnerId="
				+ courierPartnerId + ", amount=" + amount + ", courierAgentId=" + courierAgentId + ", status=" + status
				+ ", transDate=" + transDate + ", modifyBy=" + modifyBy + "]";
	}
	
	
	
	
	
}

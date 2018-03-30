package com.expence.dto;

import java.util.Date;



public class DTO {
	private int expId;
	private double amt;
	private String amtString;
	private String type;
	private Date date;
	private String desc;
	
	private int user_id_fk;
	private String name;
	private String email;
	private String pass;
	private String mob;
	private String city;
	
	
	private int balId;
	private int totIncome;
	private int totExpense;
	private int balance;
	private String feedback;
	
	
	
	public int getBalId() {
		return balId;
	}
	public void setBalId(int balId) {
		this.balId = balId;
	}
	public int getTotIncome() {
		return totIncome;
	}
	public void setTotIncome(int totIncome) {
		this.totIncome = totIncome;
	}
	public int getTotExpense() {
		return totExpense;
	}
	public void setTotExpense(int totExpense) {
		this.totExpense = totExpense;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getAmtString() {
		return amtString;
	}
	public void setAmtString(String amtString) {
		this.amtString = amtString;
	}
	public int getUser_id_fk() {
		return user_id_fk;
	}
	public void setUser_id_fk(int user_id_fk) {
		this.user_id_fk = user_id_fk;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getMob() {
		return mob;
	}
	public void setMob(String mob) {
		this.mob = mob;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getExpId() {
		return expId;
	}
	public void setExpId(int expId) {
		this.expId = expId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public double getAmt() {
		return amt;
	}
	public void setAmt(double amt) {
		this.amt = amt;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	
}

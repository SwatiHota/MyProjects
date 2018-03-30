package com.expence.dao;

import java.util.ArrayList;

import org.jfree.chart.JFreeChart;



public interface DAO {

	

	ArrayList loginValidation(String userId, String passWrd);

	boolean saveUser(String name, String email, String pass, String mob,
			String city, String currnetDate);

	boolean saveExpense(String type, double amount, String descr,
			String currnetDate, int userId);

	ArrayList getExpenses(String currnetDate, int expRId);

	ArrayList getExpenses(String from1, String to1, int expRId);

	boolean saveTransaction(String type, double amount, String descr,
			String currnetDate, int userId);

	ArrayList getTransaction(String type, int expRId);

	public JFreeChart getChart(int userId);

	ArrayList getBalance(int userId);
	boolean savefeedback(String name, String email, String feedback);

	ArrayList getFeedback(String name, String email, String feedback);
	

}

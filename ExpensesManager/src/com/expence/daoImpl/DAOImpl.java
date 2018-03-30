package com.expence.daoImpl;

import java.awt.BasicStroke;
import java.awt.Color;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.title.Title;
import org.jfree.data.general.DefaultPieDataset;

import com.expence.dao.DAO;
import com.expence.dbconnect.DBConnect;
import com.expence.dto.DTO;

public class DAOImpl implements DAO {

	DBConnect db=new DBConnect();

	@Override
	public ArrayList loginValidation(String userId, String passWrd) {
		ArrayList details = new ArrayList();

		DBConnect db = null;
		String QUERRY = "SELECT * FROM user_details WHERE email='"+userId+"' AND pass='"+passWrd+"' ";
		ResultSet rs = null;
		try{
			db = new DBConnect();
			Statement stmt = db.connect();
			rs = stmt.executeQuery(QUERRY);

			if(rs.next())
			{
				//valid user
				DTO dto = new DTO();
				dto.setExpId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setMob(rs.getString("mob"));
				dto.setCity(rs.getString("city"));
				details.add(dto);
			}
			else
			{
				//not valid
				details.clear();
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
		finally{
			db.close();
			try 
			{
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return details;
	}

	@Override
	public boolean saveUser(String name, String email, String pass, String mob,
			String city, String currnetDate) {
		boolean b=false;
		try
		{

			Statement st=db.connect(); 
			ResultSet rs=st.executeQuery("select * from user_details where email='"+email+"'");
			if(rs.next())
			{
				b=false;
			}
			else
			{
				st.executeUpdate("insert into user_details (name,email,pass,mob,city,reg_date) values('"+name+"','"+email+"','"+pass+"','"+mob+"','"+city+"','"+currnetDate+"')");	
				b=true;
			} 

		}
		catch(Exception e)
		{
			System.out.println(e); 
		}
		finally{
			db.close(); 
		}

		return b;
	}

	@Override
	public boolean saveExpense(String type, double amount, String descr, String currnetDate, int userId) {
		boolean b=false;
		double balance = 0;
		double income = 0;
		double expense = 0;
		try
		{

			Statement st=db.connect();  
			st.executeUpdate("insert into expenses (user_id_fk,type,date,amount,description) values('"+userId+"','"+type+"','"+currnetDate+"','"+amount+"','"+descr+"')");
			
			//update balance
			Statement st1=db.connect(); 
			ResultSet rs = st1.executeQuery("SELECT balance,total_income,total_expense FROM balance WHERE user_id_fk='"+userId+"' AND bal_id =(SELECT MAX(bal_id) FROM balance WHERE user_id_fk='"+userId+"')");
			while(rs.next())
			{
				balance = rs.getInt("balance");
				expense = rs.getInt("total_expense");
				income = rs.getInt("total_income");
			}
			
			 
			balance = balance - amount;
			expense = expense + amount;
			
			Statement st3=db.connect(); 
			st3.executeUpdate("INSERT INTO balance (user_id_fk,date,total_income,total_expense,balance) VALUES('"+userId+"','"+currnetDate+"','"+income+"','"+expense+"','"+balance+"')");
			
			b=true;

		}
		catch(Exception e)
		{
			System.out.println(e); 
		}
		finally{
			db.close(); 
		}

		return b;
	}

	@Override
	public ArrayList getExpenses(String currnetDate, int expRId) {
		ArrayList details = new ArrayList();

		DBConnect db = null;
		String QUERRY = "SELECT * FROM expenses WHERE date='"+currnetDate+"' AND user_id_fk='"+expRId+"' ORDER BY exp_id DESC";
		ResultSet rs = null;
		try{
			db = new DBConnect();
			Statement stmt = db.connect();
			rs = stmt.executeQuery(QUERRY);

			while(rs.next())
			{
				DTO dto = new DTO();
				dto.setExpId(rs.getInt("exp_id"));
				dto.setType(rs.getString("type"));
				dto.setDate(rs.getDate("date"));
				dto.setAmt(rs.getInt("amount"));
				dto.setDesc(rs.getString("description"));
				Statement stmt2 = db.connect();
				ResultSet rs2 = stmt2.executeQuery("SELECT * FROM balance WHERE user_id_fk='"+expRId+"' AND bal_id =(SELECT MAX(bal_id) FROM balance WHERE user_id_fk='"+expRId+"')");
				while(rs2.next())
				{
					dto.setTotIncome(rs2.getInt("total_income"));
					dto.setTotExpense(rs2.getInt("total_expense"));
					dto.setBalance(rs2.getInt("balance"));
				}
				details.add(dto);
			}


		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
		finally{
			db.close();
			
		}

		return details;
	}

	@Override
	public ArrayList getExpenses(String from1, String to1, int expRId) {
		ArrayList details = new ArrayList();

		DBConnect db = null;
		String QUERRY = "SELECT * FROM expenses WHERE date BETWEEN '"+from1+"' AND '"+to1+"' AND user_id_fk='"+expRId+"' ORDER BY date DESC";
		ResultSet rs = null;
		try{
			db = new DBConnect();
			Statement stmt = db.connect();
			rs = stmt.executeQuery(QUERRY);

			while(rs.next())
			{
				DTO dto = new DTO();
				dto.setExpId(rs.getInt("exp_id"));
				dto.setType(rs.getString("type"));
				dto.setDate(rs.getDate("date"));
				dto.setAmt(rs.getInt("amount"));
				dto.setDesc(rs.getString("description"));
				
				Statement stmt2 = db.connect();
				ResultSet rs2 = stmt2.executeQuery("SELECT * FROM balance WHERE user_id_fk='"+expRId+"' AND bal_id =(SELECT MAX(bal_id) FROM balance WHERE user_id_fk='"+expRId+"')");
				while(rs2.next())
				{
					dto.setTotIncome(rs2.getInt("total_income"));
					dto.setTotExpense(rs2.getInt("total_expense"));
					dto.setBalance(rs2.getInt("balance"));
				}
				details.add(dto);
			}


		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
		finally{
			db.close();
			
		}

		return details;
	}

	@Override
	public boolean saveTransaction(String type, double amount, String descr,
			String currnetDate, int userId) {
		boolean b=false;
		double balance = 0;
		double income = 0;
		double expense = 0;
		System.out.println("description in method .... "+descr);
		try
		{

			Statement st=db.connect(); 
			ResultSet rs = st.executeQuery("SELECT balance,total_income,total_expense FROM balance WHERE user_id_fk='"+userId+"' AND bal_id =(SELECT MAX(bal_id) FROM balance WHERE user_id_fk='"+userId+"')");
			while(rs.next())
			{
				balance = rs.getInt("balance");
				expense = rs.getInt("total_expense");
				income = rs.getInt("total_income");
			}
			
			System.out.println("balance value ------- "+balance);
			System.out.println("type value ------- "+type);
			
			System.out.println("total expense ------- "+expense);
			
			if(type.equals("Credit"))
			{
				System.out.println("inside Credit ");
				balance = balance + amount;
				income = income + amount;
			}
			else 
			{
				System.out.println("inside Debit ");
				balance = balance - amount;
				expense = expense + amount;
			}
			
			//
			Statement st3=db.connect(); 
			st3.executeUpdate("INSERT INTO balance (user_id_fk,date,total_income,total_expense,balance) VALUES('"+userId+"','"+currnetDate+"','"+income+"','"+expense+"','"+balance+"')");
			
			//
			Statement st2=db.connect(); 
			st2.executeUpdate("INSERT INTO transaction (user_id_fk,type,date,amount,descr) VALUES('"+userId+"','"+type+"','"+currnetDate+"','"+amount+"','"+descr+"')");
			
			
			b=true;

		}
		catch(Exception e)
		{
			System.out.println(e); 
		}
		finally{
			db.close(); 
		}

		return b;
	}
	public ArrayList getFeedback(String name, String email, String feedback)
	{
		ArrayList details = new ArrayList();

		DBConnect db = null;
		String QUERRY = "SELECT * FROM feedback WHERE name='"+name+"'email='"+email+"''feedback='"+feedback+"'";
		ResultSet rs = null;
		try{
			db = new DBConnect();
			Statement stmt = db.connect();
			rs = stmt.executeQuery(QUERRY);
			while(rs.next()){
				DTO dto = new DTO();
				
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setFeedback(rs.getString("feedback"));
				
				details.add(dto);
			}
		}
		catch(Exception e)
		{
			
		}
		return details;
	}
			
	@Override
	public ArrayList getTransaction(String type, int expRId) {
		ArrayList details = new ArrayList();

		DBConnect db = null;
		String QUERRY = "SELECT * FROM transaction WHERE type='"+type+"' AND user_id_fk='"+expRId+"' ORDER BY date DESC";
		ResultSet rs = null;
		try{
			db = new DBConnect();
			Statement stmt = db.connect();
			rs = stmt.executeQuery(QUERRY);

			while(rs.next())
			{
				DTO dto = new DTO();
				dto.setExpId(rs.getInt("tr_id"));
				dto.setType(rs.getString("type"));
				dto.setDate(rs.getDate("date"));
				dto.setAmt(rs.getInt("amount"));
				dto.setDesc(rs.getString("descr"));
				Statement stmt2 = db.connect();
				ResultSet rs2 = stmt2.executeQuery("SELECT * FROM balance WHERE user_id_fk='"+expRId+"' AND bal_id =(SELECT MAX(bal_id) FROM balance WHERE user_id_fk='"+expRId+"')");
				while(rs2.next())
				{
					dto.setTotIncome(rs2.getInt("total_income"));
					dto.setTotExpense(rs2.getInt("total_expense"));
					dto.setBalance(rs2.getInt("balance"));
				}
				
				details.add(dto);
			}


		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
		finally{
			db.close();
			try 
			{
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return details;
	}

	public JFreeChart getChart(int userId) {
		DefaultPieDataset dataset = new DefaultPieDataset();
		
		////////////////////// DB operation
		
		
		ArrayList eDetails = getallExpenses(userId);
		
		
		
		for(Object o:eDetails){
			DTO dt = (DTO) o;
			dataset.setValue(dt.getType(), dt.getAmt());
		}
		
		

		////////////////////// DB operation ends
		
		
		

		boolean legend = true;
		boolean tooltips = false;
		boolean urls = false;

		JFreeChart chart = ChartFactory.createPieChart(" Expenses", dataset, legend, tooltips, urls);

		chart.setBorderPaint(Color.GRAY);
		chart.setBorderStroke(new BasicStroke(5.0f));
		chart.setBorderVisible(true);
		

		return chart;
	}

	private ArrayList getallExpenses(int userId) {
		ArrayList balDetails =new ArrayList();
		DBConnect db = null;
		String QUERRY = "SELECT * FROM expenses where user_id_fk='"+userId+"'";
		ResultSet rs = null;
		try{
			db = new DBConnect();
			Statement stmt = db.connect();
			rs = stmt.executeQuery(QUERRY);

			while(rs.next())
			{
				DTO dto = new DTO();
				dto.setType(rs.getString("type"));
				dto.setAmt(rs.getDouble("amount"));
				
				balDetails.add(dto);
			}


		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
		finally{
			db.close();
			try 
			{
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return balDetails;
	}
	public boolean savefeedback(String name, String email, String feedback) {
		boolean b=false;
		try
		 {
			DBConnect db=new DBConnect();
			Statement st=db.connect();  
			st.executeUpdate("insert into feedback (email,name,feedback) values('"+email+"','"+name+"','"+feedback+"')");
			b=true;
			db.close(); 		 
		 }
		 catch(Exception e)
		 {
			 System.out.println(e); 
		 }
		return b;
	}

	@Override
	public ArrayList getBalance(int userId) {
		
		
		
		ArrayList balDetails =new ArrayList();
		DBConnect db = null;
		String QUERRY = "SELECT * FROM balance WHERE user_id_fk='"+userId+"' ORDER BY bal_id DESC LIMIT 1";
		ResultSet rs = null;
		try{
			db = new DBConnect();
			Statement stmt = db.connect();
			rs = stmt.executeQuery(QUERRY);

			while(rs.next())
			{
				DTO dto = new DTO();
				dto.setBalId(rs.getInt("bal_id"));
				dto.setUser_id_fk(rs.getInt("user_id_fk"));
				dto.setDate(rs.getDate("date"));
				dto.setTotIncome(rs.getInt("total_income"));
				dto.setTotExpense(rs.getInt("total_expense"));
				dto.setBalance(rs.getInt("balance"));
				
				balDetails.add(dto);
			}


		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
		finally{
			db.close();
			try 
			{
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return balDetails;
	}

}

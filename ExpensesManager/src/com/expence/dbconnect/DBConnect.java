package com.expence.dbconnect;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class DBConnect {
	Statement stmt = null;
	Connection con = null;
	
	public Statement connect() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3307/expensesmanager", "root", "root");
		stmt = con.createStatement();
		
		return stmt;
	}
	
	public void close(){
		try{
			if (con != null) {
				con.close();
			}
			if (stmt != null){
				stmt.close();
			}
		}
		catch(SQLException sqle){
			sqle.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}

package com.expence.action;


import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;

import com.expence.dao.DAO;
import com.expence.daoImpl.DAOImpl;
import com.expence.dto.DTO;
import com.expence.validation.FieldValidationImplementedClass;
import com.expence.validation.FieldValidationInterface;


public class AllAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DAO dao = null;
	
	FieldValidationInterface val = null;

	@Override
	public void init() throws ServletException {
		dao = new DAOImpl();
		val = new FieldValidationImplementedClass(); 
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("URL IS ::: "+uri);
		HttpSession session = request.getSession(true);

		ArrayList details = null;
		RequestDispatcher rd = null;



		if(uri.equals("/ExpensesManager/login.do"))
		{
			String email = request.getParameter("email").trim();
			String pass = request.getParameter("pass").trim();

			if(email.equals("") || pass.equals(""))
			{
				String error = null;
				error = "All fields are mandatory";
				request.setAttribute("error", error);
				rd = request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
			}
			else
			{
				ArrayList details1 = dao.loginValidation(email, pass);
				if(details1.isEmpty())
				{
					String error = null;
					error = "User ID or Password mismatch";
					request.setAttribute("error", error);
					rd = request.getRequestDispatcher("Login.jsp");
					rd.forward(request, response);
				}
				else
				{
					String userName = null;
					String userEmail = null;
					int rowId = 0;
					for(Object o : details1)
					{
						DTO dto = (DTO) o;
						userName = dto.getName();
						userEmail = dto.getEmail();
						rowId = dto.getExpId();
						
					}


					session.setAttribute("userName", userName);
					session.setAttribute("userEmail", userEmail);
					session.setAttribute("rowId", rowId);
					
					rd = request.getRequestDispatcher("Home.jsp");
					rd.forward(request, response);

				}
			}
		}

		if(uri.equals("/ExpensesManager/logout.do"))
		{
			session.removeValue("userName");
			session.removeAttribute("userName");
			session.removeValue("userEmail");
			session.removeAttribute("userEmail");
			session.removeValue("rowId");
			session.removeAttribute("rowId");
			session.invalidate();
			response.sendRedirect("index.jsp");
		}


		if(uri.equals("/ExpensesManager/addexpenses.do"))
		{
			String type = request.getParameter("type");
			String amt = request.getParameter("amount");
			String descr = request.getParameter("descr");
			System.out.println("type-------> "+type);
			System.out.println("descr-------> "+descr);
			
			ArrayList error=new ArrayList();
			

			int i=0;
			boolean b=false;


			if(type.equals("Select")||amt.equals("")||descr.equals("")){
				error.add("All star (*) mark field are mandatory");
				i++;
				System.out.println("Error 1");
			}


			double amount = Double.parseDouble(amt);
			DTO dt=new DTO();
			dt.setType(type);
			dt.setAmt(amount);
			dt.setDesc(descr);
			
			int userId = (int) session.getAttribute("rowId");


			if(error.isEmpty())
			{
				boolean dupl = false; 
				
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date();
				String currnetDate = (dateFormat.format(date));
				
				dupl = dao.saveExpense(type, amount, descr, currnetDate, userId);
				System.out.println("Came back to servlet after saving");
				if(dupl)
				{
					String successMsg = null;
					rd = request.getRequestDispatcher("AddExpenses.jsp");
					rd.forward(request, response);
				}
				else
				{
					String errorMsg2 = "server problem please try again.";
					request.setAttribute("error", errorMsg2);
					request.setAttribute("bean", dt);
					rd = request.getRequestDispatcher("AddExpenses.jsp");
					rd.forward(request, response);
					
				}
			}
			else
			{

				System.out.println("in side else");
				request.setAttribute("error", error);
				request.setAttribute("bean",dt);
				rd=request.getRequestDispatcher("AddExpenses.jsp");
				rd.forward(request, response);
			}


		}


		if(uri.equals("/ExpensesManager/register.do"))
		{
			String name = request.getParameter("name").trim();
			String email = request.getParameter("email").trim();
			String pass = request.getParameter("pass").trim();
			String mob = request.getParameter("mob").trim();
			String city = request.getParameter("city").trim();

			
			System.out.println("name-------> "+name);
			System.out.println("city-------> "+city);
			System.out.println("mob-------> "+mob);





			ArrayList error=new ArrayList();

			DTO dt=new DTO();
			dt.setName(name);
			dt.setEmail(email);
			dt.setPass(pass);
			dt.setMob(mob);
			dt.setCity(city);

			int i=0;
			boolean b=false;


			if(name.equals("")||email.equals("")||pass.equals("")||mob.equals("")||city.equals("")){
				error.add("All star (*) mark field are mandatory");
				i++;
				System.out.println("Error 1");
			}



			b=val.name(name);
			if(b==false && i==0){
				i++;
				error.add("* Enter valid Name between 3-10 alphabets");
				System.out.println("Error 2");
			}
			b=val.email(email);
			if(b==false && i==0){
				i++;
				error.add("* Enter valid Email address");
				System.out.println("Error 3");
			}
			b=val.mobile(mob);
			if(b==false && i==0){
				i++;
				error.add("* Enter valid Mobile between 10 Digit");
				System.out.println("Error 4");
			}

			b=val.name(city);
			if(b==false && i==0){
				i++;
				error.add("* Enter valid City between 3-10 alphanumeric");
				System.out.println("Error 5");
			}

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String currnetDate = (dateFormat.format(date));

			if(error.isEmpty())
			{
				boolean dupl = false; // for duplication
				dupl = dao.saveUser(name, email, pass, mob, city, currnetDate);
				System.out.println("Came back to servlet after saving");
				if(dupl)
				{
					String successMsg = null;
					successMsg = "Registration successfull..! Now you can login using your E-mail and password";
					request.setAttribute("successMsg", successMsg);
					rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
				}
				else
				{
					String errorMsg2 = "User E-mail ID is already registered.";
					request.setAttribute("error", errorMsg2);
					request.setAttribute("bean", dt);
					rd = request.getRequestDispatcher("Register.jsp");
					rd.forward(request, response);
					
				}
			}
			else
			{

				System.out.println("in side else");
				request.setAttribute("error", error);
				request.setAttribute("bean",dt);
				rd=request.getRequestDispatcher("Register.jsp");
				rd.forward(request, response);
			}


		}


		if(uri.equals("/ExpensesManager/viewexpences.do"))
		{
			String type = request.getParameter("category");
			
			if(type.equals("daily"))
			{
				//daily view
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date();
				String currnetDate = (dateFormat.format(date));
				
				int expRId = (int) session.getAttribute("rowId");
				
				details = dao.getExpenses(currnetDate, expRId);
				
				request.setAttribute("daily", "daily");
				request.setAttribute("details", details);
				rd=request.getRequestDispatcher("ViewExpenses.jsp");
				rd.forward(request, response);
				
			}
			else if(type.equals("2"))
			{
				//monthly view
				
			}
			else
			{
				//yearly view
				
			}
			
		}
		


		if(uri.equals("/ExpensesManager/feedback.do"))
		{
			String email=request.getParameter("email");
			String name=request.getParameter("name");
			String feedback=request.getParameter("feedback");
			System.out.println(""+email);
			System.out.println(""+name);
			System.out.println(""+feedback);
			boolean b;
			b=dao.savefeedback(email,name,feedback);
			//String success="null";
			request.setAttribute("success","Your Feedback is successfully saved!"); 
			rd=request.getRequestDispatcher("feedback.jsp");
			rd.forward(request, response);	
		}
		
		
		if(uri.equals("/ExpensesManager/search.do"))
		{
			String from =  request.getParameter("from").trim();
			String to = request.getParameter("to").trim();
			System.out.println("from "+from);
			System.out.println("to  "+to);
			if(from.equals("")||to.equals(""))
			{
				request.setAttribute("error", "Please select Both the dates");
				rd=request.getRequestDispatcher("ViewExpenses.jsp");
				rd.forward(request, response);
			}
			else{
			
			
			//format of datePicker 02/10/2014
			
			int yearDOB = Integer.parseInt(from.substring(6, 10));
			int monthDOB = Integer.parseInt(from.substring(0, 2));
			int dayDOB = Integer.parseInt(from.substring(3, 5));
			
			String from1 = yearDOB+"-"+monthDOB+"-"+dayDOB;
			
			int yearDOB1 = Integer.parseInt(to.substring(6, 10));
			int monthDOB1 = Integer.parseInt(to.substring(0, 2));
			int dayDOB1 = Integer.parseInt(to.substring(3, 5));
			
			String to1 = yearDOB1+"-"+monthDOB1+"-"+dayDOB1;
			
			int expRId = (int) session.getAttribute("rowId");
			
			details = dao.getExpenses(from1, to1, expRId);
			
			request.setAttribute("details", details);
			rd=request.getRequestDispatcher("ViewExpenses.jsp");
			rd.forward(request, response);
			}
			
		}
		
		
		if(uri.equals("/ExpensesManager/addtransaction.do"))
		{
			String type = request.getParameter("type");
			String amt = request.getParameter("amount");
			String descr = request.getParameter("descr");
			System.out.println("type-------> "+type);
			System.out.println("descr-------> "+descr);
			
			


			ArrayList error=new ArrayList();
			

			int i=0;
			boolean b=false;


			if(type.equals("Select")||amt.equals("")||descr.equals("")){
				error.add("All star (*) mark field are mandatory");
				i++;
				System.out.println("Error 1");
			}


			double amount = Double.parseDouble(amt);
			DTO dt=new DTO();
			dt.setType(type);
			dt.setAmt(amount);
			dt.setDesc(descr);
			
			int userId = (int) session.getAttribute("rowId");


			if(error.isEmpty())
			{
				boolean dupl = false; 
				
				String currnetDate = (new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
				
				dupl = dao.saveTransaction(type, amount, descr, currnetDate, userId);
				System.out.println("Came back to servlet after saving");
				if(dupl)
				{
					String successMsg = null;
					rd = request.getRequestDispatcher("AddTransaction.jsp");
					rd.forward(request, response);
				}
				else
				{
					String errorMsg2 = "server problem please try again.";
					request.setAttribute("error", errorMsg2);
					request.setAttribute("bean", dt);
					rd = request.getRequestDispatcher("AddTransaction.jsp");
					rd.forward(request, response);
					
				}
			}
			else
			{

				System.out.println("in side else222");
				request.setAttribute("error", error);
				request.setAttribute("bean",dt);
				rd=request.getRequestDispatcher("AddTransaction.jsp");
				rd.forward(request, response);
			}


		}
		
		if(uri.equals("/ExpensesManager/viewtransaction.do"))
		{
			String type =  request.getParameter("type");
			
			int expRId = (int) session.getAttribute("rowId");
			
			details = dao.getTransaction(type, expRId);
			request.setAttribute("details", details);
			request.setAttribute("alltransactiondetails", details);
			rd=request.getRequestDispatcher("ViewExpenses.jsp");
			rd.forward(request, response);
			
		}
	
		
		if(uri.equals("/ExpensesManager/piechart"))
		{
			System.out.println("Inside pie chart");
			response.setContentType("image/png");

			OutputStream outputStream = response.getOutputStream();

			int userId = (int) session.getAttribute("rowId");
			
			JFreeChart chart = dao.getChart(userId);
			int width = 500;
			int height = 350;
			ChartUtilities.writeChartAsPNG(outputStream, chart, width, height);
		}
		
	}

}



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Authentication
 */
@WebServlet("/Authentication")
public class Authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    String uid="",password="";
    Connection con=null;
    Statement st=null;
     Statement st1=null;
    ResultSet rs=null;
    RequestDispatcher rd=null; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Authentication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		uid = req.getParameter("uid");
		password = req.getParameter("longtermpassword");


	                try {
	            Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/opass","root","root");
	            st = con.createStatement();
	           rs= st.executeQuery("select * from userdetails where uid='"+uid+"' and longpassword='"+password+"'");
	            if(rs.next())
	            {
	            	String uname = rs.getString(1);
	            	req.setAttribute("username", uname);
	                rd=req.getRequestDispatcher("/index.jsp");
	                rd.forward(req,res);
	            }
	            else {
		            rd=req.getRequestDispatcher("/AuthenticateFail.jsp");
		           // out.println("welcome");
		            rd.forward(req,res);
		        }
		        
	        } catch(Exception e2) {
	            System.out.println(e2);
	            //  out.println(e2);
	        }
	    }
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	



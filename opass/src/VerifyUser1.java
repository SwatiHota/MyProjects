
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
 * Servlet implementation class VerifyUser1
 */
@WebServlet("/VerifyUser1")
public class VerifyUser1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String uname="";
    String url="";
    Connection con=null;
    Statement st=null;
     Statement st1=null;
    ResultSet rs=null;
    RequestDispatcher rd=null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyUser1() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		uname = req.getParameter("uname");
        String urL = req.getParameter("url");
        String sub = urL.substring(0,4);  
		 if(!"http".equalsIgnoreCase(sub)){
			 	url = "http://" + urL;
		 } else {
			 url = urL;
		 }

                try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/opass","root","root");
            st = con.createStatement();
           rs= st.executeQuery("select * from userdetails where username='"+uname+"' and url='"+url+"'");
            if(rs.next()== true)
            {
             String un=rs.getString(1);
			 String uid= rs.getString(2);

			 String url=rs.getString(3);
             String longpassword= rs.getString(4);
             String phoneno=rs.getString(5);
             String input = longpassword+phoneno;
             String way2otp = GenerateMD5.getMD5(input); // get 6 char otp
            // WaySms.sendOTP(phoneno, way2otp);
             way2otp = GenerateMD5.getMD5(way2otp+input);
             
             WaySms.sendOTP(phoneno,way2otp);
             
              String query1 = " insert into logindetails(username,uid,url,longpassword,phoneno,otp) values('"+un+"','"+uid+"','"+url+"','"+longpassword+"','"+phoneno+"','"+way2otp+"')";
              st1 = con.createStatement();
              st1.executeUpdate(query1);

                rd=req.getRequestDispatcher("/VerifyLTP.jsp");
                rd.forward(req,res);
            }
            else {
	            rd=req.getRequestDispatcher("/Failure.jsp");
	           // out.println("welcome");
	            rd.forward(req,res);
	        }
	        st1.close();
	        con.close();
	        
        } catch(Exception e2) {
            System.out.println(e2);
            //  out.println(e2);
        }
	}

	

}

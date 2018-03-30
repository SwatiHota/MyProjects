

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
 * Servlet implementation class VerifyOTP
 */
@WebServlet("/VerifyOTP")
public class VerifyOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 String uname="";
	    String url="",otp="";
	    Connection con=null;
	    Statement st=null;
	     Statement st1=null;
	    ResultSet rs=null;
	    RequestDispatcher rd=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyOTP() {
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
		uname = req.getParameter("uname");
       String urL = req.getParameter("url");
        String sub = urL.substring(0,4);
        if(!"http".equalsIgnoreCase(sub)){
		 	url = "http://" + urL;
	 } else {
		 url = urL;
	 }
        otp = req.getParameter("otpassword");
           System.out.println(uname+url+otp);


                try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/opass","root","root");
            st = con.createStatement();
           rs= st.executeQuery("select * from logindetails where username='"+uname+"' and url='"+url+"' and otp='"+otp+"'");
            if(rs.next())
            {
               // rd=req.getRequestDispatcher("/VerifyLTP.jsp");
               res.sendRedirect(res.encodeRedirectURL(url));
            }
            else {
	            rd=req.getRequestDispatcher("/Failure.jsp");
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






import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String uname="";
    String url="";
    String uid="";
    String phoneno="";
    String longtermpassword="";
    Connection con=null;
     Statement st1=null;
     PreparedStatement ps = null;
    RequestDispatcher rd=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
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
		 String urL= req.getParameter("url");
		 String sub = urL.substring(0,4);  // http
		 if(!"http".equalsIgnoreCase(sub)){
			 	url = "http://" + urL;
		 } else {
			 url = urL;
		 }
	        uid = req.getParameter("uid");
	        phoneno = req.getParameter("phoneno");
	        longtermpassword = req.getParameter("longtermpassword");
		
		try {
        	
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/opass","root","root");
            
            String query = " insert into userdetails(username,uid,url,longpassword,phoneno) values"+"(?,?,?,?,?)";
            ps = con.prepareStatement(query);
             ps.setString(1, uname);
			 ps.setString(2, uid);

			 ps.setString(3, url);
             ps.setString(4, longtermpassword);
             ps.setString(5, phoneno);

            int no = ps.executeUpdate();
            if(no>0){

                rd=req.getRequestDispatcher("/home.jsp");
                rd.forward(req,res);
                con.close();
            } else {
            	
            }
        } catch(Exception e2) {
            System.out.println(e2);
            //  out.println(e2);
        }
	}

	

}

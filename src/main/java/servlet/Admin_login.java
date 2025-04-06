package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Admin_login
 */
public class Admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();

	  
		PrintWriter out=response.getWriter();
		String uemail=request.getParameter("aemail");
		String upass=request.getParameter("apass");
		RequestDispatcher dispatcher =null;
		ResultSet rs=null;
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sandesh","root","sandesh0110");
	            PreparedStatement ps=con.prepareStatement("select * from admin_login where email = ? and password = ?");
	            ps.setString(1,uemail);
	        	ps.
	        	setString(2,upass);
rs = ps.executeQuery();
if(rs.next()) {
	dispatcher = request.getRequestDispatcher("Admin.jsp");
	session.setAttribute("aemail", rs.getString("email"));
	dispatcher.forward(request,response);
}
else {
	dispatcher = request.getRequestDispatcher("index.html");
	dispatcher.forward(request,response);
}
		}
		catch(Exception e){
		e.printStackTrace();
		
	    }
	}

}

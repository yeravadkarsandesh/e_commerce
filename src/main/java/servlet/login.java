package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pojo.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Dao.SignupDao;

/**
 * Servlet implementation class login
 */
@SuppressWarnings("unused")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String uemail=request.getParameter("email");
		String upass=request.getParameter("pass");
		HttpSession session =request.getSession();
		RequestDispatcher dispatcher =null;
		ResultSet rs=null;
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sandesh","root","sandesh");
	            PreparedStatement ps=con.prepareStatement("select * from signup where email = ? and password = ?");
	            ps.setString(1,uemail);
	        	ps.
	        	setString(2,upass);
rs = ps.executeQuery();
if(rs.next()) {
	dispatcher = request.getRequestDispatcher("index.jsp");
	session.setAttribute("email", rs.getString("email"));
	dispatcher.forward(request,response);
}
else {
	dispatcher = request.getRequestDispatcher("login.html");
	dispatcher.forward(request,response);
}

PreparedStatement ps1=con.prepareStatement("select * from signup where email=?");
ps1.setString(1, uemail);
rs=ps1.executeQuery();
rs.next();

int id=rs.getInt(1);
String uname=rs.getString(2);
//session.setAttribute("name",("uname"));
session.setAttribute("name",(uname));
SignupDao s =new SignupDao();
s.cid(new admin(id));
//out.println(id);
//session.setAttribute("id","id");
//session.getId();
//out.println(session.getAttribute("id"));
//System.out.println(admin.getId());


		}
		catch(Exception e){
		e.printStackTrace();
		}
		
	}
	}



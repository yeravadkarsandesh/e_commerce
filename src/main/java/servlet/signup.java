package servlet;

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
import java.sql.SQLException;

import com.Dao.SignupDao;


@SuppressWarnings("unused")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    String uname;
    String uemail;
    String upass;
    public signup() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		 response.setContentType("text/html");
	        PrintWriter out=response.getWriter();
		uname=request.getParameter("name");
		 uemail=request.getParameter("email");
		 upass=request.getParameter("pass");
		 
		

		 SignupDao s = new SignupDao();
		 s.signup(new admin(uname,uemail,upass));
		 //(String)session.getAttribute("email")
		
		 if(uemail!=admin.getEmail()) {
			 response.sendRedirect("Signup.html");
			}
		 else if(uemail ==admin.getEmail()) {
			 response.sendRedirect("login.html");
		 }
			else {
				response.sendRedirect("login.html");
			}
		out.close();
	
	
		
	}

}

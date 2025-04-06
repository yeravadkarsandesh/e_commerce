

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.IOException;
import java.sql.DriverManager;

/**
 * Servlet implementation class way
 * @param <PrintWriter>
 */
@SuppressWarnings("unused")
public class way<PrintWriter> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public way() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		java.io.PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String name1=request.getParameter("name1");

		try { 
			Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sandesh","root","sandesh0110");
	            PreparedStatement ps=con.prepareStatement("insert into info values(?,?)");
	ps.setString(1, name);
	ps.setString(2,name1);

	int i=ps.executeUpdate();
	if(i>0)
		out.print("data added succfully");
	}
	catch(Exception e2) {
		System.out.println(e2);
	}
		out.close();

	}

}

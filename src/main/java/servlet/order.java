package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.Dao.order_details_Dao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pojo.admin;

/**
 * Servlet implementation class order
 */
public class order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public order() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session =request.getSession();
		String uname=(String)session.getAttribute("name");
		int customer_id=admin.getId()
;		String ucon=request.getParameter("con");
		String uSadd=request.getParameter("Sadd");
		int uPcode=Integer.parseInt(request.getParameter("Pcode"));
		String udist=request.getParameter("Dist");
		String ustate=request.getParameter("State");
		int t_price=Integer.parseInt((String)session.getAttribute("total_price"));
		String p_type="Cash on Delivery";

		String id=String.valueOf(admin.getId());
		order_details_Dao ord= new order_details_Dao();
		if(ord.order(uname, customer_id, ucon, uSadd, uPcode, udist, ustate, t_price, p_type)==1) {
			try {
				//then inserting data cart into final cart 
				ord.admin_cart(id);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			response.sendRedirect("index.jsp");

		}
	
	
		
		 ord.drop_cart(id);//next we drop the  cart table to clear cart page 
		
		 //then insert the order details in address table
		
		out.close();
	}

	

	

}

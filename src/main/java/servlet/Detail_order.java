package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pojo.admin;

import java.io.IOException;

import com.Dao.order_details_Dao;
import com.Dao.productDao;
import com.mysql.cj.Session;

/**
 * Servlet implementation class Detail_order
 */
public class Detail_order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Detail_order() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		order_details_Dao ord= new order_details_Dao();
		String xid=String.valueOf(request.getParameter("id"));
		HttpSession session =request.getSession();
		
		String button=request.getParameter("btn");
	String id= (String) session.getAttribute("O_id");
	session.setAttribute("Order_id",xid);
	if(session.getAttribute("Order_id")!=null) {
		 response.sendRedirect("Detail_order.jsp");
	 }
	
			
		 else if(button.equals("Cancle")) {
				ord.delete_address(id);
				ord.delete_final_cart(id);
				 response.sendRedirect("order.jsp");
			}
		

	}



}

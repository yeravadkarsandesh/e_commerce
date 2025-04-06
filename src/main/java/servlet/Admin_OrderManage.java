package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.Dao.Admin_order_Dao;

/**
 * Servlet implementation class Admin_OrderManage
 */
public class Admin_OrderManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_OrderManage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		Admin_order_Dao obj =	new Admin_order_Dao();
		String button=request.getParameter("btn");
		String rid=request.getParameter("rid");
		String id=request.getParameter("id");
		session.setAttribute("O_id",id);
		if(id!=null){
			
			response.sendRedirect("Admin_Morder_details.jsp");

			// response.sendRedirect("login.html");
		}
		else if(rid!=null){
		obj.Admin_catalogue(rid);
		response.sendRedirect("Admin_Morders.jsp");
		}
		
		 else if(button.equals("Store")) {
				
				 response.sendRedirect("Admin_Delivered_order.jsp");
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

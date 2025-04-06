package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Dao.Admin_product_Dao;

import DB.Dbconfig;

/**
 * Servlet implementation class Admin_StoreManage
 */
public class Admin_StoreManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_StoreManage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin_product_Dao obj =new Admin_product_Dao();
		String cid=request.getParameter("cid");
		String cname=request.getParameter("cname");
		String cdisc=request.getParameter("cdisc");
		
		String Fname=request.getParameter("Fname");
		String Fdisc=request.getParameter("Fdisc");

		String button=request.getParameter("btn");
		String id=request.getParameter("id");
		
		String Pid=request.getParameter("Ppid");
		 String Pname=request.getParameter("Pname");
		 String Pimg=request.getParameter("Pimg");
		 String Pprice=request.getParameter("Pprice");
		 String Pqua=request.getParameter("Pqua");
		 String Pstock=request.getParameter("Pstock");
		 String Pcid=request.getParameter("Pcid");
		String pid=request.getParameter("pid");
		 if(id!=null) {
				obj.delete_category(id);
				 response.sendRedirect("Admin_Mstores.jsp");

			}

		
		 else if(pid!=null) {
				obj.delete_product(pid);
				 response.sendRedirect("Admin_Mstore_details.jsp");
			}
		else if(button.equals("Update")) {
			obj.update_category(cid, cname, cdisc);
			 response.sendRedirect("Admin_Mstores.jsp");
		}
		
		else if(button.equals("Product")) {
				
			 response.sendRedirect("Admin_Mstore_details.jsp");
		}
		 else if(button.equals("Add")) {
				try {
					obj.addcategory(Fname, Fdisc);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 response.sendRedirect("Admin_Mstores.jsp");
		}
		
		 
		

		 
		 
		 
		 else if(button.equals("AddProduct")) {
				obj.addproduct(Pname, Pimg, Pprice, Pqua, Pstock, Pcid);
			 response.sendRedirect("Admin_Mstore_details.jsp");
		}
		 else if(button.equals("UpdateProduct")) {
				obj.updateproduct(Pid, Pname, Pimg, Pprice, Pqua, Pstock, Pcid);
			 response.sendRedirect("Admin_Mstore_details.jsp");
		}
	}

	

}

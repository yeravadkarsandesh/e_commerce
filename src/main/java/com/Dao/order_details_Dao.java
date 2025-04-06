package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.Dbconfig;
import jakarta.servlet.RequestDispatcher;
import pojo.admin;
import pojo.order;

public class order_details_Dao {
	private static final String insert_address="insert into address(name,customer_id,contact,saddress,pcode,distric,state,Curren_date,Arrive_date,price,payment_type ) values(?,?,?,?,?,?,?,current_date(),curdate()+interval 2 day,?,?)";
	private static final String drop_cart="delete from cart where customer_id =?";
	private static final String insert_final_cart="insert into final_cart(cartitem_id,product_name,price,customer_id,product_id) values(?,?,?,?,?)";
	private static final String delete_address="delete from address where O_id=?";
	private static final String delete_final_cart="delete from final_cart where cartitem_id=?";

	private static final String decrement_stock_product="update product set stock=stock-1 where product_id=?";
			
	Connection conn=Dbconfig.getConnection();
		PreparedStatement ps =null;
		ResultSet rs=null;
		
		
	public int order(String name,int id,String contact,String address,int Pcode,String distric,String state,int price,String payment) {
		RequestDispatcher dispatcher =null;
		int i=0;

		try{;
	 ps =conn.prepareStatement(insert_address);
	  ps.setString(1,name);
        ps.setInt(2,id);
ps.setString(3,contact);
ps.setString(4,address);
ps.setLong(5,Pcode);
ps.setString(6,distric);
ps.setString(7,state);
ps.setLong(8,price);
ps.setString(9,payment);
i=(int)ps.executeUpdate();

	
} catch (SQLException e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
		return i;
		
}
	
	public void admin_cart(String id) throws SQLException {
		try{
			int cus_id=admin.getId();
			
			PreparedStatement ps =conn.prepareStatement("select * from address where customer_id=?");
			ps.setInt(1, cus_id);
			rs=ps.executeQuery();
			 while(rs.next()) {
				 order.setO_id(rs.getInt(1));
			 }
				 
		
	
		String query="select * from cart where customer_id = ?";
		 String product_id = null;
		 String name = null;
		 String image= null;
		  String price= null;
		  String quantity= null;
		  
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			 while(rs.next()) {
				  product_id=rs.getString(7);
			     name=rs.getString(2); 
			       image=rs.getString(3);
			  price=rs.getString(4);
			  quantity=rs.getString(5);
			  
			 
					  int cid=order.getO_id();
					  int s =admin.getId();
					  ps=conn.prepareStatement(insert_final_cart);
					  ps.setInt(1, cid);
						ps.setString(2, name);
						ps.setString(3, price);
						ps.setLong(4, s);
						ps.setString(5, product_id);
						ps.executeUpdate();	
						
						
						try{
							int iid=Integer.parseInt(product_id);
						ps= conn.prepareStatement(decrement_stock_product);
						ps.setInt(1, iid);
							ps.executeUpdate();

							}catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
			 }
	
}			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
	public void drop_cart(String id){
		try{
				//PrintWriter out=ResponseInfo.getWriter();
				// PreparedStatement ps1=null;
				int iid=Integer.parseInt(id);
			ps= conn.prepareStatement(drop_cart);
				
			ps.setInt(1, iid);
				ps.executeUpdate();

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 
			}
	
	public void delete_address(String id) {
		
		try{
			int iid=Integer.parseInt(id);
		ps= conn.prepareStatement(delete_address);
		ps.setInt(1, iid);
			ps.executeUpdate();

			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
	}
	
	public void delete_final_cart(String id) {
		
		try{
			int iid=Integer.parseInt(id);
		ps= conn.prepareStatement(delete_final_cart);
		ps.setInt(1, iid);
			ps.executeUpdate();

			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
}

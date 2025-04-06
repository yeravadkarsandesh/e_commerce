package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.Dbconfig;
import pojo.admin;
import pojo.order;

public class Admin_order_Dao {

	public static final String Select_address_query="select * from address where O_id=? ";
	public static final String Add_admin_catalouge="insert into Admincatalouge(cName,cAds,cBill,O_no)values(?,?,?,?) ";
	private static final String delete_address="delete from address where O_id=?";
private static final String  select_cart_query="select * from final_cart where cartitem_id=?";
public static final String Add_admin_Productsellcatalouge="insert into AdminProductsellcatalouge(Pname,Pprice,Pid)values(?,?,?) ";
private static final String delete_final_cart="delete from final_cart where cartitem_id=?";

	Connection conn=Dbconfig.getConnection();
	PreparedStatement ps =null;
	ResultSet rs=null;
	
	public void Admin_catalogue(String id) {
		 String name = null;
		 String address= null;
	
		  String price= null;
		  String Pname = null;
		  String Pprice= null;
		  String Pid= null;
		 try {
				int iid=Integer.parseInt(id);
				PreparedStatement ps  = conn.prepareStatement(Select_address_query);
			ps.setInt(1, iid);
			 rs = ps.executeQuery();
			 while(rs.next()) {
				 int oid=rs.getInt(1);
				 name=rs.getString(2);
			     address=rs.getString(5); 
			       price=rs.getString(11);
			    
					  ps=conn.prepareStatement(Add_admin_catalouge);
					  ps.setString(1, name);
						ps.setString(2, address);
						ps.setString(3, price);
						ps.setInt(4, oid);
						ps.executeUpdate();
						
						ps= conn.prepareStatement(delete_address);
						ps.setInt(1, iid);
							ps.executeUpdate();
			 }
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 
		 try {
				int iid=Integer.parseInt(id);
				PreparedStatement ps  = conn.prepareStatement(select_cart_query);
			ps.setInt(1, iid);
			 rs = ps.executeQuery();
			 while(rs.next()) {
				  Pname=rs.getString(2);
			     Pprice=rs.getString(3); 
			       Pid=rs.getString(5);
			    
					  ps=conn.prepareStatement(Add_admin_Productsellcatalouge);
					  ps.setString(1, Pname);
						ps.setString(2, Pprice);
						ps.setString(3,Pid);
						
						ps.executeUpdate();
						
						ps= conn.prepareStatement(delete_final_cart);
						ps.setInt(1, iid);
							ps.executeUpdate();
			 }
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}

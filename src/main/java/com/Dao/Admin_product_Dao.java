package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.Dbconfig;

public class Admin_product_Dao {
	private static final String insert_category="insert into category1(category_id,category_name,category_disc) values(?,?,?)";
	private static final String delete_category="delete from category1 where category_id=? ";
	private static final String update_category_name="update category1 set category_name=? where category_id=?";
	private static final String update_category_disc="update category1 set category_disc=? where category_id=?";

	private static final String insert_product="insert into product(product_name,image,price,quantity,stock,category_id) values(?,?,?,?,?,?)";
	private static final String delete_product="delete from product where  product_id=?";
	private static final String update_product="update product set product_name=?,image=?,price=?,quantity=?,stock=?,category_id=? where product_id=?";
			
			
	Connection conn=Dbconfig.getConnection();
	PreparedStatement ps =null;
	ResultSet rs=null;
	
	public void addcategory(String Cname,String Cdisc){
		int rsu = 0;
		String query="select * from category1";
		 try {
			ps  = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()){
				rsu=rs.getInt(1);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		int a=rsu+1;
		for(int i=1; i<=1;i++) {
			try{;
			 ps =conn.prepareStatement(insert_category);
			  ps.setLong(1,a);
			 ps.setString(2,Cname);
		        ps.setString(3,Cdisc);
		ps.executeUpdate();

			
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
			
		a++;
		}
	
	}
	
	public void delete_category(String id) {
		int iid=Integer.parseInt(id);
		try{
		 ps =conn.prepareStatement(delete_category);
		  ps.setInt(1,iid);
	   
	ps.executeUpdate();

		
	} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
	}

	public void update_category(String id,String name,String disc) {
		int iid=Integer.parseInt(id);
		try{
		 ps =conn.prepareStatement(update_category_name);
		 ps.setString(1, name);
		  ps.setInt(2,iid);
	   
	ps.executeUpdate();	
	
	} 
		
		catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
		try{
			 ps =conn.prepareStatement(update_category_disc);
			 ps.setString(1, disc);
			  ps.setInt(2,iid);
		   
		ps.executeUpdate();	
		
		} 
			
			catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		
	}
	
	
public void addproduct(String Pname,String Pimg,String Pprice,String Pqunt,String Pstock,String Pcid) {
	int price=Integer.parseInt(Pprice);
	
	int stock=Integer.parseInt(Pstock);
	int cid=Integer.parseInt(Pcid);
		try{;
		 ps =conn.prepareStatement(insert_product);
		  ps.setString(1,Pname);
	        ps.setString(2,Pimg);
	        ps.setInt(3,price);
	        ps.setString(4,Pqunt);
	        ps.setInt(5,stock);
	        ps.setInt(6,cid);
	ps.executeUpdate();

		
	} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
	}

public void delete_product(String id) {
	int iid=Integer.parseInt(id);
	try{
	 ps =conn.prepareStatement(delete_product);
	  ps.setInt(1,iid);
   
ps.executeUpdate();

	
} catch (SQLException e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
}

public void updateproduct(String pid,String Pname,String Pimg,String Pprice,String Pqunt,String Pstock,String Pcid) {
	int price=Integer.parseInt(Pprice);
	int Pid=Integer.parseInt(pid);
	int stock=Integer.parseInt(Pstock);
	int cid=Integer.parseInt(Pcid);
		try{;
		 ps =conn.prepareStatement(update_product);
		  ps.setString(1,Pname);
	        ps.setString(2,Pimg);
	        ps.setInt(3,price);
	        ps.setString(4,Pqunt);
	        ps.setInt(5,stock);
	        ps.setInt(6,cid);
	        ps.setInt(7,Pid);
	ps.executeUpdate();

		
	} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
	}
}


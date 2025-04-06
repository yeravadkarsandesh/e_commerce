package com.Dao;

import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.ResponseInfo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.Dbconfig;
import pojo.admin;
import pojo.product;



@SuppressWarnings("unused")
public class productDao {
	public void cart(String id){
		try( Connection conn=Dbconfig.getConnection()){
				//PrintWriter out=ResponseInfo.getWriter();
				 PreparedStatement ps =null;
				 ResultSet rs=null;
				String query="select * from product where product_id = ?";
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
						  product_id=rs.getString(1);
					     name=rs.getString(2); 
					       image=rs.getString(3);
					  price=rs.getString(4);
					  quantity=rs.getString(5);
					 }
					 int s =admin.getId();
					 
					  ps=conn.prepareStatement("insert into cart(product_name,image,price,quantity,customer_id,product_id) values(?,?,?,?,?,?)");
						ps.setString(1, name);
						ps.setString(2, image);
						ps.setString(3, price);
						ps.setString(4, quantity);
						ps.setLong(5, s);
						ps.setString(6, product_id);
						ps.executeUpdate();
						
				
		}			catch (SQLException e) {
						e.printStackTrace();
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 
			}
	public void remove_from_cart(String id){
		try( Connection conn=Dbconfig.getConnection()){
				//PrintWriter out=ResponseInfo.getWriter();
				 PreparedStatement ps1=null;
				
			ps1= conn.prepareStatement("delete from cart where cartitem_id=?");
				
			ps1.setString(1, id);
				ps1.executeUpdate();

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 
			}
	private void println(String string) {
		// TODO Auto-generated method stub
		
	}

	
	}
	


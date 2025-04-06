package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.Dbconfig;
import pojo.admin;

public class SignupDao {
	
	
private static final String insert_admin="insert into signup(name,email,password) values(?,?,?)";
	
private static final String select_admin="select * from signup";

public void detail() throws SQLException {
	ResultSet rs=null;
	int id=admin.getId();
	try(Connection conn=Dbconfig.getConnection()){
		PreparedStatement ps =conn.prepareStatement(select_admin);
		rs=ps.executeQuery();
		while(rs.next()) {
			admin.setRname(rs.getString(2));
			admin.setRemail(rs.getString(3));
		}
		

		
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
}
	

public int signup(admin admin) {
	
		try(Connection conn=Dbconfig.getConnection()){
		PreparedStatement ps =conn.prepareStatement(insert_admin);
		ps.setString(1, admin.getName());
		ps.setString(2, admin.getEmail());
		ps.setString(3,admin.getPass());
		
	int i= ps.executeUpdate();
		return i;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return 0;
}
int id;
public int cid(admin admin) {
	
	return id;
}
}

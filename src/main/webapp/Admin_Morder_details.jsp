<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="DB.Dbconfig,java.sql.*" %>
        <%@ page import="pojo.admin" %>
         <%@ page import="pojo.order" %>
          <%@ page import="com.Dao.order_details_Dao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/detail_order.css">
<style>
body{
 background-image:url(img/detail.jpg);

}
</style>
</head>
<body>
<div class="bg">
 <div class="cart_item_details">
 <div class="head"><h3>Purchased items</h3></div>
 <%


 	
 Connection conn=Dbconfig.getConnection();
 PreparedStatement ps =null;
 ResultSet rs=null;
 String cid=(String)session.getAttribute("O_id");
 int id=Integer.parseInt(cid);
  ps =conn.prepareStatement("select * from final_cart where cartitem_id=?");
 ps.setInt(1,id);
 rs=ps.executeQuery();
  while(rs.next()) {
	  String p_id=rs.getString(5);
	  session.setAttribute("p_id", p_id);
 %>
 
 <div class="row"><p class="cid" ><b><%= rs.getString(2)%></b></p>
  <p class="cid"><b><%= rs.getString(3)%></b>-/RS.</p>
  </div>
             <%
 }
           %>
                    <%
            String query1="select sum(price) from final_cart where cartitem_id=?; ";
            PreparedStatement ps1 = conn.prepareStatement(query1);
            ps1.setInt(1, id);
            rs = ps1.executeQuery();
          rs.next();
          int T_price =rs.getInt(1);
          String t_price=String.valueOf(rs.getInt(1));
          session.setAttribute("total_price",t_price);
%>
         <br>  
 <div class="row"><div class="cid"><b>Total Amount-</b></div> 
 <div class="cid"><b><%=T_price%>-/RS.</b></div>
 
 </div>
 
 
           
 </div>
 </div>
</body>
</html>
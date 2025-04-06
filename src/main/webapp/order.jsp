<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="DB.Dbconfig,java.sql.*" %>
        <%@ page import="pojo.admin" %>
         <%@ page import="pojo.order" %>
             <%@ page import="com.Dao.order_details_Dao"%>
         
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cabin:ital,wght@0,400..700;1,400..700&family=Tiro+Devanagari+Marathi:ital@0;1&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="css/order.css">
 <style>.Remove p a:hover {
  background-color:#070807; /* Darker green */
}
.Remove p a{

width: 140px;
    text-decoration: none;
    color: white;
    height: 25px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 5px;
    background-color: #637871;
    border: none;
}
 
 .row{
   font-family: "Cabin", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
  font-variation-settings:"wdth" 100;
    background-color: white;
text-align: center;
    border: 4px solid rgba(255, 255, 255, .5);
margin: 10px;
    margin: 10px;
    height: 250px;
            width: 230px;
    border-radius: 10px;
}
body{
display: flex;
    background-image: url(img/BGimg/order.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    min-height: 100vh;
    min-width: 100vw;
}
 </style>
</head>
<body>

<div class="bg">

<form action="Detail_order">

 <%

 
 Connection conn=Dbconfig.getConnection(); 
 ResultSet rs=null;
 int id =admin.getId();
 String query="select * from address where customer_id=? ";
 PreparedStatement ps  = conn.prepareStatement(query);
 ps.setInt(1, id);
 rs = ps.executeQuery();
 %>
  <div class="ro">
   <h2 class="back_button"><a href="index.jsp"><img alt="" src="img/icon/back-button.png"></a></h2>
  
 <% 
 while(rs.next()){
	 
     String O_id=String.valueOf(rs.getInt(1));
	 session.setAttribute("O_id",O_id);
 %>
 <div class="row">
 <p class="cid"><b>Total Order Price:-<%= rs.getString(11)%></b></p>
   <p class="cid"><b>Address:-<%= rs.getString(5)%></b></p>
  <p class="cid"><b>Order Date:-<%= rs.getString(9)%></b></p>
  <p class="cid"><b>Arriving Date:-<%= rs.getString(10)%></b></p>
 <div class="details">
		   <div class="Remove">
		   <p><a href="Detail_order?id=<%=rs.getString(1)%>">Checkout</a></p>
		           
		           </div>
		           <div class="Remove2">
		           <p><input type="submit" name="btn" value="Cancle"></p>
		           </div>
		           </div>
  </div>
   
     
           <%
 }
           %>
            </div>
            </form>
            </div>
</body>
</html>
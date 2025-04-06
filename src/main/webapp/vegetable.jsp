<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="DB.Dbconfig,java.sql.*" %>
  <%@page import="com.Dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/card.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.item{
   
    border:none;
    display: grid;
    border-radius: 5px;
    margin:15px;
    width:150px;
}
.card-items{
    display: flex;
    background-color: rgb(255, 253, 253);
    justify-content: flex-start;
    width: 1150px;
    overflow: auto;;
}
</style>
</head>
<body>
<div class="container">
        <h2>Vegetable</h2>
        <div class="card" >
            <h2 class="my1">Fresh vegetable</h2>
            <div class="card-items">
               <% Connection conn=Dbconfig.getConnection(); 
 //PreparedStatement ps =null;
 ResultSet rs=null;
 String query1="select * from product where category_id=3";
 PreparedStatement ps1 = conn.prepareStatement(query1);
 rs = ps1.executeQuery();
 while(rs.next()){
	%>
	   <form action="add_to_cart">
       <div class="item">
     <% String product_id=rs.getString(1);
     String name=rs.getString(2); 
      String image=rs.getString(3);
  String price=rs.getString(4);
  %>
<img src="img\vegetable\<%=rs.getString(3)%>" alt="">
           <p class="details"><b><%= rs.getString(2)%></b></p>
           <p class="details"><%=rs.getString(4)%>-/RS.</p>
           <p class="details"><%=rs.getString(5)%></p>
           <div class="add-to-cart">
           <p><a href="add_to_cart?id=<%=rs.getString(1)%>">Add to cart</a></p>
           </div>
       </div>
       </form>
       <%
    }
 %>
 </div>
        </div>
    </div>
</body>
</html>
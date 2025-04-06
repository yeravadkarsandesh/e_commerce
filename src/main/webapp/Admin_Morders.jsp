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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style type="text/css">
body{
    width: 100vw;
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;

}
.bg{
        height: 400px;
    margin: 0px;
    display: flex;
    align-items: center;
   margin-top: 50px;
    width: 1110px;
     justify-content: center;
         overflow-y: scroll;
    overflow-x: hidden;

}
h2{
    margin-right: 380px;
}
.h{
display: flex;
    justify-content: center;
    align-items: center;
    height: 50px;
    width: 1110px;
    position: fixed;
    top: 0;
    margin-top: 77px;
}
.h h4{
    display: flex;
    justify-content: center;
    align-items: center;
    border: 1px solid;
    background-color: whitesmoke;
    border-radius: 5px;
}
input { 
border:0;
}
.back_button, img {
    width: 50px;
 margin-right: 420px;
    }
.ro{
  display: flex;
    background: transparent;
    width: 81vw;
    height: auto;
    max-height: 500px;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    overflow-y: hidden;
    margin: -100px 0px 0px 0px;
    margin-top: 70px;
  
}
.head{
display: flex;
    justify-content: center;
    align-items: center;
    font-optical-sizing: auto;
    font-style: normal;
    font-variation-settings: "wdth" 100;
    background-color: #483737;
    text-align: center;
    height: 50px;
    width: 1115px;
    position: fixed;
    top: 0;
    margin-top: 127px;
}
.cHead{
    text-align: center;
    color: white;
    background-color: transparent;
    margin: 0px 25px 0px 0px;
    width: 130px;
    display: flex;
    justify-content: center;
}
.row{
       display: flex;
    justify-content: center;
    align-items: center;
    font-family: "Cabin", sans-serif;
    font-optical-sizing: auto;
    font-style: normal;
    font-variation-settings: "wdth" 100;
    background-color: white;
    text-align: center;
    margin: 5px;
    height: 50px;
    width: 1110px;
    border-radius: 5px;
}
.row:hover{
      box-shadow: 1px 1px 10px rgb(0 0 0 / 60%);
}

.cid{
   text-align: center;
    color: black;
    background-color: transparent;
    margin: 0px 10px;
    width: 130px;
    
}
.details{
      display: flex;
    justify-content: center;
    margin: 10px;
}
.back {
    background: transparent;
    backdrop-filter: blur(10px);
    border: 2px solid rgba(255, 255, 255, .5);
    width: 300px;
    height: 374px;
    padding: 10px 40px;
    border-radius: 30px;
    box-sizing: border-box;
}


.Remove{

    width: 140px;
    margin: 0px 10px;
        height: 35px;
    display: flex;
    justify-content: center;
    align-items: center;
     
}

.Remove p a:hover {
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
.Remove2{
    width: 140px;
    margin: 0px 10px;
        height: 35px;
    display: flex;
    justify-content: center;
    align-items: center;
     
}

.Remove2 p a:hover {
 background-color: #62df34ba;   /*Darker green */
}
.Remove2 p a{
font-family: "Poppins", sans-serif;
    font-weight: 700;
    font-style: normal;
    width: 140px;
    text-decoration: none;
    color: #0e0d0d;
    height: 25px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 5px;
    background-color: whitesmoke;
    border: none;
}
</style>
</head>
<body>
<div class="bg">

<form action="Admin_OrderManage">

 <%

 
 Connection conn=Dbconfig.getConnection(); 
 ResultSet rs=null;
 //int id =admin.getId();
 String query="select * from address ";
 PreparedStatement ps  = conn.prepareStatement(query);
 //ps.setInt(1, id);
 rs = ps.executeQuery();
 %>
 <div class="h">

    <h2 class="back_button"><a href="Admin.jsp"><img alt="" src="img/icon/back-button.png"></a></h2>
     <h2>Order Details</h2>
		           <h4><span class="material-symbols-outlined">storefront</span><input type="submit" name="btn" value="Store"></h4>
		           
   </div>
    <div class="head">
     <p class="cHead"><b>Order No.</b></p>
       <p class="cHead"><b>Total Amount</b></p>
       <p class="cHead"><b>Order date</b></p>
       <p class="cHead"><b>Order Delivery Date</b></p>
       <p class="cHead"><b>Payment Type</b></p>
       <p class="cHead"><b>More Info</b></p>
    <p class="cHead"><b>Delivery Status</b></p>
  </div>
  <div class="ro">

 <% 
 while(rs.next()){
	 
     String O_id=String.valueOf(rs.getInt(1));
	 session.setAttribute("O_id",O_id);
 %>
 <div class="row">

   <p class="cid"><b><%= rs.getString(1)%></b></p>
  <p class="cid"><b><%= rs.getString(11)%>-Rs.</b></p>
  <p class="cid"><b><%= rs.getString(9)%></b></p>
   <p class="cid"><b><%= rs.getString(10)%></b></p>
    <p class="cid"><b><%= rs.getString(12)%></b></p>
 <div class="details">
		   <div class="Remove">
           <p><a href="Admin_OrderManage?id=<%=rs.getString(1)%>">Checkout</a></p>
		           </div>
	 <div class="Remove2">
           <p><a href="Admin_OrderManage?rid=<%=rs.getString(1)%>">Delivered</a></p>
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
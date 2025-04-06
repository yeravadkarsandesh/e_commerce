<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="DB.Dbconfig,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.back_button, img {
    width: 50px;
 margin-right: 420px;
    }
    .container{
        display: flex;
    justify-content: center;
    }
    .box1{
    width: 780px;
    height: 500px;
        background-color: #ededec;
         box-shadow:0px 1px 35px rgb(132 157 225 / 69%);
   
     overflow-y: scroll;
    overflow-x: hidden;
    margin:10px;
    }
    .box2{
    width: 650px;
    height: 500px;
  
    overflow-y: scroll;
    overflow-x: hidden;
    margin:10px;
    }
    .thead{
    width: 780px;
    height: 50px;
  display: flex;
    justify-content: center;
     align-items: center;
         position: fixed;
    top: 0;
    margin-top: 50px;
    
    }
    .chead{
    width: 780px;
    height: 50px;
    display: flex;
    justify-content: center;
     align-items: center;
     color: white;
    background-color: #5c5c5c;
        position: fixed;
    top: 0;
    margin-top: 98px;
    }
    .cname{
    display: flex;
    justify-content: center;
     align-items: center;
     width: 153px;
      
    }
    .tvalue{
     display: flex;
    justify-content: center;
     align-items: center;
     width: 780px;
         flex-wrap: wrap;
    flex-direction: column;
     margin-top: 55px;
    }
    .row{
      display: flex;
    flex-direction: row;
    }
    .cid{
   display: flex;
    justify-content: center;
     align-items: center;
     width: 143px;
     margin:5px 5px;
     text-align: center;
     
    }
</style>
</head>
<body>
<h2 class="back_button"><a href="Admin_Morders.jsp"><img alt="" src="img/icon/back-button.png"></a></h2>


<div class="container">
<div class="box1">
<div class="thead">
<h1>Delivered Orders</h1>
</div>
<div class="chead">
<div class="cname">No.</div>
<div class="cname">Order No.</div>
<div class="cname">Customer Name</div>
<div class="cname">Address</div>
<div class="cname">Payed Bill</div>

</div>
<div class="tvalue">
<%
Connection conn=Dbconfig.getConnection(); 
ResultSet rs=null;

String query="select * from admincatalouge";
PreparedStatement ps  = conn.prepareStatement(query);

rs = ps.executeQuery();
while(rs.next()){
%>
<div class="row">
<p class="cid"><b><%= rs.getString(1)%></b></p>
  <p class="cid"><b><%= rs.getString(5)%></b></p>
  <p class="cid"><b><%= rs.getString(2)%></b></p>
 <p class="cid"><b><%= rs.getString(3)%></b></p>
 <p class="cid"><b><%= rs.getString(4)%></b></p>
 </div>
 <%
 }
%>
</div>
</div>
<!--  
<div class="box2">
<div class="thead">
<h1>Delivered Product</h1>
</div>
<div class="chead">
<div class="cname">No</div>
<div class="cname">Product Name</div>
<div class="cname">Product Price</div>
<div class="cname">Product Id</div>
</div>
<div class="tvalue">
<%


String query1="select * from adminproductsellcatalouge";
 ps  = conn.prepareStatement(query1);

rs = ps.executeQuery();
while(rs.next()){
%>
<div class="row">
<p class="cid"><b><%= rs.getString(1)%></b></p>
  <p class="cid"><b><%= rs.getString(2)%></b></p>
 <p class="cid"><b><%= rs.getString(3)%></b></p>
 <p class="cid"><b><%= rs.getString(4)%></b></p>
 </div>
 <%
 }
%>
</div>

</div>
 -->

</div>
</body>
</html>
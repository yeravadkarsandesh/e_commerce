<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="DB.Dbconfig,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>

.back_button, img {
    width: 50px;
 margin-right: 420px;
    }
    .container{
        display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;
    }
    .box2{
        width: 980px;
    height: 300px;
    overflow-y: scroll;
    overflow-x: hidden;
    margin: 10px;
    border: 2px solid;
    position: fixed;
    top: 0;
    margin-top: 99px
    
    }
    .thead{
    width: 980px;
    height: 50px;
  display: flex;
    justify-content: center;
     align-items: center;
         position: fixed;
    top: 0;
    margin-top: 50px;
    
    }
    .chead{
    width: 980px;
    height: 50px;
    display: flex;
    justify-content: flex-start;
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
     width: 110px;
          margin-right: 8px;
    }
    .tvalue{
     display: flex;
    justify-content: center;
    align-items: center;
    width: 972px;
   
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
    width: 100px;
    margin: 5px 8px;
    text-align: center;
     
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
  background-color:#ff2727; /* Darker green */
}
.Remove p a,.Remove input{

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
.container2{
width: 1060px;
    display: flex;
    justify-content: center;
    flex-direction: column;
        position: fixed;
    top: 0;
    margin-top: 410px;
}
.Mstore{
display:flex
}
.details{
display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 15px;
}
.box{
   width: 135px;
    display: flex;
    flex-direction: column;
    margin: 5px 0px;
    justify-content: center;
    align-items: center;
}
.label{
    width: 120px;
    margin: 0px 2px;
    border-radius: 5px;
    height: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.label,input{
    width: 120px;
    margin: 0px 2px;
    border-radius: 5px;
    height: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>
</head>
<body>
<h2 class="back_button"><a href="Admin.jsp"><img alt="" src="img/icon/back-button.png"></a></h2>


<div class="container">

<div class="box2">
<div class="thead">
<h1>Manage Product</h1>
</div>
<div class="chead">
<div class="cname">Product Id</div>
<div class="cname">Product Name</div>
<div class="cname">Product Image</div>
<div class="cname">Product Price</div>
<div class="cname">Product Quantity</div>
<div class="cname">Product Stock</div>
<div class="cname">Category Id</div>
<div class="cname">Remove Product</div>

</div>
<div class="tvalue">
<%

Connection conn=Dbconfig.getConnection(); 
ResultSet rs=null;
PreparedStatement ps=null;
String query1="select * from product";
 ps  = conn.prepareStatement(query1);

rs = ps.executeQuery();
while(rs.next()){
%>
<div class="row">
<p class="cid"><b><%= rs.getString(1)%></b></p>
  <p class="cid"><b><%= rs.getString(2)%></b></p>
 <p class="cid"><b><%= rs.getString(3)%></b></p>
 <p class="cid"><b><%= rs.getString(4)%></b></p>
 <p class="cid"><b><%= rs.getString(5)%></b></p>
 <p class="cid"><b><%= rs.getString(6)%></b></p>
 <p class="cid"><b><%= rs.getString(7)%></b></p>
  <div class="details">
 <div class="Remove">
           <p><a href="Admin_StoreManage?pid=<%=rs.getString(1)%>">Remove</a></p>
		           </div>
</div>
 </div>
 <%
 }
%>
</div>

</div>
<div class="container2">
<form style="display: flex;" action="Admin_StoreManage">
<div class="Mstore">
                <h4  style="
    
    margin-top: 30px;"> Add Product</h4>
                <div class="box">
                <div class="label"><p>Product Name-</p></div>
                    <input type="text" placeholder="*Mango" name="Pname" required>
                </div>
               <div class="box">
               <div class="label"><p>Product Image</p></div>
                    <input type="text" placeholder="*milk.jpg" name="Pimg" required>
                </div>
                <div class="box">
               <div class="label"><p>Product Price</p></div>
                    <input type="text" placeholder="*200" name="Pprice" required>
                </div>
                <div class="box">
               <div class="label"><p>Product Quantity</p></div>
                    <input type="text" placeholder="*500g,*1ml,*1pac" name="Pqua" required>
                </div>
                <div class="box">
               <div class="label"><p>Product Stock</p></div>
                    <input type="text" placeholder="*100" name="Pstock" required>
                </div>
                <div class="box">
               <div class="label"><p>Category Id</p></div>
                    <input type="text" placeholder="*1" name="Pcid" required>
                </div>
                 <div class="details">
 <div class="Remove">
 
           <p><input type="submit" name="btn" value="AddProduct"></p>
		           </div>
</div>
</div>
</form>
<form style="display: flex;" action="Admin_StoreManage">
<div class="Mstore">
                <h4  style="
    
    margin-top: 30px;"> Update Prroduct</h4>
     <div class="box">
               <div class="label"><p>Product Id</p></div>
                    <input type="text" placeholder="*1" name="Ppid" required>
                </div>
                <div class="box">
                <div class="label"><p>Product Name-</p></div>
                    <input type="text" placeholder="*Mango" name="Pname" required>
                </div>
               <div class="box">
               <div class="label"><p>Product Image</p></div>
                    <input type="text" placeholder="*milk.jpg" name="Pimg" required>
                </div>
                <div class="box">
               <div class="label"><p>Product Price</p></div>
                    <input type="text" placeholder="*200" name="Pprice" required>
                </div>
                <div class="box">
               <div class="label"><p>Product Quantity</p></div>
                    <input type="text" placeholder="*500g,*1ml,*1pac" name="Pqua" required>
                </div>
                <div class="box">
               <div class="label"><p>Product Stock</p></div>
                    <input type="text" placeholder="*100" name="Pstock" required>
                </div>
                <div class="box">
               <div class="label"><p>Category Id</p></div>
                    <input type="text" placeholder="*1" name="Pcid" required>
                </div>
                 <div class="details">
 <div class="Remove">
 
           <p><input type="submit" name="btn" value="UpdateProduct"></p>
		           </div>
</div>
</div>
</form>
</div>
</div>
</body>
</html>
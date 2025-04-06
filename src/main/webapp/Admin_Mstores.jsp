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
body{
width: 100vw;
    height: 100vh;
    margin: 0px;
    display: flex;
    justify-content: center;
    align-items: center;
}
.back_button, img {
    width: 50px;
 margin-right: 420px;
    }
    .container{
         flex-direction: column;
    display: flex;
    justify-content: center;
    }
    .box1 {
     width: 700px;
    height: 250px;
    margin: 0px 10px;
        margin-top: 55px;
    box-sizing: content-box;
    overflow-y: overlay;
    overflow-x: hidden;
        box-shadow: 1px 1px 10px rgb(0 0 0 / 60%);
    
}
    .box1thead{
width: 700px;
    height: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    position: fixed;
    top: 0;
    margin-top: 50px;
}
.box1thead h4{
    display: flex;
    justify-content: center;
    align-items: center;
    border: 1px solid;
    background-color: whitesmoke;
    border-radius: 5px;
        width: 100px;
}
.back_button, img {
    width: 50px;
    margin-right: 230px;
}
h2{
width: 200px;
    margin-right: 130px;s
}
   
    .box1chead{
     display: flex;
    justify-content: center;
    align-items: center;
    width: 700px;
    margin-top: 75px;
    position: fixed;
    top: 0;
    height: 50px;
    background-color: #959494;
    color: white;
    }
    .box1cname{
      display: flex;
    justify-content: center;
    align-items: center;
    width: 175px;
    }
    .box1tvalue{
 display: flex;
    justify-content: center;
    align-items: center;
    width: 700px;
    flex-direction: column;
    margin-top: 45px;
    overflow-y: scroll;
    overflow-x: hidden;
    
    }
    .box1row{
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    width: 700px;
    }
    .box1cid{
   display: flex;
    justify-content: center;
     align-items: center;
     width: 175px;
     margin:5px 10px;
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
    display: flex;
    width: 700px;
    height: 300px;
    justify-content: center;
    align-items: center;
    box-shadow: 1px 1px 10px rgb(0 0 0 / 60%);
    margin: 0px 10px;
        background-color: whitesmoke;
}
.Mstore{
  width: 350px;
    height: 250px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    
}

.Morders
{
width: 350px;
    height: 250px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
 
.box{
    width: 260px;
    display: flex;
    flex-direction: column;
    margin: 5px 0px;
}
.label{
    width: 250px;
    border-radius: 5px;
    height: 25px;
    justify-content: flex-start;
    display: flex;
    align-items: center;
}
.label,input{
    width: 250px;
    border-radius: 5px;
    height: 25px;
    justify-content: flex-start;
    display: flex;
    align-items: center;
}
</style>
</head>
<body>
<div class="container">
<form action="Admin_StoreManage">



<div class="box1">
<div class="box1thead">

    <h2 class="back_button"><a href="Admin.jsp"><img alt="" src="img/icon/back-button.png"></a></h2>
     <h2>Manage Category</h2>
		           <h4><span class="material-symbols-outlined">storefront</span><input type="submit" name="btn" value="Product"></h4>  
</div>
<div class="box1chead">
<div class="box1cname">Category Id</div>
<div class="box1cname">Category Name</div>
<div class="box1cname">Category Discription</div>
<div class="box1cname">Remove</div>


</div>
<div class="box1tvalue">
<%
Connection conn=Dbconfig.getConnection(); 
ResultSet rs=null;

String query="select * from category1";
PreparedStatement ps  = conn.prepareStatement(query);

rs = ps.executeQuery();
while(rs.next()){
%>
<div class="box1row">
<p class="box1cid"><b><%= rs.getString(1)%></b></p>
  <p class="box1cid"><b><%= rs.getString(2)%></b></p>
 <p class="box1cid"><b><%= rs.getString(3)%></b></p>
 <div class="details">
 <div class="Remove">
           <p><a href="Admin_StoreManage?id=<%=rs.getString(1)%>">Remove</a></p>
		           </div>
</div>
 </div>
 <%
 }
%>
</div>
</div>

</form>

<div class="container2">
<form style="display: flex;" action="Admin_StoreManage">
<div class="Mstore">
                <h2  style="    margin-left: 160px;
    margin-bottom: 5px;
    margin-top: 5px;"> Add Category</h2>
                <div class="box">
                <div class="label"><p>Category Name-</p></div>
                    <input type="text" placeholder="*Fruit" name="Fname" required>
                </div>
               <div class="box">
               <div class="label"><p>Categoty Discription</p></div>
                    <input type="text" placeholder="There are all fruits" name="Fdisc" required>
                </div>
                 <div class="details">
 <div class="Remove">
 
           <p><input type="submit" name="btn" value="Add"></p>
		           </div>
</div>
</div>
</form>
<form style="display: flex;" action="Admin_StoreManage">
<div class="Morders">
<h2  style="    margin-left: 160px;
    margin-bottom: 5px;
    margin-top: 5px;"> Update Category</h2>
                   <div class="box">
                <div class="label"><p>Category id-</p></div>
                    <input type="text" placeholder="Enter Category Id(1*,2*)" name="cid" required > 
                </div>
                <div class="box">
                <div class="label"><p>Category Name-</p></div>
                    <input type="text" placeholder="Dairy product" name="cname" required>
                </div>
               <div class="box">
               <div class="label"><p>Category Discription-</p></div>
                    <input type="text" placeholder="all dairy product" name="cdisc" required>
                </div>
                 <div class="Remove">
 
           <p><input type="submit" name="btn" value="Update"></p>
		           </div>
		         
		           
</div>
</form>
</div>
</div>
</body>
</html>
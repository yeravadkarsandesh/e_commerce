
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


.card{
    margin: 15px auto;
    width: 1150px;
}

.my1{
    background-color: #ffffff;
    width: 1150px;
    box-sizing: border-box;
    padding-left: 35px;
padding-top: 10px;
}
.card-items{
     display: flex;
    background-color: rgb(255, 253, 253);
    justify-content: flex-start;
    width: 1150px;
    overflow: auto;
}

.item{
   
    border:none;
    display: grid;
    border-radius: 5px;
    margin:15px;
    width:150px;
}

.item img{
    width: 10vw;
    height: 20vh;
    justify-items: center;
}

.details{
    text-align: center;
    /* color: rgba(0, 0, 0, 0.479); */
    background-color: white;
    font-family: 'Arvo', serif;
    font-size: small;
}
.item:hover{
   
}
.add-to-cart,p,a{
 text-decoration: none;
 color: black;
}
.add-to-cart{
    display: flex;
    item-aline:center;
  background-color:  #fff64e; /* Green */
  color: white;
  padding: 5px 6px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  border-radius: 4px;
}
.add-to-cart:hover {
  background-color: #fff200; /* Darker green */
}
</style>

</head>
<body>
<div class="container" >
 
        <h2>Fruit</h2>
        <div class="card" >
            <h2 class="my1">Fruit</h2>
            <div class="card-items">
               <% Connection conn=Dbconfig.getConnection(); 
 //PreparedStatement ps =null;
 ResultSet rs=null;
 String query="select * from product where category_id=1";
 PreparedStatement ps = conn.prepareStatement(query);
 rs = ps.executeQuery();
 while(rs.next()){
	%>
	   <form action="add_to_cart">
       <div class="item">
     <% String product_id=rs.getString(1);
     String name=rs.getString(2); 
      String image=rs.getString(3);
  String price=rs.getString(4);
  %>
<img src="img\fruit\<%=rs.getString(3)%>" alt="">
           <p class="details"><%= rs.getString(2)%></p>
           <p class="details"><%=rs.getString(4)%>-/RS.</p>
           <p class="details">grab now</p>
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
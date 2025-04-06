<%
if(session.getAttribute("email")==null){
	response.sendRedirect("login.html");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="DB.Dbconfig,java.sql.*" %>
        <%@ page import="pojo.admin" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/add_to_cart.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
body{
	    background-color: #e5e5e5;
}
.Remove{
    display: flex;
    item-aline:center;
  background-color:  #777556;
  color: white;
  padding: 5px 6px;
  text-align: center;
  text-decoration: none;
    width: 100px;
    height: 20px;
    align-items: center;
    justify-content: center;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  border-radius: 4px;
}
.card{
    margin: 15px auto;
    width: 1150px;
    display:  -webkit-box;
}
.my1{
    background-color: #ffffff;
    width: 700px;
    box-sizing: border-box;
    padding-left: 35px;
padding-top: 10px;
}
.item{
    border: 1px solid rgb(255, 255, 255);
    /* border: 1px solid rgb(161, 158, 158); */
    margin: 10px 1vw;
     display:flex;
     justify-content: center;
     height: 70px;
    align-items: center;
}
.item img{
        width: 60px;
    height: 50px;
    justify-items: center;
    margin: 10px;
}
.card-items{
    display: flow-root;
    background-color: rgb(255, 253, 253);
justify-content: center;
width: 700px;
border-radius: 11px;
  box-shadow: 4px 4px 30px rgb(0 0 0 / 60%);
}
.details{
   
    /* color: rgba(0, 0, 0, 0.479); */
    background-color: white;
    font-family: 'Arvo', serif;
    font-size:  medium;
    align-items: center;
    margin: 10px;
        justify-content: center;
    width:100px;
display: flex;
}
.details2{
   
    /* color: rgba(0, 0, 0, 0.479); */
    background-color: white;
    font-family: "Rubik", sans-serif;
    font-optical-sizing: auto;
    font-weight: 700;
    font-style: normal;
    align-items: center;
    margin: 10px;
        justify-content: center;
    width:240px;
display: flex;
}
.placeorder{
	display: flex;
    item-aline:center;
  background-color:  #777556;
  color: white;
  padding: 5px 6px;
  text-align: center;
  text-decoration: none;
    width: 100px;
    height: 20px;
    align-items: center;
    justify-content: center;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  border-radius: 4px;
}
 .placeorder:hover {
  background-color: #00c943; /* Darker green */
}
.item:hover{
    border: 1px solid  rgb(26, 25, 25);
      box-shadow: 4px 11px 15px rgb(0 0 0 / 60%);
}
.cart_item_details{
    display: flow-root;
    background-color: rgb(255 253 253);
    justify-content: center;
    width: 252px;
    margin: 50px;
        border-radius: 11px;
          box-shadow: 4px 4px 30px rgb(0 0 0 / 60%);
          height: min-content;
    padding-top: 15px;
    padding-bottom: 10px;
}
.row{
margin: 10px 20px;
    display: flex;
}
.cid{
 font-family: "Rubik", sans-serif;
    font-optical-sizing: auto;
    font-weight: 500;
    font-style: normal;
    margin: 0px 3px;
    width: 130px;
    text-align: center;
}
.rs{
  margin: 0px 7px;
    width: 60px;
    text-align: center;
}
</style>
</head>
<body>
<div class="container" >
 
        <h2 class="back_button"><a href="index.jsp"><img alt="" src="img/icon/back-button.png"></a></h2>
        <div class="card" >
           
            <div class="card-items">
             <h2 class="my1">Cart Products</h2>
               <% Connection conn=Dbconfig.getConnection(); 
 //PreparedStatement ps =null;
 int id=admin.getId();
 //int id =1;
 ResultSet rs=null;
 String query="select * from cart where customer_id = ?";
 PreparedStatement ps = conn.prepareStatement(query);
 ps.setInt(1, id);
 rs = ps.executeQuery();
 while(rs.next()){
	%>
	   <form action="remove_from_cart">
       <div class="item">
     <% String product_id=rs.getString(1);
     String name=rs.getString(2); 
      String image=rs.getString(3);
  String price=rs.getString(4);
  //out.println(product_id);
  %>
<img src="img\<%=rs.getString(3)%>" alt="">
           <p class="details"><b><%= rs.getString(2)%></b></p>
           <p class="details"><%=rs.getString(4)%>-/RS.</p>
           <p class="details"><%=rs.getString(5)%></p>
        <div class="details"><div class="Remove">
           <p><a href="remove_from_cart?id=<%=rs.getString(1)%>">Remove</a></p>
           </div></div>
           
           
           
            </div>
       </form>
       
        <% 
           }
           %>
            <%
            String query1="select sum(price) from cart where customer_id=?; ";
            PreparedStatement ps1 = conn.prepareStatement(query1);
            ps1.setInt(1, id);
            rs = ps1.executeQuery();
          rs.next();
          int T_price =rs.getInt(1);
          String t_price=String.valueOf(rs.getInt(1));
          session.setAttribute("total_price",t_price);
%>       
                
 </div>
 
 
 <div class="cart_item_details">
 <%
 String query2="select * from cart where customer_id = ?";
 PreparedStatement ps2 = conn.prepareStatement(query);
 ps2.setInt(1, id);
 rs = ps2.executeQuery();
 int a=0;
 while(rs.next()){
	 a=rs.getInt(1);
 %>
 <div class="row"><p class="cid" ><%= rs.getString(2)%>-</p>
  <p class="rs"><b><%= rs.getString(4)%>-/RS.</b></p>
  </div>
    
        
           <%
 }
           %>
         <br>  
 <div class="row"><div class="cid"><b>Total Amount-</b></div> 
 <div class="rs"><b><%=T_price%>-/RS.</b></div>
 
 </div>
 
 <%
 if(a>=1){
	%><div class="details2"><div class="placeorder">
           <p><a href="place_order.jsp">Place Order</a></p>
           </div></div>
           <%
 
}
           %>
           
 </div>
        </div>
    </div>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="DB.Dbconfig,java.sql.*" %>
    <%@ page import="pojo.admin" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
   
    <link rel="stylesheet" href="css/card.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    
    <style type="text/css">
    .card{
      margin: 15px auto;
    width: 1150px;
    box-shadow: 2px 2px 20px rgb(0 0 0 / 60%);
    }
    .back_button, img {
    width: 58px;
    margin-left: 0px; 
     margin-top: 0px; 
}
    .searchbar {
        width: 40vw;
    display: flex;
    align-items: center;
    justify-content: flex-start;
    flex-direction: row;
    background-color: white;
    border-radius: 4px;
   
    }
    .search{ 
         display: flex;
    width: 47px;
    border-radius: 2px;
    height: 30px;
    box-sizing: border-box;
    overflow: hidden;
    background-color: #232f3e;
    border: none;
    justify-content: center;
    align-items: center;;
    }
    .searchbar input{
        width: 35vw;
    height: 20px;
    border: none;
    outline: none;
    box-shadow: none;
    font-size: 16px;
    padding: 5px 9px;
    }
    .btn {
    font-family: 'Arvo', serif;
    color: white;
    /* background-color:hwb(217deg 16% 6%); */
    background-color: #131921;
    /*border: 1px solid white;*/
    border-radius: 7px;
    width: 2vw;
    cursor: pointer;

}
    nav ul {
    display: flex;
    width: 48vw;
    justify-content: center;
    align-items: center;
}
    nav ul li {
    list-style: none;
    width: 135px;
    display: flex;
     justify-content: center;
         margin: 0px 10px;
}
    
    nav ul li a {
    text-decoration: none;
    color: white;
      display: flex;
     justify-content: center;
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
.uname{
color: white;
//font-family:"Tiro Devanagari Marathi", serif;
}
.item img {
    width: 10vw;
    height: 16vh;
    justify-items: center;
    align-items: center;
    display: flex;
}
.item{
       border: none;
    display: grid;
    border-radius: 5px;
    margin: 15px;
    width: 186px;
    overflow-y: auto;
    box-sizing: border-box;
    overflow-x: hidden;
    justify-content: center;
    align-items: center;
    height: 200px;
}
   .item:hover{
        border: 0px solid rgb(26, 25, 25);
      box-shadow: 13px 13px 20px rgb(0 0 0 / 40%)
}
.card-items {
    display: flex;
    background-color: rgb(255, 253, 253);
    justify-content: flex-start;
    width: 1150px;
    overflow: auto;
}
.add-to-cart:hover {
  background-color: #fff200; /* Darker green */
}
.category ul li a {
    text-decoration: none;
    color: white;
        width: 132px;
            display: flex;
    align-items: center;
}
.category ul li {
    width: 20vw;
    display: flex;
justify-content: center;

}
.material-symbols-outlined {
 font-family: 'Material Symbols Outlined';
    font-weight: normal;
    font-style: normal;
    font-size: 24px;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    color: white;
    display: flex;
    white-space: nowrap;
    word-wrap: normal;
    justify-content:  flex-start;
    align-items: center;
    direction: ltr;
    -webkit-font-feature-settings: 'liga';
    -webkit-font-smoothing: antialiased;
    
}
.item:hover  ~.my1{
background-color: black;
}
</style>
</head>
<body>
<header>
        <nav>
            <nav>
                <div class="logo">
                    <h2>Balaji Supermarket</h2>
                </div>
                <div class="searchbar"><input type="text" placeholder="Search ">
                    <button class="search"><span class="material-symbols-outlined">
search
</span></button>
                </div>

                <ul>
                    
                    <%
                    
                    if(session.getAttribute("email")!=null){
                    	String name=(String)session.getAttribute("name");
                    	%>
                    	<div class="uname">
                    	<div class="name">Wellcome</div>
                    	 <div class="name"><span class="material-symbols-outlined">account_circle</span><%=name %></div>
                    	</div>
                    	
                    	
   <% Connection conn=Dbconfig.getConnection(); 
 //PreparedStatement ps =null;
 int id=admin.getId();
 //int id =1;
 ResultSet rs=null;
 String query1="select count(*) from cart where customer_id=?; ";
 PreparedStatement ps1 = conn.prepareStatement(query1);
 ps1.setInt(1, id);
 rs = ps1.executeQuery();
rs.next();
int No_row =rs.getInt(1);
	%>
                
                    

                                       <li>
                        <a href="cart.jsp"><span class="material-symbols-outlined">shopping_cart_checkout</span>Cart-<%=No_row%></a>
                    </li>
                        	 <%
                    }
                    %>
                   <%
                    if(session.getAttribute("email")==null){
                    	String name=(String)session.getAttribute("name");
                    	%>
                    <li>
                        <a href="Signup.html"><span class="material-symbols-outlined">login</span>Sign up/Login</a>
                    </li>
                       <%
                    }
                    %>
                    
                    <%
                    if(session.getAttribute("aemail")!=null){
                    	String mail=(String)session.getAttribute("aemail");
                    	session.setAttribute("aemail","mail");

                    	%>
                    <!-- <li>
                  
                        <a href="Admin_login.jsp"><span class="material-symbols-outlined">account_circle</span>Admin Login</a>
                    </li>
                   -->
                       <%
                    }
                   
                     else{
                    	
                    	%>
                   <!--  <li>
                  
                        <a href="Admin_login.jsp"><span class="material-symbols-outlined">account_circle</span>Admin Login</a>
                    </li>
                   -->
                       <%
                    }
                    %>
                    
                      <%
                    if(session.getAttribute("email")!=null){
                    	String name=(String)session.getAttribute("name");
                    	%>
                    <li>
                        <a href="order.jsp"><span class="material-symbols-outlined">logout</span>My Orders</a>
                    </li>
                     <%
                    }
                    %>
                      <%
                    if(session.getAttribute("email")!=null){
                    	String name=(String)session.getAttribute("name");
                    	%>
                    <li>
                        <a href="log_out"><span class="material-symbols-outlined">logout</span>Log out</a>
                    </li>
                     <%
                    }
                    %>
                </ul>
            </nav>
             </nav>
    </header>
    <main>

        <div class="container">
            <div class="category">
                <ul>
                   <% //<li><a href="All.html">All product</a></li>*/
                    //<li><a href="fresh produce.html">Fresh produce</a></li>%>
                    <li><a href="dairy.jsp ">Dairy<span class="material-symbols-outlined">grocery</span></a></li>
                    <li><a href="vegetable.jsp ">Vegetables<span class="material-symbols-outlined">eco</span></a></li>
                    
                    <li><a href="fruit.jsp">Fruits<span class="material-symbols-outlined">nutrition</span></a></li>
                    <li><a href="beverage.jsp">Beverages<span class="material-symbols-outlined">emoji_food_beverage</span></a></li>
                    <li><a href="household_items.jsp">Household items<span class="material-symbols-outlined">kitchen</span></a></li>
                </ul>
            </div>
           <% 
            //int id=admin.getId();
            //out.println(id);%>
            <div class="slider"><img src="css/login1-img.webp" alt=""></div>
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
             <div class="card" >
            <h2 class="my1">Dairy</h2>
            <div class="card-items">
               <% //Connection conn=Dbconfig.getConnection(); 
 //PreparedStatement ps =null;
 //ResultSet rs=null;
 String query1="select * from product where category_id=2";
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
<img src="img\dairy\<%=rs.getString(3)%>" alt="">
           <p class="details"><b><%= rs.getString(2)%></b></p>
           <p class="details"><%=rs.getString(4)%>-/RS.</p>
           <p class="details"><%=rs.getString(5)%></p>
           <div class="add-to-cart">
           <p><a onclick="popup()" href="add_to_cart?id=<%=rs.getString(1)%>">Add to cart</a></p>
          
           </div>
       </div>
       </form>
       <%
       }
 %>
 </div>
        </div>
        </div>
    </main>
    <footer class="text-center">
        <p>Copyright © 2022-2024 Supermarket Supplies Pvt Ltd</p>

    </footer>
</body>
</html>
   


                        

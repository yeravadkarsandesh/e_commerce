<%
if(session.getAttribute("email")==null){
	response.sendRedirect("login.html");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Cabin:wght@700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Rubik:ital,wght@0,300..900;1,300..900&family=Tiro+Devanagari+Marathi:ital@0;1&display=swap" rel="stylesheet">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Arvo&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Jost&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Jost&family=Libre+Baskerville&family=Noto+Serif:wght@300&display=swap');

* {
    margin: 0;
    padding: 0;
}
body{
    justify-content: center;
    align-items: center;
    display: flex;
    background-image: url(img/BGimg/address.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    min-height: 100vh;
    min-width: 100vw;
}



section{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    width: 450px;
    margin: 40px;
}

.login {
    background: transparent;
    backdrop-filter: blur(10px);
    border: 2px solid rgba(255, 255, 255, .5);
    width: 449px;
    height: auto;
    padding: 10px 40px;
    border-radius: 15px;
    box-sizing: border-box;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    box-shadow: 4px 4px 30px rgb(0 0 0 / 60%);
}

.login h2 {
    padding: 20px;
    display: flex;
    justify-content: center;
    font-family: 'Arvo', serif;


}

.box {
    display: flex;
    margin: 9px 0px;
    width: 365px;
    align-items: center;
    justify-content: center;
}

.label1{
 width: 40px;
    text-align: start;
    margin: 2px 15px;
    font-family: "Rubik", sans-serif;
    font-optical-sizing: auto;
    font-weight: 500;
    font-style: normal;
}

.label2{
 width: 50px;
    text-align: start;
    margin: 2px 5px;
    font-family: "Rubik", sans-serif;
    font-optical-sizing: auto;
    font-weight: 500;
    font-style: normal;
}
.label3{
 width: 90px;
    text-align: start;
    margin: 2px 5px;
    font-family: "Rubik", sans-serif;
    font-optical-sizing: auto;
    font-weight: 500;
    font-style: normal;
}
.label4{
 width: 140px;
    text-align: start;
    margin: 2px 5px;
    font-family: "Rubik", sans-serif;
    font-optical-sizing: auto;
    font-weight: 500;
    font-style: normal;
}

.label{
 width: 125px;
    text-align: start;
    margin: 2px 15px;
    font-family: "Rubik", sans-serif;
    font-optical-sizing: auto;
    font-weight: 400;
    font-style: normal;

}
.box input {
    width: 200px;
    outline: none;
    border: none;
    border-bottom: 2px solid black;
    background: transparent;
    color: white;
    font-family: 'Jost', sans-serif;

}

::placeholder {
    color: white;
}

.remember-forgot {
    display: flex;
    justify-content: space-between;
    margin: 20px 0px;
    font-size: .8em;
    font-family: 'Jost', sans-serif;

}

.remember-forgot label {
    display: flex;
    text-align: center;
    color: white;
}

.remember-forgot a {
    text-decoration: none;
    color: white;
}

.btn {
    display: flex;
    justify-content: center;
    padding: 10px;
    width: 65%;
    border-radius: 40px;
    background-color:white ;
    color: rgb(10, 9, 9);
    font-weight: 700;
    font-size: 1em;
    border: none;
    outline: none;
}
.btn:hover{
background-color:whitesmoke ;
}
.register {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 20px 0px;
    font-size: .8em;
    font-family: 'Jost', sans-serif;
    /* font-family: 'Libre Baskerville', serif;
    font-family: 'Noto Serif', serif; */
}

.register p {
    color: white;
}

.register a {
    color: white;
    text-decoration: none;
    font-weight: 700;
}
 .box input {
    width: 200px;
    outline: none;
    border: none;
    border-bottom: 2px solid black;
    background: transparent;
    color: #121111;
   font-family: "Lato", sans-serif;
  font-weight: 600;
  font-style: normal;
      font-size: revert;
 }

</style>
</head>
<body>
<main>
  <section>

 
<form action="order" method="post">
            <div class="login">
                <h2>Address Detail</h2>
                  <%String name=(String)session.getAttribute("name");%>
                <div class="box">
                <div class="label1"><p>Name-</p></div>
                    <b><%=name %></b>
                </div>
                <%String email=(String)session.getAttribute("email");%>
                  <div class="box">
                  <div class="label1"><p>Email-</p></div>
                    <b><%=email %></b>
                </div>
                <div class="box">
                <div class="label"><p>Contact-</p></div>
                    <input type="text" placeholder="Contact" name="con" required >
                  
                </div>
                <div class="box">
                <div class="label"><p>Street address-</p></div>
                    <input type="text" placeholder="Street address" name="Sadd" required>
                </div>
               <div class="box">
               <div class="label"><p>Postal_Code-</p></div>
                    <input type="text" placeholder="Postal Code" name="Pcode" required>
                </div>
                 <div class="box">
                 <div class="label"><p>Distric-</p></div>
                    <input type="text" placeholder="Distric" name="Dist" required>
                </div>
                 <div class="box">
                 <div class="label"><p>State-</p></div>
                    <input type="text" placeholder="State" name="State" required>
                </div>
                <div class="box">
                <div class="label2"><p>Date-</p></div>
               <p id="date"></p>

<script>
  // Get current date and time
  var now = new Date();
  var date = now.toLocaleString();

  // Insert date and time into HTML
  document.getElementById("date").innerHTML = date;
</script>
                </div>
                <%String total_price=(String)session.getAttribute("total_price");%>
              <div class="box">
              <div class="label3"><p>Total Price-</p></div>
               <b ><%=total_price%>-Rs.</b>
                </div>
                
                 
                 <div class="box">
                 <div class="label4"><p>Payment Method-</p></div>
                 <div class="Cash on delivery"><p><b>Cash on delivery</b></p></div>
                    
                </div>
                
                
                <button class="btn" type="submit">Place Order</button>
                </div>
                 </form>
                 </section>
                 </main>
</body>
</html>
                
                  
                
                                 
                
                   
                   
               
                
                
            
           
          
        
        

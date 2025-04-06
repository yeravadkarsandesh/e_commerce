<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
if(session.getAttribute("aemail")==null){
	response.sendRedirect("Admin_login.jsp");
}
%>
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
    margin: 0px;
    display: flex;
    justify-content: center;
    align-items: center;
        background-color: whitesmoke;
}
.back_button, img {
    width: 50px;
    margin-left: 10px;
    margin-top: -300px;
    }
.container{
display: flex;
    width: 700px;
    height: 300px;
    justify-content: center;
    align-items: center;
    box-shadow: 1px 1px 10px rgb(0 0 0 / 60%);
}
.Mstore{
width: 350px;
    height: 300px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
            background-color: aliceblue;
}
.Mstore:hover ~.Morders{
background-color: aliceblue;
}
.Mstore:hover{
    background-color:white;
}
.Morders
{
width: 350px;
    height: 300px;
    display: flex;
    justify-content: center;
    align-items: center;
        flex-direction: column;
            background-color: white;
        
            
}
.Morders:hover ~ .Mstore{
background-color: aliceblue;
}
.Morders:hover{
background-color:white;
}
.material-symbols-outlined {

    font-family: 'Material Symbols Outlined';
    font-weight: normal;
    font-style: normal;
    font-size: 150px;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    display: inline-block;
    white-space: nowrap;
    word-wrap: normal;
    direction: ltr;
    -webkit-font-feature-settings: 'liga';
    -webkit-font-smoothing: antialiased;
}
a
{
    text-decoration: none;
    color: black;
        font-size: 20px;
    
}

.log .material-symbols-outlined {
 font-family: 'Material Symbols Outlined';
    font-weight: normal;
    font-style: normal;
    font-size: 50px;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    color: #a7a7a7;
    display: flex;
    white-space: nowrap;
    word-wrap: normal;
    justify-content:  flex-start;
    align-items: center;
    direction: ltr;
    -webkit-font-feature-settings: 'liga';
    -webkit-font-smoothing: antialiased;
    
}

.log .material-symbols-outlined:hover{
        color: #3e3e3e;
    font-size: 50px;

}
</style>
</head>
<body>

                   
                   <div class="log">
     <a href="admin_logout"><span class="material-symbols-outlined">logout</span>Log out</a>
                   </div>
   
                    
                    
<h2 class="back_button"><a href="index.jsp"><img alt="" src="img/icon/back-button.png"></a></h2>
<div class="container">
<div class="Mstore">
<a href="Admin_Mstores.jsp"><span class="material-symbols-outlined">storefront</span></a>
<h3>Manage Store</h3>
</div>

<div class="Morders">
<a href="Admin_Morders.jsp"><span class="material-symbols-outlined">list_alt</span></a>
<h3>Manage Orders</h3>
</div>
</div>
</body>
</html>
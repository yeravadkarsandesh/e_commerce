<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% if(session.getAttribute("aemail")!=null){
    	response.sendRedirect("Admin.jsp");
    } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css">
<style type="text/css">
section {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-image:url(img/BGimg/adminlogin.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
}
.login {
    background: transparent;
    backdrop-filter: blur(10px);
    border: 2px solid rgba(255, 255, 255, .5);
    width: 300px;
    height: 320px;
    padding: 10px 40px;
    border-radius: 30px;
    box-sizing: border-box;
}
</style>
</head>
<body>
<section>
<form action="Admin_login" method="post">
            <div class="login">
                <h2>Login</h2>
                <div class="box">
                    <input type="email" placeholder="Email" name="aemail" required>
                    <span class="material-symbols-outlined">mail</span>
                </div>
                <div class="box">
                    <input type="password" placeholder="Password" name="apass" required>
                     <span class="material-symbols-outlined">
                    lock
                </span>
                </div>
                <div class="remember-forgot">
                    <label for="remember"><input type="checkbox"> Remember me</label>
                    <a href="#">Forgot password</a>
                </div>
                <button class="btn" onclick="popup" type="submit">Login</button>   
                           
            </div>
            </form>
        </section>
</body>
</html>
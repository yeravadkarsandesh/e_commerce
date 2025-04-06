<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page trimDirectiveWhitespaces="true" %>
    <%@page import="java.util.Map" %>
    <%@page import="java.util.HashMap" %>
    <%@page import="net.sf.jasperreports.engine.design.JRDesignQuery" %>
        <%@page import="net.sf.jasperreports.engine.xml.JRXmlLoader" %>
        <%@page import="net.sf.jasperreports.engine.design.JasperDesign" %>
            <%@page import="net.sf.jasperreports.view.JasperViewer" %>
        
    
<!DOCTYPE html>
    <%@page import="java.io.File" %>
        <%@page import="java.io.FileInputStream" %>
            <%@page import="java.io.FileNotFoundException" %>
            <%@page import="java.io.InputStream" %>
            
    <%@page import="java.sql.*" %>
        <%@ page import="DB.Dbconfig,java.sql.*" %>
<%@page import="net.sf.jasperreports.engine.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");

Connection	 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sandesh","root","sandesh0110");
String reportpath="C:/Users/SHASHIKANT/JaspersoftWorkspace/MyReports/sinup.jrxml";

JasperReport jr=JasperCompileManager.compileReport(reportpath);

JasperPrint  jp =JasperFillManager.fillReport(jr,null,conn);

JasperExportManager.exportReportToPdfStream(jp, response.getOutputStream());
response.getOutputStream().flush();
response.getOutputStream().close();

}


catch (SQLException | JRException e) {
e.printStackTrace();
} 

%>
</body>
</html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String password=request.getParameter("password");


Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/toursandtravel","root","root");
String s="insert into userloginsignup values(?,?,?)";
PreparedStatement p=cn.prepareStatement(s);

p.setString(1,name);
p.setString(2,email);
p.setString(3,password);

int i=p.executeUpdate();
if(i>0)
{
	response.sendRedirect("userlogin.html"); 
}


%>
</body>
</html>
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
String phone=request.getParameter("phone");
String packagedata=request.getParameter("package");
String message=request.getParameter("message");
String date=request.getParameter("date");
String time=request.getParameter("time");
String pickup=request.getParameter("pickup");

Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/toursandtravel","root","root");
String s="insert into tourpackagedata values(?,?,?,?,?,?,?,?)";
PreparedStatement p=cn.prepareStatement(s);

p.setString(1,name);
p.setString(2,email);
p.setString(3,phone);
p.setString(4,packagedata);
p.setString(5,message);
p.setString(6,date);
p.setString(7,time);
p.setString(8,pickup);
int i=p.executeUpdate();
if(i>0)
{
	response.sendRedirect("booksuccess.html"); 
}


%>
</body>
</html>
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
<h1 style="color:blue">Patient Receipt</h1>
<table border="1">
		<tr>
			<td>NAME</td>
			<td>EMAIL</td>
			<td>PHONE</td>
			<td>PACKAGE</td>
			<td>MESSAGE</td>
			<td>DATE</td>
			<td>TIME</td>
			<td>PICKUP</td>
		</tr>
		<%
			
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/toursandtravel","root","root");
		String s="select * from tourpackagedata";
		PreparedStatement p=cn.prepareStatement(s);
		ResultSet r=p.executeQuery();
		while(r.next())
		{
			%>
				<tr>
					<td><%=r.getString("name") %></td>
					<td><%=r.getString("email") %></td>
					<td><%=r.getString("phone") %></td>
					<td><%=r.getString("package") %></td>
					<td><%=r.getString("message") %></td>
					<td><%=r.getString("date") %></td>
					<td><%=r.getString("time") %></td>
					<td><%=r.getString("pickup") %></td>
				</tr>
			<%
		}
		%>
	</table><br><br>
<button onclick="window.print()">Print out</button><br><br><a href="index.html">Home page</a>
</body>
</html>
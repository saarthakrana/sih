<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Ticket Print</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #dfe8f2;
			padding: 20px;
		}
		
		.home-link {
      margin-top: 20px;
      font-size: 1rem;
      color: #4caf50;
      text-decoration: none;
      border-bottom: 1px dotted #4caf50;
      transition: all 0.3s ease-in-out;
    }
    
    .home-link:hover {
      opacity: 0.7;
    }
		
		.container {
			max-width: 800px;
			margin: 0 auto;
			padding: 20px;
			background-color: #dfe8f2;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
		}
		
		.ticket {
			background-color: #fff;
			padding: 200px;
			max-width: 400px;
			margin: 0 auto;
			box-shadow: 0 0 10px rgba(0,0,0,0.2);
			border-radius: 5px;
		}
		 h1 {
			text-align: center;
			margin-top: -100px;
			margin-bottom: 20px;
			color: #8cd439;
			display: block;
			width: 100%;
		}
		}
		table {
			width: 100%;
			border-collapse: collapse;
			margin-bottom: 20px;
		}
		th, td {
			padding: 10px;
			text-align: left;
			border-bottom: 1px solid #ddd;
		}
		th {
			background-color: #f2f2f2;
			font-weight: bold;
		}
		.company {
			margin-top: 10px;
			font-size: 12px;
			color: #999;
			text-align: center;
		}
	
		button[type="button"] {
			background-color: #4CAF50;
			color: white;
			padding: 14px 20px;
			margin: 8px 0;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			margin-right: 20px
			position: fixed;
			top: 20px;
			right: 50px;
			width: 100%;
			max-width: 200px;
		}
		button[type="button"]:hover {
			background-color: #45a049;
		}
		@media print {
			body * {
				visibility: hidden;
			}
			.ticket, .ticket * {
				visibility: visible;
			}
			.ticket {
				position: absolute;
				left: 0;
				top: 0;
				width: 100%;
			}
		}
	</style>
</head>
<body>


<%
String mobile=request.getParameter("mobile");
Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/toursandtravel","root","root");
String s="select * from tourpackagedata where phone="+mobile;
PreparedStatement p=cn.prepareStatement(s);
ResultSet r=p.executeQuery();
if(r.next())
{
	%>
	</table><br><br>

	<div class="ticket">
		<h1>Ticket Information</h1>
		<table>
			<tr>
				<th>Company Name:</th>
				<td>RDS Tour Service</td>
			</tr>
			<tr>
				<th>Passenger Name:</th>
				<td><%=r.getString("name") %></td>
			</tr>
			<tr>
				<th>Date:</th>
				<td><%=r.getString("date") %></td>
			</tr>
			<tr>
				<th>Time:</th>
				<td><%=r.getString("time") %></td>
			</tr>
			<tr>
				<th>Pickup Point:</th>
				<td><%=r.getString("pickup") %></td>
			</tr>
			<tr>
				<th>Package:</th>
				<td><%=r.getString("package") %></td>
			</tr>
			<tr>
				<th>Contact:</th>
				<td><%=r.getString("phone") %></td>
			</tr>
			<tr>
				<th>Ticket Number:</th>
				<td>123456789</td>
			</tr>
		</table>
	
	<%
}
else
{
	response.sendRedirect("invalidcontact.html");
}
%>

		<p>Thank you for choosing our company for your tour. We hope you enjoy your time with us!</p>
		<div class="company">

			<p>RDS Tour Service</p>
			<p>c-133 SAS Nagar Mohali, punjab-160103</p>
			<p>(+91) 7901847675</p>
			<p>rdstourservice@gmail.com</p>
		</div>
	</div>
	<button type="button" onclick="window.print()">Print Ticket</button>
	<a href="index.html" class="home-link">Back to Home Page</a>
</body>
</html>

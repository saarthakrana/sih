<!DOCTYPE html>
<html>
<head>
	<title>Print Ticket</title>
	<style type="text/css">
		body {
			background-color: #f2f2f2;
		}
		.container {
			width: 80%;
			margin: 0 auto;
			padding: 40px;
			background-color: #fff;
			text-align: center;
		}
		h1 {
			font-size: 48px;
			color: #333;
			margin-top: 0;
		}
		form {
			margin: 40px 0;
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		input[type="text"] {
			padding: 8px;
			font-size: 24px;
			border: none;
			border-radius: 8px;
			margin: 16px 0;
			box-shadow: 0 2px 5px rgba(0,0,0,0.2);
		}
		button {
			padding: 16px 32px;
			font-size: 24px;
			background-color: #4CAF50;
			color: #fff;
			border: none;
			border-radius: 8px;
			cursor: pointer;
			transition: background-color 0.3s ease;
		}
		button:hover {
			background-color: #388E3C;
		}
		p {
			font-size: 24px;
			color: #333;
			margin: 20px 0;
			line-height: 1.5;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>Print Ticket</h1>
		<form action="printticket.jsp" method="post">
			<label for="mobile">Enter Mobile number:</label>
			<input type="text" id="mobile" name="mobile" placeholder="Enter your mobile number...">
			<button type="submit">Get Print</button>
		</form>
		<p>If you have not registered yet, click <a href="usersignup.html">here</a> to register.</p>
		<p>If you have any issues, please <a href="contact.html">contact us</a>.</p>
		<p><a href="index.html">Home</a>.</p>
	</div>
</body>
</html>

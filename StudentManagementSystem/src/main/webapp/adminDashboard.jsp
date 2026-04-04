<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.model.AdminModal"%>

<%
AdminModal admin = (AdminModal) session.getAttribute("admin");
if (admin == null) {
	response.sendRedirect("index.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MS College | Admin Dashboard</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
:root {
	--primary: #16a34a;
	--dark: #022c22;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Segoe UI", sans-serif;
}

body {
	background: #f1f5f9;
}

.wrapper {
	display: flex;
	min-height: 100vh;
}

a {
	text-decoration: none;
	color: black;
}

.sidebar {
	width: 240px;
	background: var(--dark);
	color: white;
	padding: 20px;
}

.sidebar h2 {
	text-align: center;
	color: #4ade80;
	margin-bottom: 30px;
}

.sidebar a {
	display: block;
	padding: 12px;
	margin-bottom: 10px;
	color: white;
	text-decoration: none;
	border-radius: 6px;
}

.sidebar a:hover {
	background: #14532d;
}

.main {
	flex: 1;
}

.navbar {
	background: white;
	padding: 15px 25px;
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid #ddd;
}

.content {
	padding: 25px;
}

.cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
	gap: 20px;
}

.card {
	background: white;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
	text-align: center;
}

.card i {
	font-size: 28px;
	color: var(--primary);
	margin-bottom: 10px;
}

@media ( max-width : 768px) {
	.wrapper {
		flex-direction: column;
	}
	.sidebar {
		width: 100%;
	}
}
</style>
</head>

<body>

	<div class="wrapper">

		<div class="sidebar">
			<h2>MS College</h2>
			<a href="adminDashboard.jsp"><i class="fas fa-home"></i>
				Dashboard</a> 
				<a href="manageStudents.jsp"><i class="fas fa-users"></i>
				Students</a> 
				<a href="addStudent.jsp"><i class="fas fa-user-plus"></i>
				Add Student</a>
				
				 <a href="reports.jsp"><i class="fas fa-chart-bar"></i>
				Reports</a> <a href="LogoutController"><i
				class="fas fa-sign-out-alt"></i> Logout</a>
		</div>

		<div class="main">
			<div class="navbar">
				<h3>Admin Dashboard</h3>
				<span>Welcome, <b><%=admin.getName()%></b></span>
			</div>

			<div class="content">
				<div class="cards">
					<div class="card">
						<a href="manageStudents.jsp"> <i class="fas fa-users"></i>
							<h3>Students</h3>
							<p>Manage all students</p>
						</a>
					</div>

					

					<div class="card">
						<a href="reports.jsp"><i class="fas fa-chart-line"></i>
							<h3>Reports</h3>
							<p>View analytics</p> </a>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>

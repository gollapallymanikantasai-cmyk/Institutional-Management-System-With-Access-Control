<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.StudentModal" %>

<%
    StudentModal s = (StudentModal) session.getAttribute("s");
    if (s == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MS College | Student Dashboard</title>

<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
:root {
    --primary: #2563eb;
    --dark: #1e293b;
    --light: #f8fafc;
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

/* Sidebar */
.sidebar {
    width: 240px;
    background: var(--dark);
    color: white;
    padding: 20px;
}

.sidebar h2 {
    text-align: center;
    color: #60a5fa;
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
    background: #334155;
}

/* Main */
.main {
    flex: 1;
}

/* Navbar */
.navbar {
    background: white;
    padding: 15px 25px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #ddd;
}

/* Content */
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
    box-shadow: 0 8px 20px rgba(0,0,0,0.08);
    text-align: center;
}

.card i {
    font-size: 28px;
    color: var(--primary);
    margin-bottom: 10px;
}

/* Mobile */
@media (max-width: 768px) {
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
        <a href="#"><i class="fas fa-home"></i> Dashboard</a>
        <a href="studentProfile.jsp"><i class="fas fa-user"></i> My Profile</a>
        <a href="StudentCourse.jsp"><i class="fas fa-book"></i> My Course</a>
        <a href="results.jsp"><i class="fas fa-clipboard"></i> Results</a>
        <a href="LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <div class="main">
        <div class="navbar">
            <h3>Student Dashboard</h3>
            <span>Welcome, <b><%= s.getFirstName() %></b></span>
        </div>

        <div class="content">
            <div class="cards">
                <div class="card">
                    <i class="fas fa-user-graduate"></i>
                    <h3><%= s.getCourse() %></h3>
                    <p>Enrolled Course</p>
                </div>

                <div class="card">
                    <i class="fas fa-envelope"></i>
                    <h3>Email</h3>
                    <p><%= s.getEmail() %></p>
                </div>

                <div class="card">
                    <i class="fas fa-phone"></i>
                    <h3>Mobile</h3>
                    <p><%= s.getMobile() %></p>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>

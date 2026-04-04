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

<title>MS College | My Course</title>

<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
:root {
    --primary: #2563eb;
    --dark: #1e293b;
    --accent: #38bdf8;
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

/* Layout */
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
    color: var(--accent);
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

.sidebar a:hover,
.sidebar a.active {
    background: #334155;
}

/* Main */
.main {
    flex: 1;
}

.navbar {
    background: white;
    padding: 15px 25px;
    border-bottom: 1px solid #ddd;
    display: flex;
    justify-content: space-between;
}

.content {
    padding: 30px;
}

/* Course Card */
.course-wrapper {
    max-width: 700px;
    margin: auto;
}

.course-card {
    background: white;
    padding: 35px;
    border-radius: 18px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.08);
    text-align: center;
}

.course-icon {
    font-size: 70px;
    color: var(--primary);
    margin-bottom: 20px;
}

.course-card h2 {
    color: #1e293b;
    margin-bottom: 10px;
}

.course-card p {
    color: #64748b;
    margin-bottom: 20px;
}

.course-info {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 15px;
    margin-top: 20px;
}

.info-box {
    background: #f8fafc;
    padding: 15px;
    border-radius: 10px;
    font-weight: 600;
}

/* Mobile */
@media (max-width: 768px) {
    .wrapper {
        flex-direction: column;
    }

    .sidebar {
        width: 100%;
    }

    .course-info {
        grid-template-columns: 1fr;
    }
}
</style>
</head>

<body>

<div class="wrapper">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>MS College</h2>
        <a href="studentDashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
        <a href="studentCourse.jsp" class="active"><i class="fas fa-book"></i> My Course</a>
        <a href="studentProfile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main -->
    <div class="main">

        <!-- Navbar -->
        <div class="navbar">
            <h3>My Course</h3>
            <span>Welcome, <b><%= s.getFirstName() %></b></span>
        </div>

        <!-- Content -->
        <div class="content">

            <div class="course-wrapper">
                <div class="course-card">

                    <div class="course-icon">
                        <i class="fas fa-graduation-cap"></i>
                    </div>

                    <h2><%= s.getCourse() %></h2>
                    <p>You are currently enrolled in the following course at MS College.</p>

                    <div class="course-info">
                        <div class="info-box">Department: <%= s.getCourse() %></div>
                        <div class="info-box">Duration: 4 Years</div>
                        <div class="info-box">College: MS College</div>
                        <div class="info-box">Status: Active</div>
                    </div>

                </div>
            </div>

        </div>

    </div>

</div>

</body>
</html>

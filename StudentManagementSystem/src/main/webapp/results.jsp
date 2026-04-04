<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.StudentModal" %>

<%
    StudentModal s = (StudentModal) session.getAttribute("s");
    if (s == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    int marks = 0;
    try {
        marks = Integer.parseInt(s.getMarks());
    } catch(Exception e) {}

    String grade = "F";
    String status = "Fail";

    if (marks >= 90) { grade = "A+"; status = "Pass"; }
    else if (marks >= 75) { grade = "A"; status = "Pass"; }
    else if (marks >= 60) { grade = "B"; status = "Pass"; }
    else if (marks >= 50) { grade = "C"; status = "Pass"; }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>MS College | My Results</title>

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

/* Result Card */
.result-card {
    max-width: 800px;
    margin: auto;
    background: white;
    padding: 35px;
    border-radius: 18px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.08);
}

.result-header {
    text-align: center;
    margin-bottom: 25px;
}

.result-header i {
    font-size: 70px;
    color: var(--primary);
}

.result-header h2 {
    margin-top: 10px;
    color: var(--dark);
}

/* Result Grid */
.result-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 18px;
    margin-top: 25px;
}

.result-box {
    background: #f8fafc;
    padding: 18px;
    border-radius: 12px;
    font-weight: 600;
}

/* Status */
.pass {
    color: #16a34a;
    font-weight: bold;
}

.fail {
    color: #dc2626;
    font-weight: bold;
}

/* Mobile */
@media (max-width: 768px) {
    .wrapper {
        flex-direction: column;
    }
    .sidebar {
        width: 100%;
    }
    .result-grid {
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
        <a href="StudentCourse.jsp"><i class="fas fa-book"></i> My Course</a>
        <a href="studentResults.jsp" class="active"><i class="fas fa-chart-line"></i> Results</a>
        <a href="studentProfile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main -->
    <div class="main">

        <!-- Navbar -->
        <div class="navbar">
            <h3>My Results</h3>
            <span>Welcome, <b><%= s.getFirstName() %></b></span>
        </div>

        <!-- Content -->
        <div class="content">

            <div class="result-card">

                <div class="result-header">
                    <i class="fas fa-award"></i>
                    <h2>Semester Result</h2>
                </div>

                <div class="result-grid">
                    <div class="result-box">Name: <%= s.getFirstName() %> <%= s.getLastName() %></div>
                    <div class="result-box">Course: <%= s.getCourse() %></div>
                    <div class="result-box">Marks: <%= s.getMarks() %></div>
                    <div class="result-box">Grade: <%= grade %></div>
                    <div class="result-box">College: MS College</div>
                    <div class="result-box">
                        Status:
                        <span class="<%= status.equals("Pass") ? "pass" : "fail" %>">
                            <%= status %>
                        </span>
                    </div>
                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>

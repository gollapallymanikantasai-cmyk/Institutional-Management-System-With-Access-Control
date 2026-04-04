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

<title>MS College | My Profile</title>

<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
:root {
    --primary: #2563eb;
    --dark: #1e293b;
    --accent: #38bdf8;
    --bg: #f1f5f9;
    --muted: #64748b;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", sans-serif;
}

body {
    background: var(--bg);
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

/* Profile Card */
.profile-wrapper {
    max-width: 800px;
    margin: auto;
}

.profile-card {
    background: white;
    padding: 35px;
    border-radius: 20px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.08);
}

.profile-header {
    text-align: center;
    margin-bottom: 30px;
}

.profile-header i {
    font-size: 90px;
    color: var(--primary);
}

.profile-header h2 {
    margin-top: 10px;
    color: var(--dark);
}

.profile-header p {
    color: var(--muted);
}

/* Profile Info */
.profile-info {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
}

.profile-item {
    background: #f8fafc;
    padding: 15px;
    border-radius: 12px;
}

.profile-item span {
    display: block;
    font-size: 13px;
    color: var(--muted);
}

.profile-item strong {
    font-size: 15px;
    color: var(--dark);
}

/* Actions */
.profile-actions {
    margin-top: 30px;
    text-align: center;
}

.profile-actions a {
    background: var(--primary);
    color: white;
    padding: 12px 26px;
    border-radius: 10px;
    text-decoration: none;
    font-weight: 600;
    margin: 0 8px;
    display: inline-block;
}

.profile-actions a:hover {
    background: #1d4ed8;
}

/* Mobile */
@media (max-width: 768px) {
    .wrapper {
        flex-direction: column;
    }

    .sidebar {
        width: 100%;
    }

    .profile-info {
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
        <a href="studentProfile.jsp" class="active"><i class="fas fa-user"></i> Profile</a>
        <a href="LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main -->
    <div class="main">

        <!-- Navbar -->
        <div class="navbar">
            <h3>My Profile</h3>
            <span>Welcome, <b><%= s.getFirstName() %></b></span>
        </div>

        <!-- Content -->
        <div class="content">

            <div class="profile-wrapper">
                <div class="profile-card">

                    <div class="profile-header">
                        <i class="fas fa-user-circle"></i>
                        <h2><%= s.getFirstName() %> <%= s.getLastName() %></h2>
                        <p>Student at MS College</p>
                    </div>

                    <div class="profile-info">
                        <div class="profile-item">
                            <span>Username</span>
                            <strong><%= s.getUserName() %></strong>
                        </div>

                        <div class="profile-item">
                            <span>Email</span>
                            <strong><%= s.getEmail() %></strong>
                        </div>

                        <div class="profile-item">
                            <span>Mobile</span>
                            <strong><%= s.getMobile() %></strong>
                        </div>

                        <div class="profile-item">
                            <span>Course</span>
                            <strong><%= s.getCourse() %></strong>
                        </div>

                        <div class="profile-item">
                            <span>Marks</span>
                            <strong><%= s.getMarks() %></strong>
                        </div>

                        <div class="profile-item">
                            <span>State</span>
                            <strong><%= s.getState() %></strong>
                        </div>
                    </div>

                    <div class="profile-actions">
                        <a href="editStudentProfile.jsp?u=<%=s.getUserName()%>">
                            <i class="fas fa-edit"></i> Edit Profile
                        </a>
                    </div>

                </div>
            </div>

        </div>

    </div>

</div>

</body>
</html>

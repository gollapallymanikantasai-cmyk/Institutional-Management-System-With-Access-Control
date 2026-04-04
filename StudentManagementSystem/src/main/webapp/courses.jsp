<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>MS College | Courses</title>

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
:root {
    --primary: #2563eb;
    --dark: #022c22;
    --success: #16a34a;
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

.sidebar a:hover,
.sidebar a.active {
    background: #14532d;
}

/* Main */
.main {
    flex: 1;
}

.navbar {
    background: white;
    padding: 15px 25px;
    border-bottom: 1px solid #ddd;
}

.content {
    padding: 30px;
}

/* Course Cards */
.course-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
    gap: 25px;
}

.course-card {
    background: white;
    border-radius: 18px;
    padding: 30px;
    text-align: center;
    box-shadow: 0 15px 30px rgba(0,0,0,0.08);
    transition: 0.3s;
}

.course-card:hover {
    transform: translateY(-8px);
}

.course-icon {
    font-size: 55px;
    color: var(--primary);
    margin-bottom: 15px;
}

.course-card h3 {
    color: #1e293b;
    margin-bottom: 8px;
}

.course-card p {
    font-size: 14px;
    color: #64748b;
    margin-bottom: 15px;
}

/* Button */
.course-card a {
    display: inline-block;
    padding: 10px 20px;
    background: var(--success);
    color: white;
    border-radius: 8px;
    text-decoration: none;
    font-size: 14px;
}

.course-card a:hover {
    background: #15803d;
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

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>MS College</h2>
        <a href="adminDashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
        <a href="addStudent.jsp"><i class="fas fa-user-plus"></i> Add Student</a>
        <a href="manageStudents.jsp"><i class="fas fa-users"></i> Manage Students</a>
        <a href="courses.jsp" class="active"><i class="fas fa-book"></i> Courses</a>
        <a href="LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main -->
    <div class="main">

        <!-- Navbar -->
        <div class="navbar">
            <h3>Courses Offered</h3>
        </div>

        <!-- Content -->
        <div class="content">

            <div class="course-grid">

                <!-- CSE -->
                <div class="course-card">
                    <div class="course-icon">
                        <i class="fas fa-laptop-code"></i>
                    </div>
                    <h3 name="CSE">Computer Science</h3>
                    <p>CSE focuses on programming, software development, and modern technologies.</p>
                    <%!String course1="CSE"; %>
                    <a href="cseStudents.jsp?course=<%=course1%>">View Students</a>
                </div>

                <!-- ECE -->
                <div class="course-card">
                    <div class="course-icon">
                        <i class="fas fa-microchip"></i>
                    </div>
                    <h3>Electronics & Communication</h3>
                    <p>ECE deals with electronics, communication systems, and embedded design.</p>
                    <% String course2="ECE"; %>
                    <a href="eceStudents.jsp?course=<%=course2%>">View Students</a>
                </div>

                <!-- EEE -->
                <div class="course-card">
                    <div class="course-icon">
                        <i class="fas fa-bolt"></i>
                    </div>
                    <h3>Electrical Engineering</h3>
                    <p>EEE covers power systems, electrical machines, and control systems.</p>
                    <%String course3="EEE"; %>
                    <a href="cseStudents.jsp?course=<%=course3%>">View Students</a>
                </div>

                <!-- MECH -->
                <div class="course-card">
                    <div class="course-icon">
                        <i class="fas fa-gears"></i>
                    </div>
                    <h3>Mechanical Engineering</h3>
                    <p>MECH focuses on machines, manufacturing, and thermal engineering.</p>
                    <%String course4="MECH"; %>
                    <a href="cseStudents.jsp?course=<%=course4%>">View Students</a>
                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>

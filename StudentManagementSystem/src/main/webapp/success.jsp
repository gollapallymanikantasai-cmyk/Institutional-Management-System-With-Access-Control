<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>MS College | Success</title>

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

.sidebar a:hover {
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

/* Success Card */
.success-card {
    max-width: 500px;
    margin: 60px auto;
    background: white;
    padding: 40px;
    border-radius: 18px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.1);
    text-align: center;
}

.success-icon {
    font-size: 70px;
    color: var(--primary);
    margin-bottom: 20px;
}

.success-card h1 {
    color: var(--dark);
    margin-bottom: 10px;
}

.success-card p {
    color: #475569;
    font-size: 15px;
    margin-bottom: 25px;
}

/* Buttons */
.actions a {
    display: inline-block;
    padding: 12px 25px;
    border-radius: 8px;
    text-decoration: none;
    color: white;
    font-weight: 600;
    margin: 5px;
}

.back-btn {
    background: #16a34a;
}

.back-btn:hover {
    background: #15803d;
}

.dashboard-btn {
    background: #2563eb;
}

.dashboard-btn:hover {
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
        <a href="LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main -->
    <div class="main">

        <div class="navbar">
            <h3>Student Registration</h3>
        </div>

        <div class="content">

            <div class="success-card">
                <div class="success-icon">
                    <i class="fas fa-check-circle"></i>
                </div>

                <h1>Success!</h1>
                <p>Student has been registered successfully in MS College.</p>

                <div class="actions">
                    <a href="addStudent.jsp" class="back-btn">
                        <i class="fas fa-arrow-left"></i> Add Another Student
                    </a>
                    <a href="adminDashboard.jsp" class="dashboard-btn">
                        <i class="fas fa-home"></i> Dashboard
                    </a>
                </div>
            </div>

        </div>

    </div>

</div>

</body>
</html>

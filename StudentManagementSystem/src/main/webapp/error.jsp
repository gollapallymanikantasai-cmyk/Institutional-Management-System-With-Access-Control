<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>MS College | Error</title>

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
:root {
    --danger: #dc2626;
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

/* Error Card */
.error-card {
    max-width: 520px;
    margin: 70px auto;
    background: white;
    padding: 45px;
    border-radius: 18px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.1);
    text-align: center;
}

.error-icon {
    font-size: 70px;
    color: var(--danger);
    margin-bottom: 20px;
}

.error-card h1 {
    color: var(--danger);
    margin-bottom: 10px;
}

.error-card p {
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

.retry-btn {
    background: #dc2626;
}

.retry-btn:hover {
    background: #b91c1c;
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
        <a href="#"><i class="fas fa-users"></i> Manage Students</a>
        <a href="LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main -->
    <div class="main">

        <div class="navbar">
            <h3>Error Occurred</h3>
        </div>

        <div class="content">

            <div class="error-card">
                <div class="error-icon">
                    <i class="fas fa-circle-exclamation"></i>
                </div>

                <h1>Oops!</h1>

                <p>
                    <%
                        String errorMsg = (String) request.getAttribute("errorMsg");
                        if (errorMsg == null) {
                            errorMsg = "Something went wrong. Please try again.";
                        }
                    %>
                    <%= errorMsg %>
                </p>

                <div class="actions">
                    <a href="addStudent.jsp" class="retry-btn">
                        <i class="fas fa-rotate-right"></i> Try Again
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

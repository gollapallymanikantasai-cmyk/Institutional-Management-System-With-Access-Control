<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
    import="com.dao.StudentDAO,com.model.StudentModal"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MS College | Student Profile</title>

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
}

.content {
    padding: 30px;
}

/* Form Card */
.form-card {
    background: white;
    max-width: 900px;
    margin: auto;
    padding: 30px;
    border-radius: 18px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.08);
}

.form-card h2 {
    text-align: center;
    margin-bottom: 25px;
    color: var(--dark);
}

/* Grid Form */
.form-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 6px;
    font-weight: 600;
}

.form-group input,
.form-group select {
    width: 100%;
    padding: 10px;
    border: 1px solid #cbd5e1;
    border-radius: 8px;
    font-size: 14px;
}

.form-group input:focus,
.form-group select:focus {
    outline: none;
    border-color: var(--primary);
}

/* Buttons */
.form-actions {
    margin-top: 25px;
    text-align: center;
}

.form-actions button {
    background: var(--primary);
    color: white;
    border: none;
    padding: 12px 30px;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    margin-right: 10px;
}

.form-actions button:hover {
    background: #1d4ed8;
}

.form-actions .reset-btn {
    background: #64748b;
}

.form-actions .reset-btn:hover {
    background: #475569;
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

<%
    String UserName = request.getParameter("u");
    StudentDAO sd = new StudentDAO();
    StudentModal sm = sd.SelectByUserName(UserName);
%>

<div class="wrapper">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>MS College</h2>
        <a href="studentDashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
        <a href="studentProfile.jsp" class="active"><i class="fas fa-user"></i> My Profile</a>
        <a href="StudentCourse.jsp"><i class="fas fa-book"></i> My Course</a>
        <a href="LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main -->
    <div class="main">

        <div class="navbar">
            <h3>Edit Profile</h3>
        </div>

        <div class="content">
            <div class="form-card">
                <h2>Student Profile</h2>

                <form action="EditStudentProfileController" method="post">

                    <div class="form-grid">

                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" name="userName"
                                   value="<%=sm.getUserName()%>" readonly>
                        </div>

                        <div class="form-group">
                            <label>First Name</label>
                            <input type="text" name="firstName"
                                   value="<%=sm.getFirstName()%>" required>
                        </div>

                        <div class="form-group">
                            <label>Last Name</label>
                            <input type="text" name="lastName"
                                   value="<%=sm.getLastName()%>" required>
                        </div>

                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email"
                                   value="<%=sm.getEmail()%>" required>
                        </div>

                        <div class="form-group">
                            <label>Mobile</label>
                            <input type="text" name="mobile"
                                   value="<%=sm.getMobile()%>" required>
                        </div>
                         <div class="form-group">
                            <label>Marks</label>
                            <input type="text" name="marks"
                                   value="<%=sm.getMarks()%>" readonly>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input type="text" name="password"
                                   value="<%=sm.getPassword()%>" required>
                        </div>

                        <div class="form-group">
                            <label>Course</label>
                            <select name="course">
                                <option selected><%=sm.getCourse()%></option>
                                <option>CSE</option>
                                <option>ECE</option>
                                <option>EEE</option>
                                <option>MECH</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>State</label>
                            <select name="state">
                                <option selected><%=sm.getState()%></option>
                                <option>Andhra Pradesh</option>
                                <option>Telangana</option>
                                <option>Karnataka</option>
                                <option>Tamil Nadu</option>
                                <option>Maharashtra</option>
                            </select>
                        </div>

                    </div>

                    <div class="form-actions">
                        <button type="submit">
                            <i class="fas fa-save"></i> Update Profile
                        </button>
                        <button type="reset" class="reset-btn">
                            <i class="fas fa-undo"></i> Reset
                        </button>
                    </div>

                </form>

            </div>
        </div>

    </div>

</div>

</body>
</html>

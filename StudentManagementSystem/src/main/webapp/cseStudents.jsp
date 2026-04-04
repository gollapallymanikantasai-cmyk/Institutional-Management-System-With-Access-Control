<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.AdminModal"%>
<%@ page import="com.model.StudentModal, java.util.*, com.dao.StudentDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MS College | Manage Students</title>

<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
:root {
    --primary: #16a34a;
    --dark: #022c22;
    --light: #f1f5f9;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", sans-serif;
}

body {
    background: var(--light);
    overflow-x: hidden; /* 🔒 NO HORIZONTAL SLIDE */
}

/* Layout */
.wrapper {
    display: flex;
    width: 100%;
    min-height: 100vh;
}

/* Sidebar */
.sidebar {
    width: 240px;
    min-width: 240px;
    background: var(--dark);
    color: white;
    padding: 20px;
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
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
    margin-left: 240px;
    width: calc(100% - 240px);
}

/* Navbar */
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

/* Card */
.card {
    background: white;
    padding: 25px;
    border-radius: 14px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
}

/* Table Container */
.table-container {
    width: 100%;
    overflow-x: hidden; /* 🔒 NO SLIDE */
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed; /* 🔒 FORCE FIT */
}

th, td {
    padding: 10px;
    text-align: left;
    word-wrap: break-word;
    white-space: normal;
    font-size: 13px;
}

th {
    background: var(--primary);
    color: white;
}

tr:nth-child(even) {
    background: #f8fafc;
}

tr:hover {
    background: #e5f9ee;
}

/* Action buttons */
.action-btn {
    padding: 6px 10px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 12px;
    display: inline-block;
}

.edit-btn {
    background: #2563eb;
    color: white;
}

.edit-btn:hover {
    background: #1d4ed8;
}

.delete-btn {
    background: #dc2626;
    color: white;
}

.delete-btn:hover {
    background: #b91c1c;
}

/* Modal */
.modal {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.6);
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    pointer-events: none;
    transition: 0.3s;
    z-index: 1000;
}

.modal:target {
    opacity: 1;
    pointer-events: auto;
}

.modal-box {
    background: white;
    padding: 25px;
    border-radius: 14px;
    width: 380px;
    text-align: center;
}

.modal-actions {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    gap: 15px;
}

.confirm-btn {
    background: #dc2626;
    color: white;
    padding: 10px 18px;
    border-radius: 8px;
    text-decoration: none;
}

.cancel-btn {
    background: #e5e7eb;
    color: black;
    padding: 10px 18px;
    border-radius: 8px;
    text-decoration: none;
}
</style>
</head>

<body>

<%
AdminModal am = (AdminModal) session.getAttribute("admin");
if (am == null) {
    response.sendRedirect("adminDashboard.jsp");
    return;
}
String course=request.getParameter("course1");
StudentDAO sd = new StudentDAO();
List<StudentModal> l = sd.selectByCourse(course);
%>

<div class="wrapper">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>MS College</h2>
        <a href="adminDashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
        <a href="manageStudents.jsp"><i class="fas fa-users"></i> Manage Students</a>
        <a href="addStudent.jsp"><i class="fas fa-user-plus"></i> Add Student</a>
        <a href="courses.jsp"><i class="fas fa-book"></i> Courses</a>
        <a href="LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main -->
    <div class="main">

        <div class="navbar">
            <h3>Manage Students</h3>
            <span>Welcome, <b><%=am.getName()%></b></span>
        </div>

        <div class="content">
            <div class="card">
                <h3>Student List</h3>

                <div class="table-container">
                    <table>
                        <tr>
                            <th>Username</th>
                            <th>First</th>
                            <th>Last</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>Percentage</th>
                            <th>Course</th>
                            <th>State</th>
                            <th colspan="2">Action</th>
                        </tr>

                        <% for(StudentModal sm : l){ %>
                        <tr>
                            <td><%=sm.getUserName()%></td>
                            <td><%=sm.getFirstName()%></td>
                            <td><%=sm.getLastName()%></td>
                            <td><%=sm.getEmail()%></td>
                            <td><%=sm.getMobile()%></td>
                            <td><%=sm.getMarks()%></td>
                            <td><%=sm.getCourse()%></td>
                            <td><%=sm.getState()%></td>

                            <td>
                                <a class="action-btn edit-btn"
                                   href="editStudent.jsp?u=<%=sm.getUserName()%>">
                                   <i class="fas fa-pen"></i>
                                </a>
                            </td>

                            <td>
                                <a class="action-btn delete-btn"
                                   href="#deleteModal<%=sm.getUserName()%>">
                                   <i class="fas fa-trash"></i>
                                </a>
                            </td>
                        </tr>

                        <!-- Delete Modal -->
                        <div id="deleteModal<%=sm.getUserName()%>" class="modal">
                            <div class="modal-box">
                                <h3 style="color:red;">Delete Student</h3>
                                <p>Are you sure you want to delete
                                    <b><%=sm.getFirstName()%> <%=sm.getLastName()%></b>?</p>
                                <div class="modal-actions">
                                    <a class="confirm-btn"
                                       href="DeleteStudentController?u=<%=sm.getUserName()%>">Yes</a>
                                    <a class="cancel-btn" href="#">Cancel</a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </table>
                </div>

            </div>
        </div>

    </div>
</div>

</body>
</html>

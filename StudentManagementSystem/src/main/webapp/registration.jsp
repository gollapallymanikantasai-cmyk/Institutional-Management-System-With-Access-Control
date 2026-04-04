<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>

<style>
    body {
        margin: 0;
        padding: 0;
        min-height: 100vh;
        font-family: "Segoe UI", Tahoma, sans-serif;
        background: linear-gradient(135deg, #667eea, #764ba2);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .register-container {
        background: #ffffff;
        width: 460px;
        padding: 25px 35px;
        border-radius: 14px;
        box-shadow: 0 18px 35px rgba(0,0,0,0.25);
    }

    .register-container h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .row {
        display: flex;
        gap: 12px;
    }

    .field {
        flex: 1;
        margin-bottom: 14px;
    }

    label {
        display: block;
        font-size: 13px;
        color: #555;
        margin-bottom: 4px;
        font-weight: 600;
    }

    input, select {
        width: 100%;
        
        padding: 9px 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
    }

    input:focus, select:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 6px rgba(102,126,234,0.4);
    }

    .register-btn {
        width: 100%;
        margin-top: 10px;
        padding: 11px;
        background: #667eea;
        border: none;
        border-radius: 8px;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
    }

    .register-btn:hover {
        background: #5a67d8;
    }

    .links {
        text-align: center;
        margin-top: 12px;
        font-size: 14px;
    }

    .links a {
        color: #667eea;
        text-decoration: none;
        font-weight: 600;
    }

    .links a:hover {
        text-decoration: underline;
    }
</style>
</head>

<body>
<div class="register-container">
    <form method="post" action="RegisterController">
        <h1>Student Registration</h1>

        <div class="field">
            <label>Username</label>
            <input type="text" name="username" required>
        </div>

        <div class="row">
            <div class="field">
                <label>First Name</label>
                <input type="text" name="firstname" required>
            </div>
            <div class="field">
                <label>Last Name</label>
                <input type="text" name="lastname" required>
            </div>
        </div>

        <div class="field">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>

        <div class="row">
            <div class="field">
                <label>Mobile</label>
                <input type="text" name="mobile" required>
            </div>
            <div class="field">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>
        </div>

        <div class="row">
            <div class="field">
                <label>Course</label>
                <select name="course" required>
                    <option value="">Select Course</option>
                    <option value="EEE">EEE</option>
                    <option value="CSE">CSE</option>
                    <option value="ECE">ECE</option>
                    <option value="MECH">MECH</option>
                </select>
            </div>

            <div class="field">
                <label>State</label>
                <select name="state" required>
                    <option value="">Select State</option>
                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                    <option value="Telangana">Telangana</option>
                    <option value="Tamil Nadu">Tamil Nadu</option>
                    <option value="Karnataka">Karnataka</option>
                    <option value="Maharashtra">Maharashtra</option>
                </select>
            </div>
        </div>

        <button type="submit" class="register-btn">Register</button>

        <div class="links">
            Already have an account?
            <a href="index.jsp">Login</a>
        </div>
    </form>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            font-family: "Segoe UI", Tahoma, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: #ffffff;
            width: 350px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }

        .login-container h1 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-weight: 600;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102,126,234,0.5);
        }

        .login-btn {
            width: 100%;
            padding: 10px;
            background: #667eea;
            border: none;
            border-radius: 6px;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-btn:hover {
            background: #5a67d8;
        }

        .links {
            text-align: center;
            margin-top: 15px;
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
    <div class="login-container">
        <form method="post" action="AdminLoginController">
            <h1>Admin Login</h1>

            <label>User Name</label>
            <input type="text" name="userName" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <button type="submit" class="login-btn">Login</button>

            <div class="links">
                <a href="index.jsp">Student Login</a>
            </div>
        </form>
    </div>
</body>
</html>

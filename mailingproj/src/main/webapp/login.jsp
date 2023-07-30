<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            width: 400px;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        .input-container {
            margin-bottom: 20px;
        }

        .input-container label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }

        .input-container input[type="text"],
        .input-container input[type="password"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            color: #333;
            transition: border-color 0.2s ease-in-out;
        }

        .input-container input[type="text"]:focus,
        .input-container input[type="password"]:focus {
            outline: none;
            border-color: #007bff;
        }

        .input-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }

        .input-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .login-container p.error-message {
            text-align: center;
            color: #ff0000;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <div class="input-container">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-container">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="input-container">
                <input type="submit" value="Login">
            </div>
        </form>
    </div>
</body>
</html>

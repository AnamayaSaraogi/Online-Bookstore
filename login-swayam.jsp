<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #2c3e50;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #ecf0f1;
        }

        .container {
            background-color: #34495e;
            padding: 50px;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.4);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 25px;
            color: #ecf0f1;
        }

        p {
            color: #bdc3c7;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 2px solid #bdc3c7;
            border-radius: 6px;
            background-color: #ecf0f1;
            font-size: 16px;
            color: #2c3e50;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #e74c3c;
            border: none;
            border-radius: 6px;
            font-size: 18px;
            color: white;
            cursor: pointer;
            margin-top: 15px;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
        }

        .signup-link {
            margin-top: 15px;
            display: block;
            color: #ecf0f1;
            text-decoration: none;
        }

        .signup-link:hover {
            text-decoration: underline;
        }

        .error {
            color: #e74c3c;
            margin-bottom: 15px;
            font-size: 14px;
        }

        @media screen and (max-width: 600px) {
            .container {
                padding: 30px;
            }

            h1 {
                font-size: 28px;
            }

            input[type="submit"] {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Log In</h1>

        <%
            String error = (String) request.getAttribute("errorMessage");
            if (error != null) {
        %>
            <p class="error"><%= error %></p>
        <%
            }
        %>

        <form action="logged_in" method="post">
            <input type="text" name="username" placeholder="Username">
            <input type="password" name="pass" placeholder="Password">
            <input type="submit" value="Log In">
        </form>

        <a href="register-swayam.jsp" class="signup-link">Don't have an account? Sign Up</a>
    </div>
</body>
</html>

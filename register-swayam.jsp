<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        
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
                margin-bottom: 10px;
                color: #ecf0f1;
            }

            h2 {
                font-size: 16px;
                font-weight: 400;
                margin-bottom: 30px;
                color: #bdc3c7;
            }

            form {
                width: 100%;
            }

            input[type="text"], input[type="password"], input[type="email"] {
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

            a {
                color: #ecf0f1;
                text-decoration: none;
                font-size: 14px;
                margin-top: 20px;
                display: inline-block;
            }

            a:hover {
                text-decoration: underline;
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
            <div class="headings">
                <h1>Welcome</h1>
                <h2>Create Your Account</h2>
            </div>
            <form action="register" method="post">
                <input type="text" name="username" placeholder="Enter Username" required><br>
                <input type="password" name="pass" placeholder="Enter Password" required><br>
                <input type="text" name="name" placeholder="Enter Name" required><br>
                <input type="email" name="email" placeholder="Enter Email" required><br>
                <input type="submit" value="Register">
            </form>
            <a href="login-swayam.jsp">Back to Log In</a>
        </div>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                display: flex;
                justify-content: center; /* Center the flex container horizontally */
                align-items: center; /* Center the flex container vertically */
                height: 100vh; /* Ensure that the content fills the screen */
                margin: 0;
            }
            
            .container {
                display: flex;
                align-items: center; /* Align items (headings and form) vertically */
                gap: 50px; /* Add space between the headings and the form */
            }

            .headings {
                text-align: right; /* Align text to the right for headings */
            }

            h1, h2 {
                margin: 0; /* Remove default margin for h1 and h2 */
                color: #333;
            }

            form {
                background-color: #fff;
                padding: 20px; /* Space between form content and its borders */
                border-radius: 10px; /* Rounding the edges */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 280px;
                text-align: center; /* Center the text inside the form */
            }

            input[type="text"], input[type="password"], input[type="email"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }

            input[type="submit"] {
                width: calc(100% - 20px);
                padding: 10px;
                background-color: #007BFF;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            a {
                color: black;
                text-decoration: none;
                margin-top: 15px;
                display: inline-block;
            }

            a:hover {
                text-decoration: underline;
            }
        </style>
            
    </head>
    <body>
    <center>
         
        
        <div class="container">
            <div class="headings">
                <h1>WELCOME USER</h1><br>
                <h2>Please enter your details to create account</h2>
            </div>
            <form action="register" method="post"> 
            Enter username: <input type="text" name="username"><br><br>
            Enter password: <input type="password" name="pass"><br><br>
            Enter name: <input type="text" name="name"><br><br>
            Enter email: <input type="email" name="email"><br><br>
                                     
            <input type="submit" value="Register">
            <center><a href="login-swayam.jsp"> <u>Back to Log In.</u> </a></center>

        </form 
            
        </div>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

            input[type="text"], input[type="password"] {
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
        <div class="container">
            <div class="headings">
                <h1>WELCOME BACK</h1><br>
                <h2>Please enter your details to log in</h2>
                
                <%
                    String error = (String)request.getAttribute("errorMessage");
                    if (error != null){
                %>
                <p style="color:red;"><%= error %></p> 
        
                <%
                    }
                %>
        
            </div>
            <form action="logged_in" method="post"> 
                Username: <input type="text" name="username"><br><br> 
                Password: <input type="password" name="pass"><br><br> 
                <input type="submit" value="Log In"><br><br>  
                <center>Don't have an account yet? <a href="register-swayam.jsp"> <u>Sign Up</u> </a></center>
            </form>
        </div>
    </body>
</html>

<%-- 
    Document   : books
    Created on : 6 Sept 2024, 12:54:30 pm
    Author     : anama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Books</title>
        
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                display: flex;
                flex-direction: column;
                justify-content: center; /* Center the flex container horizontally */
                align-items: center; /* Center the flex container vertically */
                height: 100vh; /* Ensure that the content fills the screen */
                margin: 0;
            }
            
            form{
                text-align: center;
            }
            
            select, input[type="text"] {
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
                margin-right: 10px;
            }

            input[type="submit"] {
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
            
            h1 {
                margin: 0; /* Remove default margin for h1 and h2 */
                color: #333;
            }
            
            
        </style>
    </head>
    <body>
        <h1> Search for books on database</h1>
        <h3> Select the search criteria from dropdown </h3>
        <form action="display_books" method="post">
            
            <select name="choose">
                <option value="name"> By Name</option>
                <option value="ISBN"> By ISBN</option>
                <option value="author"> By Author</option>
            </select>
            
            <input type ="text" name="search"><br><br>
            <center><input type="submit" value="search"></center>
        </form>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Books</title>
        
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
                max-width: 450px;
                width: 100%;
                text-align: center;
            }

            h1 {
                font-size: 36px;
                margin-bottom: 15px;
                color: #ecf0f1;
            }

            h3 {
                font-size: 18px;
                margin-bottom: 30px;
                color: #bdc3c7;
            }

            form {
                width: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            select, input[type="text"] {
                width: 100%;
                padding: 12px;
                margin: 10px 0;
                border: 2px solid #bdc3c7;
                border-radius: 6px;
                background-color: #ecf0f1;
                color: #2c3e50;
                font-size: 16px;
                text-align: center;
            }

            select:focus, input[type="text"]:focus {
                background-color: #ffffff;
                outline: none;
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
            <h1>Find Your Book</h1>
            <h3>Choose a search option below</h3>
            <form action="display_books" method="post">
                <select name="choose">
                    <option value="name">By Name</option>
                    <option value="ISBN">By ISBN</option>
                    <option value="author">By Author</option>
                </select>
                
                <input type="text" name="search" placeholder="Enter search term...">
                <input type="submit" value="Search">
            </form>
        </div>
    </body>
</html>

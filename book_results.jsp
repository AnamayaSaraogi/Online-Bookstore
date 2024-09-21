<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.assignment3.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Book Search Results</title>
    
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
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.4);
            width: 90%;
            max-width: 900px;
            text-align: center;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #ecf0f1;
        }

        h3 {
            font-size: 18px;
            margin-bottom: 30px;
            color: #bdc3c7;
        }

        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
            background-color: #34495e;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.4);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #bdc3c7;
            font-size: 16px;
            color: #ecf0f1;
        }

        th {
            background-color: #e74c3c;
            color: white;
            font-size: 18px;
            text-transform: uppercase;
        }

        td {
            background-color: #2c3e50;
        }

        tr:hover {
            background-color: #2c3e50;
        }

        input[type="checkbox"] {
            transform: scale(1.5);
        }

        input[type="number"] {
            padding: 10px;
            border: 2px solid #bdc3c7;
            border-radius: 6px;
            width: 80px;
            text-align: center;
            background-color: #ecf0f1;
            color: #2c3e50;
        }

        button {
            padding: 12px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        button:hover {
            background-color: #c0392b;
        }

        p {
            font-size: 18px;
            color: #ecf0f1;
        }

        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }

            th, td {
                padding: 10px;
            }

            button {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <%
            String message = (String) request.getAttribute("message");
            List<Book> books = (List<Book>) request.getAttribute("books");

            if (message != null) {
                out.println("<p>" + message + "</p>");
            } else if (books != null && !books.isEmpty()) {
        %>
        <form action="addToCart" method="post">
        <table>
            <tr>
                <th>Add to Cart</th>
                <th>Book Name</th>
                <th>ISBN</th>
                <th>Author</th>
                <th>Price (INR)</th>
                <th>Quantity</th>
            </tr>

            <%
                for (int i = 0; i < books.size(); i++) {
                    Book book = books.get(i);
            %>
            <tr>
                <td>
                    <input type="checkbox" name="selectedBooks" value="<%= book.getISBN() %>">
                </td>
                <td><%= book.getBookName() %></td>
                <td><%= book.getISBN() %></td>
                <td><%= book.getAuthorName() %></td>
                <td><%= book.getPrice() %></td>
                <td>
                    <input type="number" name="qty<%= i %>" value="1" min="1">
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <div style="text-align: center; margin-top: 20px;">
            <button type="submit">Add To Cart</button>
        </div>
        </form>

        <%
            } else {
                out.println("<p>No results found.</p>");
            }
        %>
    </div>

</body>
</html>

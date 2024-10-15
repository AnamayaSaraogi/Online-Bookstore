<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.assignment3.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Book Search Results</title>
    
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
            
        table{
                width: 90%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: #fff;
            }
            
        th, td{
                padding: 12px;
                text-align: center;
            }
         
        button {
                padding: 10px;
                background-color: #747576;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }
    </style>    
</head>
<body>

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
                <td class="checkbox">
                        <input type="checkbox" name="selectedBooks" value="<%= book.getISBN() %>">
                </td>
                <td><%= book.getBookName() %></td>
                <td><%= book.getISBN() %></td>
                <td><%= book.getAuthorName() %></td>
                <td><%= book.getPrice() %></td>
                <td>
                        <input type="number" name="qty<%= i %>" class="textbox" value="1" min="1">
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

</body>
</html>

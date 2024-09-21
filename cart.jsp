<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cart</title>
    
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #74ebd5, #acb6e5);
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center; /* Center the flex container vertically */
        align-items: center; /* Center the flex container horizontally */
        margin: 0;
    }
    
    h2 {
        margin: 0;
        color: #333;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: rgba(255, 255, 255, 0.9);
        box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2);
        border-radius: 15px;
    }
    
    th, td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: #ff6b6b;
        color: white;
    }
    
    button {
        padding: 15px;
        background-color: #ff6b6b;
        color: white;
        border: none;
        border-radius: 25px;
        cursor: pointer;
        font-size: 18px;
        margin: 10px;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #ff4757;
    }

    .button-container {
        display: flex;
        justify-content: space-between;
        width: 80%;
        margin-top: 20px;
    }
</style>

</head>
<body>

    <h2>Your Cart</h2>

    <table border="1">
        <tr>
            <th>Book Name</th>
            <th>ISBN</th>
            <th>Price (in INR)</th>
            <th>Quantity</th>
        </tr>

        <%
            // Get cookies
            Cookie[] cookies = request.getCookies();
            List<String> isbns = new ArrayList<>();
            List<String> quantities = new ArrayList<>();

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().startsWith("book")) {
                        isbns.add(cookie.getValue());
                    } else if (cookie.getName().startsWith("quantity")) {
                        quantities.add(cookie.getValue());
                    }
                }
            }

            // Database connection
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java", "root", "");

                for (int i = 0; i < isbns.size(); i++) {
                    String sql = "SELECT book_name, price, ISBN FROM Books WHERE ISBN = ?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, isbns.get(i));
                    rs = ps.executeQuery();

                    if (rs.next()) {
        %>
                        <tr>
                            <td><%= rs.getString("book_name") %></td>
                            <td><%= rs.getString("ISBN") %></td>
                            <td><%= rs.getDouble("price") %></td>
                            <td><%= quantities.get(i) %></td>
                        </tr>
        <%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            }
        %>
    </table>
    
    <div class="button-container">
        <!-- Button to go back to previous page -->
        <button onclick="window.location.href='books.jsp';">Go Back</button>
        
        <!-- Button to proceed to billing page -->
        <button onclick="window.location.href='billing.jsp';">Proceed to Billing</button>
    </div>
</body>
</html>

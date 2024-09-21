<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Billing Page</title>
    
    <style>
    body {
        font-family: 'Poppins', sans-serif; /* Match the font-family used in the cart page */
        background: linear-gradient(135deg, #74ebd5, #acb6e5); /* Match the gradient background */
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin: 0;
        color: #333; /* Match the text color used in the cart page */
    }
    
    h2 {
        color: #333; /* Match heading color */
        margin-bottom: 20px;
        font-size: 32px; /* Match the font size used in the cart page */
        text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.5); /* Match text shadow effect */
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: rgba(255, 255, 255, 0.9); /* Match the table background color */
        box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2); /* Match the box shadow */
        border-radius: 15px;
    }

    th, td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: #ff6b6b; /* Match the header color from the cart page */
        color: white;
        font-size: 18px;
        text-transform: uppercase;
    }
    
    td {
        background-color: rgba(255, 255, 255, 0.9); /* Match the table cell background color */
    }
    
    tr:hover {
        background-color: #ffd1c1; /* Match the hover effect from the cart page */
    }

    .total-row, .tax-row, .grand-total-row {
        font-weight: bold;
        color: #ff6b6b; /* Match color for totals and tax rows */
    }

    button {
        padding: 15px;
        background-color: #ff6b6b; /* Match button color from the cart page */
        color: white; /* Match button text color */
        border: none;
        border-radius: 25px;
        cursor: pointer;
        font-size: 18px;
        margin-top: 20px;
        transition: background-color 0.3s ease;
        width: 200px; /* Adjust width to be consistent */
    }

    button:hover {
        background-color: #ff4757; /* Match button hover effect */
    }
</style>

</head>
<body>

    <h2>Billing Summary</h2>

    <table>
        <tr>
            <th>Book Name</th>
            <th>ISBN</th>
            <th>Price (in INR)</th>
            <th>Quantity</th>
            <th>Total (in INR)</th>
        </tr>

        <%
            double totalAmount = 0.0;
            double taxRate = 0.12; // 12% tax rate
            double taxAmount = 0.0;
            double grandTotal = 0.0;

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
                        String bookName = rs.getString("book_name");
                        String isbn = rs.getString("ISBN");
                        double price = rs.getDouble("price");
                        int quantity = Integer.parseInt(quantities.get(i));
                        double total = price * quantity;

                        totalAmount += total;

        %>
                        <tr>
                            <td><%= bookName %></td>
                            <td><%= isbn %></td>
                            <td><%= String.format("%.2f", price) %></td>
                            <td><%= quantity %></td>
                            <td><%= String.format("%.2f", total) %></td>
                        </tr>
        <%
                    }
                }

                // Calculate tax and grand total
                taxAmount = totalAmount * taxRate;
                grandTotal = totalAmount + taxAmount;

        %>
            <tr class="total-row">
                <td colspan="4">Total</td>
                <td><%= String.format("%.2f", totalAmount) %></td>
            </tr>
            <tr class="tax-row">
                <td colspan="4">GST (12%)</td>
                <td><%= String.format("%.2f", taxAmount) %></td>
            </tr>
            <tr class="grand-total-row">
                <td colspan="4">Order Total</td>
                <td><%= String.format("%.2f", grandTotal) %></td>
            </tr>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            }
        %>
    </table>

    <button onclick="window.location.href='complete.jsp';">Buy</button>

</body>
</html>

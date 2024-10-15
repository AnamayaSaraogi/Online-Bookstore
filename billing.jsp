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
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        
        .total-row, .tax-row, .grand-total-row {
            font-weight: bold;
        }

        button {
            padding: 10px;
            background-color: #747576;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }

        button:hover {
            background-color: #5c5d5e;
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

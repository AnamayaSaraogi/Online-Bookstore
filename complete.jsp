<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order Complete</title>
    <style>
    body {
        font-family: 'Poppins', sans-serif; /* Match the font-family used in the cart and billing pages */
        background: linear-gradient(135deg, #74ebd5, #acb6e5); /* Match the gradient background */
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        color: #333; /* Match the text color used in the other pages */
    }

    .container {
        text-align: center;
        background-color: rgba(255, 255, 255, 0.9); /* Match the background color with transparency */
        padding: 40px;
        border-radius: 15px; /* Match the border-radius */
        box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2); /* Match the box-shadow */
        width: 80%;
        max-width: 600px;
    }

    h1 {
        color: #333; /* Match the heading color used in other pages */
        font-size: 32px; /* Match the font size used in other pages */
        margin-bottom: 20px;
        text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.5); /* Match the text-shadow effect */
    }

    p {
        font-size: 18px;
        color: #333; /* Match the text color */
        margin-bottom: 30px;
    }

    button {
        padding: 15px;
        background-color: #ff6b6b; /* Match the button background color from the other pages */
        color: white; /* Match the button text color */
        border: none;
        border-radius: 25px;
        cursor: pointer;
        font-size: 18px;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #ff4757; /* Match the button hover effect */
    }
</style>

</head>
<body>
    <div class="container">
        <h1>Order Complete!</h1>
        <p>Thank you for your purchase.</p>
        <a href="index.jsp"><button>Go to Home</button></a>
    </div>
</body>
</html>

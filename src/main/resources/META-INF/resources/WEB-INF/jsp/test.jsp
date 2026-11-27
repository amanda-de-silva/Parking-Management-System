<!DOCTYPE html>
<html>
<head>
    <title>JSP Test Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
            background-color: #f5f5f5;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎉 JSP is Working!</h1>
        <p><strong>Current Time:</strong> <%= new java.util.Date() %></p>
        <p><strong>Server Info:</strong> <%= application.getServerInfo() %></p>

        <h3>Navigation Links:</h3>
        <ul>
            <li><a href="/debug">Debug Controller</a></li>
            <li><a href="/login">Login Page</a></li>
            <li><a href="/register">Register Page</a></li>
        </ul>

        <h3>Test Information:</h3>
        <p>If you can see this page, JSP is configured correctly!</p>
    </div>
</body>
</html>
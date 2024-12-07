<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Annapurna Seva - Donor Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Light background color */
            color: #333;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .navbar {
            background-color: #00FFFF; /* Aqua color */
            padding: 15px;
            text-align: center;
            width: 100%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: fixed; /* Make navbar fixed at top */
            top: 0;
            left: 0;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            transition: color 0.3s;
        }

        .navbar a:hover {
            color: #007C7C; /* Darker shade on hover */
        }

        h2 {
            text-align: center;
            margin-top: 80px; /* Space for fixed navbar */
            color: #2E8B57; /* Attractive color for the title */
        }

        form {
            max-width: 400px; /* Decreased form width */
            margin: auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 10px 0 5px;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #00FFFF; /* Aqua color */
            border: none;
            padding: 10px 20px;
            font-size: 1.2em;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
            width: 100%; /* Full width */
        }

        input[type="submit"]:hover {
            background-color: #007C7C; /* Darker shade on hover */
        }

        .message {
            text-align: center;
            color: red;
            margin-top: 20px;
        }

        .info {
            margin: 20px 0;
            text-align: center;
            font-size: 1.1em;
            color: #555; /* Darker text for better contrast */
        }

        .info a {
            color: #2E8B57; /* Link color */
            text-decoration: none;
        }

        .info a:hover {
            text-decoration: underline; /* Underline on hover */
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="/">Home</a>
        <a href="donor-register">Donor Registration</a>
    </div>
    <h2>Donor Login</h2>
    <form action="loginDonor" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="Login">
    </form>

    <div class="info">
        <p>New to Annapurna Seva? <a href="donor-register">Create an account</a> and join us in reducing food waste!</p>
        <p><a href="forgot-password">Forgot your password?</a></p>
    </div>

    <p class="message"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
</body>
</html>

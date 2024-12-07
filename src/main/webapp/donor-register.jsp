<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Annapurna Seva - Donor Registration</title>
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

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        /* Style for radio buttons to be in line */
        .gender-group {
            margin-bottom: 15px; /* Space below gender selection */
        }

        .gender-group label {
            display: inline-block;
            margin-right: 15px; /* Space between radio buttons */
            font-weight: normal; /* Regular weight for gender labels */
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
    </style>
</head>
<body>
    <div class="navbar">
        <a href="/">Home</a>
        <a href="donor-login">Donor Login</a>
    </div>
    <h2>Donor Registration</h2>
    <form action="registerDonor" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label>Gender:</label>
        <div class="gender-group">
            <label>
                <input type="radio" id="male" name="gender" value="Male" required> Male
            </label>
            <label>
                <input type="radio" id="female" name="gender" value="Female" required> Female
            </label>
            <label>
                <input type="radio" id="other" name="gender" value="Other" required> Other
            </label>
        </div>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" 
               title="Password must be at least 8 characters long and include at least one letter and one number." required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>

        <label for="contactNo">Contact No:</label>
        <input type="text" id="contactNo" name="contactNo" 
               pattern="^(86|96|76)[0-9]{8}$" 
               title="Must start with 86, 96, or 76 and followed by 8 digits" 
               placeholder="XXXXXXXXXX" 
               required>

        <input type="submit" value="Register">
    </form>
    <p class="message"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
</body>
</html>

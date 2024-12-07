<%@page import="com.klef.jfsd.fws.model.Donor"%>
<%
    Donor donor = (Donor) session.getAttribute("donor");
    if (donor == null) {
        response.sendRedirect("donor-login?message=Session expired. Please log in again.");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donor Profile</title>
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

        .profile-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            max-width: 500px;
            margin: 20px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            width: 100%;
        }

        .profile-info label {
            font-weight: bold;
        }

        .profile-info p {
            margin: 0;
            padding: 5px 0;
        }

        h3 {
            text-align: center;
            margin-top: 30px;
            color: #2E8B57;
        }

        form {
            width: 100%; /* Full width for form */
            background: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top: 10px;
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
        <a href="donor-donations">View Donations</a>
        <a href="donor-logout">Logout</a>
    </div>

    <h2>Donor Profile</h2>
    
    <div class="profile-container">
        <div class="profile-header">
            <h3>Profile Details</h3>
        </div>
        <div class="profile-info">
            <div>
                <label>Name:</label>
                <p><%= donor.getName() %></p>
            </div>
            <div>
                <label>Email:</label>
                <p><%= donor.getEmail() %></p>
            </div>
            <div>
                <label>Address:</label>
                <p><%= donor.getAddress() %></p>
            </div>
            <div>
                <label>Contact No:</label>
                <p><%= donor.getContactNo() %></p>
            </div>
        </div>
    </div>

    <h3>Update Profile</h3>
    <form action="updateDonorProfile" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= donor.getName() %>" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= donor.getEmail() %>" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%= donor.getAddress() %>" required>

        <label for="contactNo">Contact No:</label>
        <input type="text" id="contactNo" name="contactNo" value="<%= donor.getContactNo() %>" required>

        <input type="submit" value="Update Profile">
    </form>
    <p class="message"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
</body>
</html>

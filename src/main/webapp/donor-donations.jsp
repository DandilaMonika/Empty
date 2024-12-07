<%@page import="java.util.List"%>
<%@page import="com.klef.jfsd.fws.model.FoodDonation"%>
<%@page import="com.klef.jfsd.fws.model.Donor"%>
<%
    Donor donor = (Donor) session.getAttribute("donor");
    if (donor == null) {
        response.sendRedirect("donor-login?message=Session expired. Please log in again.");
        return;
    }
    List<FoodDonation> donations = null;
    Object donationsObj = request.getAttribute("donations");
    if (donationsObj instanceof List<?>) {
        donations = (List<FoodDonation>) donationsObj;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Donations</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Light background color */
            color: #333;
            margin: 0;
            padding: 20px;
        }

        .navbar {
            background-color: #00FFFF; /* Aqua color */
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
            margin-top: 40px; /* Increased top margin for heading */
            margin-bottom: 20px; /* Margin below the heading */
            color: #2E8B57; /* Attractive color for the title */
        }

        .donation-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin: 20px;
        }

        .donation-card {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 15px;
            transition: transform 0.2s;
        }

        .donation-card:hover {
            transform: translateY(-5px);
        }

        .donation-card h3 {
            color: #2E8B57;
            margin: 0 0 10px;
        }

        .donation-details {
            margin-bottom: 10px;
        }

        .donation-status {
            font-weight: bold;
            color: green; /* Adjust this based on the status */
        }

        .no-donations {
            text-align: center;
            color: #ff4500; /* Red color for no donations */
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="/">Home</a>
        <a href="donor-profile">Profile</a>
        <a href="donor-logout">Logout</a>
    </div>

    <h2>Your Donations</h2>

    <div class="donation-container">
        <%
        if (donations != null && !donations.isEmpty()) {
            for (FoodDonation donation : donations) {
        %>
                <div class="donation-card">
                    <h3>Food Type: <%= donation.getFoodType() %></h3>
                    <div class="donation-details">
                        <p>Quantity: <%= donation.getQuantity() %> kg</p>
                        <p class="donation-status">Status: <%= donation.getStatus() %></p>
                        <p>Expiry Date: <%= donation.getExpiryDate() %></p>
                    </div>
                </div>
        <%
            }
        } else {
        %>
            <div class="no-donations">
                <h3>No donations made yet.</h3>
                <p>Please consider making a donation to help those in need!</p>
            </div>
        <%
        }
        %>
    </div>
</body>
</html>

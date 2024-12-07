<%@page import="com.klef.jfsd.fws.model.Donor"%>
<%
    Donor donor = (Donor) session.getAttribute("donor");
    if (donor == null) {
        response.sendRedirect("donor-login?message=Session expired. Please log in again.");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Food Donation</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        /* Additional internal styling for this page */
        form {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #00FFFF; /* Aqua color */
            color: white;
            border: none;
            padding: 12px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #007C7C; /* Darker shade on hover */
        }

        .message {
            color: green;
            text-align: center;
            font-weight: bold;
        }
    </style>
    <script>
        function validateExpiryDate() {
            const expiryDateInput = document.getElementById('expiryDate');
            const expiryDate = new Date(expiryDateInput.value);
            const today = new Date();
            today.setHours(0, 0, 0, 0); // Reset time to ensure comparison is only on date

            if (expiryDate < today) {
                alert("Expiry date cannot be in the past.");
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
    </script>
</head>
<body>
    <div class="navbar">
        <a href="/">Home</a>
        <a href="donor-profile">Profile</a>
        <a href="donor-logout">Logout</a>
    </div>
    <h2>Add Food Donation</h2>
    <form action="submitFoodDonation" method="post" onsubmit="return validateExpiryDate();">
        <label for="foodType">Food Type:</label>
        <select id="foodType" name="foodType" required>
            <option value="">Select food type</option>
            <option value="Vegetables">Vegetables</option>
            <option value="Fruits">Fruits</option>
            <option value="Grains">Grains</option>
            <option value="Canned Goods">Canned Goods</option>
            <option value="Dairy">Dairy</option>
            <option value="Meat">Meat</option>
            <option value="Prepared Meals">Prepared Meals</option>
        </select>

        <label for="quantity">Quantity (kg):</label>
        <input type="number" id="quantity" name="quantity" required min="1">

        <label for="expiryDate">Expiry Date:</label>
        <input type="date" id="expiryDate" name="expiryDate" required>

        <label for="pickupLocation">Pickup Location:</label>
        <select id="pickupLocation" name="pickupLocation" required>
            <option value="">Select pickup location</option>
            <option value="Vijayawada">Vijayawada</option>
            <option value="Hyderabad">Hyderabad</option>
            <option value="Bangalore">Bangalore</option>
            <option value="Chennai">Chennai</option>
            <option value="Mumbai">Mumbai</option>
            <option value="Delhi">Delhi</option>
            <!-- Add more cities as needed -->
        </select>

        <input type="submit" value="Donate Food">
    </form>
    <p class="message"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
</body>
</html>

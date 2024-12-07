<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Annapurna Seva - Home</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Light background color */
            color: #333;
            margin: 0;
            padding: 0;
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

        h1 {
            text-align: center;
            margin-top: 20px;
            font-size: 2.5em;
            background: linear-gradient(90deg, #FF5733, #FFC300); /* Gradient color for "Annapurna Seva" */
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin: 20px 0; /* Added margin for better spacing */
        }

        p {
            text-align: center;
            font-size: 1.2em;
            margin: 20px 0;
            color: #333; /* Standard color for paragraph */
        }

        .hero {
            background-image: url('path-to-your-image.jpg'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            height: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            text-align: center;
        }

        .hero h2 {
            font-size: 2.5em; /* Increased font size */
            margin: 0;
            color: #FFD700; /* Gold color for better visibility */
        }

        .blinking {
            font-size: 3em; /* Increase font size for emphasis */
            color: #FF4500; /* Attractive orange color */
            animation: blink-animation 1s steps(5, start) infinite; /* Blinking animation */
        }

        @keyframes blink-animation {
            to {
                visibility: hidden; /* Hide the text */
            }
        }

        .features {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            margin: 20px 0;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .feature {
            text-align: center;
            width: 30%;
        }

        .feature img {
            width: 100px;
            height: 100px;
        }

        .cta {
            text-align: center;
            margin: 40px 0;
        }

        .cta button {
            background-color: #00FFFF; /* Aqua color */
            border: none;
            padding: 15px 30px;
            font-size: 1.2em;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .cta button:hover {
            background-color: #007C7C; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="donor-register">Donor Registration</a>
        <a href="donor-login">Donor Login</a>
    </div>

    <div class="hero">
        <div>
            <h1 class="blinking">Welcome to Annapurna Seva</h1> <!-- Blinking welcome message -->
            <h2>Join Us in Reducing Food Waste!</h2> <!-- Join Us message -->
        </div>
    </div>

    <p>Your actions can make a difference in reducing food waste and improving food security.</p>

    <div class="features">
        <div class="feature">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC7uzEBr4fVJArtndvZWghQyC5XIbkgl8EIw&s" alt="Donate Food Icon">
            <h3>Donate Food</h3>
            <p>Help those in need by donating your surplus food easily.</p>
        </div>
        <div class="feature">
            <img src="https://ars.els-cdn.com/content/image/1-s2.0-S2352550923000660-ga1.jpg" alt="Feature 2 Icon">
            <h3>Track Impact</h3>
            <p>See how your donations are making a difference in the community.</p>
        </div>
        <div class="feature">
            <img src="https://green.org/wp-content/uploads/2024/01/Food-Waste-ReductionS.jpg" alt="Feature 3 Icon">
            <h3>Reduce Waste</h3>
            <p>Join our efforts to minimize food waste and its impact on the environment.</p>
        </div>
    </div>

    <div class="cta">
        <h2>Ready to make a difference?</h2>
        <button onclick="window.location.href='donor-register'">Get Started</button>
    </div>
</body>
</html>

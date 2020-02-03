<html>
<head>

    <title>Welcome to Hotel Reservation</title>

    <link rel="stylesheet" type="text/css" href="default.css">

    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 200px;
            background-color: #f1f1f1;
            border: 1px solid #555;
        }

        li a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
        }

        li {
            text-align: center;
            border-bottom: 1px solid #555;
        }

        li:last-child {
            border-bottom: none;
        }

        /* Change the link color on hover */
        li a:hover {
            background-color: #555;
            color: white;
        }
    </style>
</head>
<body>
<center>
    <br>
    <h2>Welcome To Hotel Reservation</h2>

    <br><br>

    <ul>
        <li><a href='CRUD.jsp'>Add New Room</a></li>
        <li><a href='Booking.jsp'>Booking</a></li>
        <li><a href='SearchByAvailableForm.html'>Bookings Availability</a></li>
        <li><a href='SearchByNameForm.html'>Search By Name</a></li>
        <li><a href='SearchByPeriod.jsp'>Search By Period</a></li>
    </ul>
</center>

</body>
</html>

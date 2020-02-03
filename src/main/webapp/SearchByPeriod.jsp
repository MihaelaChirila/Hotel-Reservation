<html>
<head>
    <title>Search By Period</title>
    <link rel="stylesheet" type="text/css" href="default.css">

    <style>
        a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #000000;
        }

        /* Change the link color on hover */
        a:hover {
            background-color: #555;
            color: white;
        }
    </style>
</head>

<body>

<br>

<center>
    <br>
    <h2>Search for Bookings for a Period</h2>
    <br>

    <form action="SearchByPeriodJSP.jsp">

        <label for="checkin">From Date: (YYYY-MM-DD):</label>
        <input placeholder="From Date" type="text" name="checkin">

        <br><br>

        <label for="checkout">To Date : ( YYYY-MM-DD ):</label>
        <input placeholder="To Date" type="text" name="checkout">

        <br> <br>

        <input type="submit" value="Submit">
    </form>
    <br>
    <a style="width: 40px" href='index.jsp'>Home</a><br>
</center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registration Page</title>
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
    <h2 style="text-align-all: center">Booking</h2>
</center>

<form method="post" action="Reservation.jsp">
    <center>
        <table border="1" width="30%" cellpadding="5" bgcolor="">
            <tbody>
            <tr>
                <td>Name</td>
                <td><input type="text" name="fname" value=""/></td>
            </tr>
            <tr>
                <td>Telephone</td>
                <td><input type="text" name="tel" value=""/></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="email" value=""/></td>
            </tr>
            <tr>
                <td>CheckIn Date</td>
                <td><input type="date" name="cindate" value=""/></td>
            </tr>
            <tr>
                <td>CheckOut Date</td>
                <td><input type="date" name="coutdate" value=""/></td>
            </tr>
            <tr>
                <td>Number Of Persons</td>
                <td><input type="text" name="numpersons" value=""/></td>
            </tr>
            <tr>
                <td>Room Number</td>
                <td><input type="text" name="roomno" value=""/></td>
            </tr>
            <tr>
                <td>Total Price</td>
                <td><input type="text" name="price" value=""/></td>
            </tr>
            <tr>
                <td><input type="submit" value="Submit"/></td>
                <td><input type="reset" value="Reset"/></td>
            </tr>

            </tbody>
        </table>
        <br>

        <a style="width: 40px" href='index.jsp'>Home</a><br>
    </center>
</form>
</body>
</html>
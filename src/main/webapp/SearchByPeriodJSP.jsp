<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,com.example.util.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- html, head and starting body tag ... -->


<%
    ArrayList<Reservation> ar1 = new ArrayList<Reservation>();
    Connection con = null;
    String dbUrl = "jdbc:mysql://localhost:3306/hotel";
    PreparedStatement ps;
    String query1 = "select client_name, e_mail, tel, room_nr, nr_pax, check_in, check_out, total_price  from reservations where  check_in between ? and ?";
    String checkin = request.getParameter("checkin");
    String checkout = request.getParameter("checkout");

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(dbUrl, "root", "1234");
    ps = con.prepareStatement(query1);
    SimpleDateFormat fr = new SimpleDateFormat("yyyy-mm-dd");
    java.util.Date d = fr.parse(checkin);
    java.sql.Date newdate = new java.sql.Date(d.getTime());
    java.util.Date d1 = fr.parse(checkout);
    java.sql.Date newdate1 = new java.sql.Date(d1.getTime());
    ps.setDate(1, newdate);
    ps.setDate(2, newdate1);

    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
        Reservation b1 = new Reservation();
        b1.setName(rs.getString(1));
        b1.setEmail(rs.getString(2));
        b1.setTel(rs.getString(3));
        b1.setRoomno(rs.getInt(4));
        b1.setNumpersons(rs.getInt(5));
        b1.setCheck_in(rs.getString(6));
        b1.setCheck_out(rs.getString(7));
        b1.setPrice(rs.getInt(8));


        ar1.add(b1);

    }

    // send to JSP
    request.setAttribute("listData", ar1);

%>
<center>
	<h2>Results of Bookings for the period From <%=newdate %> To <%=newdate1 %>: </h2>

	<table border=1>

		<th>Name</th>
		<th>Email</th>
		<th>Phone</th>
		<th>Room No</th>
		<th>Persons</th>
		<th>Check In</th>
		<th>Check Out</th>
		<th>Total Price</th>

		<c:forEach var="element" items="${listData}">
			<tr>
				<td>${element.name}</td>
				<td>${element.email}</td>
				<td>${element.tel}</td>
				<td>${element.roomno}</td>
				<td>${element.numpersons}</td>
				<td>${element.check_in}</td>
				<td>${element.check_out}</td>
				<td>${element.price}</td>
			</tr>
		</c:forEach>
	</table>
	<br>

	<a style="width: 40px" href='index.jsp'>Home</a><br>
</center>
</html>
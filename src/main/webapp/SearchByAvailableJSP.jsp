<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,com.example.util.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Search Room Availability</title>
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

<center>
    <br>
    <h2>Results of available rooms</h2>
</center>

<center>
    <form>
        <%
            ArrayList<Room> ar1 = new ArrayList<Room>();
            Connection con = null;
            String dbUrl = "jdbc:mysql://localhost:3306/hotel";
            PreparedStatement ps;
            String query1 = "select id_room_number,room_type from rooms where id_room_number not in (select room_nr from reservations where check_in >= ?  or check_out <= ?)";
            String str1 = request.getParameter("checkin");
            String str2 = request.getParameter("checkout");


            try {

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(dbUrl, "root", "1234");
                ps = con.prepareStatement(query1);

                SimpleDateFormat fr = new SimpleDateFormat("yyyy-mm-dd");
                java.util.Date d = fr.parse(str1);
                java.sql.Date newdate = new java.sql.Date(d.getTime());
                java.util.Date d1 = fr.parse(str2);
                java.sql.Date newdate1 = new java.sql.Date(d1.getTime());
                ps.setDate(1, newdate);
                ps.setDate(2, newdate1);
                ResultSet rs = ps.executeQuery();


                while (rs.next()) {
                    Room b1 = new Room();
                    b1.setRoomno(rs.getInt(1));
                    b1.setRoomtype(rs.getInt(2));
                    ar1.add(b1);

                }
                // send to JSP
                request.setAttribute("listData", ar1);

            } catch (Exception ex) {
                System.out.println("Exception:" + ex.getMessage());

            }
        %>
        <table border=1>
            <th>Room No</th>
            <th>Room Type</th>

            <c:forEach var="element" items="${listData}">
            <tr>
                <td>${element.roomno}</td>
                <td>${element.roomtype}</td>

            </tr>
            </c:forEach>
    </form>
</center>
</table>

<br>

<a style="width: 40px" href='index.jsp'>Home</a><br>
</html>
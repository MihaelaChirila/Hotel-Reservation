<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="com.example.util.DBUtil" %>

<%
    if (request.getParameter("Add") != null) {
        String roomno = request.getParameter("roomno");
        String roomtype = request.getParameter("roomtype");
        Connection con = DBUtil.getMySqlConnection();
        String sql = "insert into rooms values (?,?)";
        PreparedStatement st = con.prepareStatement(sql);
        //ResultSet rs;
        st.setInt(1, Integer.parseInt(roomno));
        st.setInt(2, Integer.parseInt(roomtype));

        int i = st.executeUpdate();
        if (i > 0) {
            response.sendRedirect("CRUD.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    }
%>

<!DOCTYPE html>
<html>

<head>
    <title>Add New Room</title>
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

<center>
    <br>
    <h2>Add New Room</h2>
    <br>
	<h4 style="color: red;">*Note: Room Types: 1 = Single Room, 2= Double Room, 3 = Triple Room, 4 = Family Room</h4>
	<br>
    <form action="Add.jsp">
        <label for="roomno">Room No:   </label>
        <input placeholder="Room Number" type="text" name="roomno">

        <br><br>

        <label for="roomtype">Room Type:</label>
        <input placeholder="Room Type" type="text" name="roomtype">

        <br><br>

        <input type="submit" name="Add" value="Add">
    </form>
	<br>
	<a style="width: 40px" href='index.jsp'>Home</a><br>
</center>

</body>
</html>

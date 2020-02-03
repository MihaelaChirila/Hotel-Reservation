<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,com.example.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- html, head and starting body tag ... -->


<%
ArrayList<Reservation> ar1 = new ArrayList<Reservation>();
Connection con=null;
System.out.println("SearchbyAuthor: Before DBURL");
String dbUrl = "jdbc:mysql://localhost:3306/test";
System.out.println("SearchbyAuthor: After DBURL");
PreparedStatement ps;
String query1 = "select check_in,check_out from reservations where  client_name = ?";
String client_name = request.getParameter("name");

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(dbUrl,"root","");
	ps = con.prepareStatement(query1);
	ps.setString(1,client_name);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		
		System.out.println(rs.getString(1) + " " + rs.getString(2));
		Reservation b1 = new Reservation();
		b1.setCheck_in(rs.getString(1));
		b1.setCheck_out(rs.getString(2));
		
		ar1.add(b1);
		
	}
	
	// send to JSP
	request.setAttribute("listData", ar1);

%>
<h2>Results of Bookings by  <%=client_name %>: </h2>
<table border=1>
<th>Check In:</th>
<th>Check Out:</th>
    <c:forEach var="element" items="${listData}">
        <tr>
            <td>${element.check_in}</td> 
            <td>${element.check_out}</td> 
            
        </tr> 
    </c:forEach>
</table>
<a href='index.jsp'>Home</a><br>
</html>
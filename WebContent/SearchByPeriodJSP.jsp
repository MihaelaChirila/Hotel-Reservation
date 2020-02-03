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
String query1 = "select client_name from reservations where  check_in between ? and ?";
String checkin = request.getParameter("checkin");
String checkout = request.getParameter("checkout");

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(dbUrl,"root","");
	ps = con.prepareStatement(query1);
	SimpleDateFormat fr=new SimpleDateFormat("yyyy-mm-dd");
	java.util.Date d=fr.parse(checkin);
	java.sql.Date newdate=new java.sql.Date(d.getTime());
	java.util.Date d1=fr.parse(checkout);
	java.sql.Date newdate1=new java.sql.Date(d1.getTime());
	ps.setDate(1,newdate);
	ps.setDate(2,newdate1);
	
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		
		System.out.println(rs.getString(1) );
		Reservation b1 = new Reservation();
		b1.setName(rs.getString(1));
	
		
		ar1.add(b1);
		
	}
	
	// send to JSP
	request.setAttribute("listData", ar1);

%>
<h2>Results of Bookings for the period  <%=newdate %> and <%=newdate1 %>: </h2>
<table border=1>

<th>Name:</th>
    <c:forEach var="element" items="${listData}">
        <tr>
            <td>${element.name}</td> 
        
            
        </tr> 
    </c:forEach>
</table>
  <a href='index.jsp'>Home</a><br>
</html>
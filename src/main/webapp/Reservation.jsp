<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.example.util.DBUtil"%>

<%
	String userName = request.getParameter("fname");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String cindate = request.getParameter("cindate");
	String coutdate = request.getParameter("coutdate");
	String roomno = request.getParameter("roomno");
	String numpersons = request.getParameter("numpersons");
	String price = request.getParameter("price");
	Connection con = DBUtil.getMySqlConnection();
	int room= Integer.parseInt(roomno);
	
	int numper=Integer.parseInt(numpersons);
	int price_total=Integer.parseInt(price);
	String sql="insert into reservations(client_name, tel, E_MAIL, check_in, check_out,nr_pax,room_nr,total_price) values (?,?,?,?,?,?,?,?)";
	PreparedStatement st = con.prepareStatement(sql);
	//ResultSet rs;
	st.setString(1,userName);
	st.setString(2,tel);
	st.setString(3,email);
	st.setString(4,cindate);
	st.setString(5,coutdate);
	st.setInt(6,numper);
	st.setInt(7,room);
	st.setInt(8,price_total);
	int i = st.executeUpdate();
	if (i > 0) {
		response.sendRedirect("welcome.jsp");
	} else {
		response.sendRedirect("index.jsp");
	}
%>
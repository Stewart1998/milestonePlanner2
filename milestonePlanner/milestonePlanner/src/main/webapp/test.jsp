<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
	String url = "jdbc:mysql://mysql.stackcp.com:52430/";
	String dbName = "webplat2-39378a48";

	String userName = "webplat2-39378a48";
	String password = "GlasgowCali2019";

	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection(url + dbName, userName, password);
	
	if(!conn.isClosed()){
		out.print("FUCK");
	}
%>

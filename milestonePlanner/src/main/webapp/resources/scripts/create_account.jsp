
<%@ page import="com.groupad.jsp.database"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
//response.setContentType("application/json");

int val = 0;int val2 = 0;
String username = request.getParameter("username");
String password = request.getParameter("password");
String project_id = request.getParameter("project_id");

if(username != null){

val = database.insert("INSERT INTO users(username,password) VALUES ('"+username+"','"+password+"')");

String user_id = null;

ResultSet resultSet = null;

resultSet = database.query("SELECT * FROM users WHERE username = '" + username + "'");

while (resultSet.next()) {
	user_id = resultSet.getString("idusers");
}

val2 = database.insert("INSERT INTO user_projects(user_id,project_id) VALUES ('"+user_id+"','"+project_id+"')");
}

%>
[ {"label":"value", "value":"<% out.print(val); %>"}]

<%@ page import="com.groupad.jsp.database"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
//response.setContentType("application/json");

int val = 0;
String id = request.getParameter("id");
String project_id = null;
String name = null;
String author = null;
String due = null;

	ResultSet resultSet = null;

	resultSet = database.query("SELECT * FROM milestones WHERE milestone_id = '" + id + "'");

	while (resultSet.next()) {
		project_id = resultSet.getString("project_id");
		name = resultSet.getString("project_name");
		author = resultSet.getString("author");
		due = resultSet.getString("due");
		
		val = database.insert("INSERT INTO milestones(project_id,project_name,author,date,due,status) VALUES ('"+project_id+"','"+name+" Copy','"+author+"','2019-01-09','"+due+"','0')");
	}
%>
[ {"label":"value", "value":"<% out.print(val); %>"}]

<%@ page import="com.groupad.jsp.database"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
//response.setContentType("application/json");

int val = 0;
String name = request.getParameter("name");
String due = request.getParameter("due");

if(name != null){

String date = new java.util.Date().toLocaleString();

String sessionLogin = (String) request.getSession().getAttribute("sessionLogin");



val = database.insert("INSERT INTO milestones(project_id,project_name,author,date,due,status) VALUES ('1234','"+name+"','"+sessionLogin+"','2019-01-09','"+due+"','0')");

}

%>
[ {"label":"value", "value":"<% out.print(val); %>"}]

<%@ page import="com.groupad.jsp.database"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
//response.setContentType("application/json");

int val = 0;
String id = request.getParameter("id");


val = database.update("UPDATE milestones SET status='1' WHERE milestone_id="+id);


%>
[ {"label":"value", "value":"<% out.print(val); %>"}]
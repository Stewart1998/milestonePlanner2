
<%@ page import="com.groupad.jsp.database"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
//response.setContentType("application/json");

int val = 0;
String id = request.getParameter("id");
String text = request.getParameter("milestoneCommentText");

if(text != null){

String date = new java.util.Date().toLocaleString();

String sessionLogin = (String) request.getSession().getAttribute("sessionLogin");



val = database.insert("INSERT INTO milstoneComments(milestone_id,user,text) VALUES ('"+id+"','"+sessionLogin+"','"+text+"')");

}

%>
[ {"label":"value", "value":"<% out.print(val); %>"}]
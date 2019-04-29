<%@ page import="com.groupad.jsp.database"%>
<%@page import="java.sql.ResultSet"%>
<%
	String id = request.getParameter("id");
String project_name = null;
String due = null;

	ResultSet resultSet = null;

	resultSet = database.query("SELECT * FROM milestones WHERE milestone_id = '" + id + "'");

	while (resultSet.next()) {
		project_name = resultSet.getString("project_name");
		due = resultSet.getString("due");
	}
%>

[
   {"label":"item 1", "value":"<% out.print(id); %>", "id": 1},
   {"label":"item 2", "value":"<% out.print(project_name); %>", "id": 1},
   {"label":"item 2", "value":"<% out.print(due); %>", "id": 2}
]

<%
   // Returns all employees (active and terminated) as json.
   response.setContentType("application/json");
%>
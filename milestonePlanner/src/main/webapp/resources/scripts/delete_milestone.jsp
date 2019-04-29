
<%@ page import="com.groupad.jsp.database"%>
<%
//response.setContentType("application/json");

int val = 0;
int val2 = 0;
String id = request.getParameter("id");


val = database.delete("DELETE FROM milestones WHERE milestone_id = " + id);
val2 = database.delete("DELETE * FROM milstoneComments WHERE milestone_id = " + id);


%>
[ {"label":"value", "value":"<% out.print(val); %>"}]
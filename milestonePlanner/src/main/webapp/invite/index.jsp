<%@ page import="com.groupad.jsp.database"%>
<%@page import="java.sql.ResultSet"%>
<%
	String id = request.getParameter("id");
String email = null;
String due = null;
String project_id = null;

	ResultSet resultSet = null;

	resultSet = database.query("SELECT * FROM share WHERE share_id = '" + id + "'");

	while (resultSet.next()) {
		project_id = resultSet.getString("project_id");
		email = resultSet.getString("email");
	}
%>

<form id="create-form">
   <h2>You have been invited to participate in a milestone. Please create an account to manage this project</h2>
      <label>project_id</label>
   <input type = "text" name="project_id" value="<% out.print(project_id); %>" readonly   /> 
   <label>Email</label>
   <input type = "text" name="username" value="<% out.print(email); %>" readonly   /> 
   <label>Password</label>
   <input type = "password" name="password"   /> 
   <button>Create</button>
</form>

<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script>
$("#create-form").submit(function(e) {
			e.preventDefault()
			$.ajax({
				type : "post",
				url : "../resources/scripts/create_account.jsp",
				data : $('#create-form').serialize(),
				dataType : "json",
				success : function(data) {
					if (data[0].value == 0) {
						alert("Failed to add");
					} else {
						alert("Account Created");
					}
				},
				error : function(jqXHR, exception) {
					console.log("System Error " + jqXHR.responseText);
				}
			});
		});
		</script>
	<%@ page import="com.groupad.jsp.database"%>
<%@page import="java.sql.ResultSet"%>
<%
ResultSet resultSet4 = null;
	ResultSet resultSet3 = null;
ResultSet resultSet2 = null;
ResultSet resultSet1 = null;


        resultSet3 = database.query("SELECT * FROM milestones WHERE project_id = '1234' AND status = '0'");

		String milestone_id = null;
		String milestone_name = null;
		String milestone_author_id = null;
		String milestone_author = null;
		String milestone_due = null;
		
		while (resultSet3.next()) {

			milestone_id = resultSet3.getString("milestone_id");
			milestone_name = resultSet3.getString("project_name");
			milestone_author_id = resultSet3.getString("author");
			milestone_due = resultSet3.getString("due");

			resultSet2 = database.query("SELECT * FROM users WHERE idusers = '"+milestone_author_id+"'");
			while (resultSet2.next()) {
				milestone_author = resultSet2.getString("username");
				
			}
			


%>
                    <div class="project-container">
                        <div class="project-row project-title"><%  out.print(milestone_name); %></div>
                        <div class="project-row project-author"><%  out.print(milestone_author); %></div>
                       <div class="project-row project-due"><%  out.print(milestone_due); %>
                       <i class="fas fa-chevron-down project-footer" onCLick="showActions('<%  out.print(milestone_id); %>')" id="down<%  out.print(milestone_id); %>"></i>
                             <i class="fas fa-chevron-up project-footer2" onCLick="hideActions('<%  out.print(milestone_id); %>')" id="up<%  out.print(milestone_id); %>"></i>
                       </div>
                        <div class="project-footer-cnt" id="cnt<%  out.print(milestone_id); %>">
                            <ul>
                                <li onClick="completeMilestone('<%  out.print(milestone_id); %>')">Done</li>
                                <li onClick="changeMilestone('<%  out.print(milestone_id); %>')">Change</li>
                                <li onClick="repeatMilestone('<%  out.print(milestone_id); %>')">Repeat</li>
                                <li onClick="milestoneCommentFun('<%  out.print(milestone_id); %>')">Comment</li>
                                <li onClick="deleteMilestone('<%  out.print(milestone_id); %>')">Delete</li>
                            <ul>
                            <div class="project_comments">
                            <h2>Comments</h2>
                            <%
                            resultSet1 = database.query("SELECT * FROM milstoneComments WHERE milestone_id = '"+milestone_id+"'");

                    		String comment_author = null;
                    		String text = null;
                    		while (resultSet1.next()) {

                    			comment_author = resultSet1.getString("user");
                    			text = resultSet1.getString("text");
                    			
                    			resultSet4 = database.query("SELECT * FROM users WHERE idusers = '"+comment_author+"'");
                    			while (resultSet4.next()) {
                    				comment_author = resultSet4.getString("username");
                    				
                    			}
                    			
                    				
                    			%>
                                <div class="comment_box">
                                    <div class="comment_name"><%  out.print(comment_author); %></div>
                                    <div class="comment_body"><%  out.print(text); %></div>
                                </div>
                                <% }  %>
                                <p style="color: red;">End of thread</p>
                            </div>
                        </div>
                    </div>
                    <%
                    		
		}
		%>
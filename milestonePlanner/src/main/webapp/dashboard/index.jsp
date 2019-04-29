<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.groupad.jsp.*"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<title>Milestone Planner</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body onLoad="refreshMilestoneList()">

	<header id="header"> </header>
	<aside id="cp"></aside>
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<form class="modal-content" id="milestone-form">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h2>Add Milestone</h2>
			</div>
			<div class="modal-body">
				<div class="col">
					<label>Milestone Name</label> <input type="text"
						placeholder="Milestone Name" name="name" required />
				</div>
				<div class="col">
					<label>Milestone Due</label> <input type="date" name="due" required />
				</div>
			</div>
			<div class="modal-footer">
				<button>Create</button>
			</div>
		</form>

	</div>

	<div id="updateMilestone" class="modal">

		<!-- Modal content -->
		<form class="modal-content" id="update-form">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h2>Edit Milestone</h2>
			</div>
			<div class="modal-body">
				<div class="col">
				    <label>Milestone ID</label>
					<input type="text" placeholder="ID" name="id" id="editid" readonly />
				</div>
				<div class="col">
					<label>Milestone Name</label> <input type="text"
						placeholder="Milestone Name" id="editName" name="name" required />
				</div>
				<div class="col">
					<label>Milestone Due</label> <input type="date" name="due"
						id="editdue" required />
				</div>
			</div>
			<div class="modal-footer">
				<button>Update</button>
			</div>
		</form>

	</div>
	
	<div id="milestoneComment" class="modal">

		<!-- Modal content -->
		<form class="modal-content" id="comment-form">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h2>Edit Milestone</h2>
			</div>
			<div class="modal-body">
			<div class="col">
				    <label>Milestone ID</label>
					<input type="text" placeholder="ID" name="id" id="commentid" readonly />
				</div>
				<div class="col">
					<textarea name="milestoneCommentText" placeholder="Please wright your comment"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button>Post</button>
			</div>
		</form>

	</div>

	</div>
	<main>
	<section class="first">
		<div class="section-body center">
			<%
				String sessionLogin = (String) request.getSession().getAttribute("sessionLogin");

				if (null != session.getAttribute("sessionLogin")) {

					ResultSet resultSet = null;

					resultSet = database.query("SELECT * FROM users WHERE idusers = '" + sessionLogin + "'");

					String username = null;
					while (resultSet.next()) {

						username = resultSet.getString("username");

					}

					out.print("Welcome " + username);

				} else {
					String redirectURL = "http://localhost:8080/milestonePlanner/";
					response.sendRedirect(redirectURL);
				}
			%>
		</div>
	</section>
	<section>
		<div class="section-header">Actions Due</div>
		<div class="section-body">
			<div class="grid">
				<%
					ResultSet resultSet2 = null;

					resultSet2 = database.query("SELECT * FROM actions WHERE project_id = '1234' AND status = '0'");

					String action_name = null;
					String action_author = null;
					String action_due = null;

					while (resultSet2.next()) {

						action_name = resultSet2.getString("action_name");
						action_author = resultSet2.getString("author");
						action_due = resultSet2.getString("due");
				%>
				<div class="project-container">
					<div class="project-row project-title">
						<%
							out.print(action_name);
						%>
					</div>
					<div class="project-row project-author">
						<%
							out.print(action_author);
						%>
					</div>
					<div class="project-row project-due">
						<%
							out.print(action_due);
						%>
						<i class="fas fa-chevron-down project-footer"
							onCLick="showActions('2')" id="down2"></i> <i
							class="fas fa-chevron-up project-footer2"
							onCLick="hideActions('2')" id="up2"></i>
					</div>
					<div class="project-footer-cnt" id="cnt2">
						<ul>
							<li>Done</li>
							<li>Change</li>
							<li>Repeat</li>
							<li>Comment</li>
							<li>Delete</li>
							<ul>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<button onClick="addAction()" class="full">Create Action</button>
		</div>
	</section>
	<section>
		<div class="section-header">Milestones Due</div>
		<div class="section-body">
			<div class="grid" id="upcommingMilestonelist"></div>
			<button onClick="addMilestone()" class="full">Create
				Milestone</button>
		</div>
	</section>
	</main>
	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
	<script src="../js/main.js"></script>
	<script src="../js/milestone.js"></script>
</body>
<html>
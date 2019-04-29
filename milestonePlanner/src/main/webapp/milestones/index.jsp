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
<body onLoad="refreshMilestoneList(); refreshCompletedMilestoneList();">

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
						<button onClick="addMilestone()" class="full">Create
		</div>
	</section>
	<section>
		<div class="section-header">Upcomming Milestones</div>
		<div class="section-body">
			<div class="grid" id="upcommingMilestonelist"></div>
		</div>
	</section>
	<section>
		<div class="section-header">Milestones Due</div>
		<div class="section-body">
			<div class="grid" id="milestonelist"></div>
		</div>
	</section>
	<section>
		<div class="section-header">Completed Milestones</div>
		<div class="section-body">
			<div class="grid" id="completedMilestonelist"></div>
		</div>
	</section>
	</main>
	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
	<script src="../js/main.js"></script>
	<script src="../js/milestone.js"></script>
</body>
<html>
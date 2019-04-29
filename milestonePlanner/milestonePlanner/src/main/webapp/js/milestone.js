//Get the modal
		var modal = document.getElementById('myModal');
		var updateMilestone = document.getElementById('updateMilestone');
		var milestoneComment = document.getElementById('milestoneComment');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on the button, open the modal 
		function addMilestone() {
			modal.style.display = "block";
		}
		
		function milestoneCommentFun(id) {
			$("#commentid").val(id)
			milestoneComment.style.display = "block";
		}

		function addAction() {
			modal2.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
			updateMilestone.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
				updateMilestone.style.display = "none";
			}
		}
		$("#milestone-form").submit(function(e) {
			e.preventDefault()
			$.ajax({
				type : "post",
				url : "../resources/scripts/create_milestone.jsp",
				data : $('#milestone-form').serialize(),
				dataType : "json",
				success : function(data) {
					if (data.value == 0) {
						alert("Failed to add");
					} else {
						refreshMilestoneList()
						alert("Milestone Added");
						modal.style.display = "none";
					}
				},
				error : function(jqXHR, exception) {
					console.log("System Error " + jqXHR.responseText);
				}
			});
		});

		$("#update-form").submit(function(e) {
			e.preventDefault()
			$.ajax({
				type : "post",
				url : "../resources/scripts/update_milestone.jsp",
				data : $('#update-form').serialize(),
				dataType : "json",
				success : function(data) {
					if (data.value == 0) {
						alert("Failed to add");
					} else {
						refreshMilestoneList()
						alert("Milestone Updated");
						updateMilestone.style.display = "none";
					}
				},
				error : function(jqXHR, exception) {
					console.log("System Error " + jqXHR.responseText);
				}
			});
		});
		
		$("#comment-form").submit(function(e) {
			e.preventDefault()
			$.ajax({
				type : "post",
				url : "../resources/scripts/comment_milestone.jsp",
				data : $('#comment-form').serialize(),
				dataType : "json",
				success : function(data) {
					if (data.value == 0) {
						alert("Failed to add");
					} else {
						refreshMilestoneList()
						alert("Comment Added");
						milestoneComment.style.display = "none";
					}
				},
				error : function(jqXHR, exception) {
					console.log("System Error " + jqXHR.responseText);
				}
			});
		});

		function refreshMilestoneList() {
			$.ajax({
				type : "post",
				url : "../resources/scripts/refresh_milestones.jsp",
				data : $('#milestone-form').serialize(),
				dataType : "html",
				success : function(data) {
					$("#upcommingMilestonelist").html(data);
				},
				error : function(jqXHR, exception) {
					console.log("System Error " + jqXHR.responseText);
				}
			});
		}
		
		function refreshCompletedMilestoneList() {
			$.ajax({
				type : "post",
				url : "../resources/scripts/refresh_completed_milestones.jsp",
				data : $('#milestone-form').serialize(),
				dataType : "html",
				success : function(data) {
					$("#completedMilestonelist").html(data);
				},
				error : function(jqXHR, exception) {
					console.log("System Error " + jqXHR.responseText);
				}
			});
		}

		function changeMilestone(id) {
			$.ajax({
				type : "GET",
				url : "../resources/scripts/get_milestone.jsp",
				data : {
					'id' : id
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					$("#editid").val(data[0].value);
					$("#editName").val(data[1].value);
					$("#editDue").val(data[2].value);
					updateMilestone.style.display = "block";

				},
				error : function(jqXHR, exception) {
					console.log("System Error " + jqXHR.responseText);
				}
			});
		}

		function deleteMilestone(id) {
			if (confirm('Are you sure you wish to delete this milestone?')) {
			$.ajax({
				type : "post",
				url : "../resources/scripts/delete_milestone.jsp",
				data : {
					'id' : id
				},
				dataType : "json",
				success : function(data) {
					if (data[0].value == 0) {
						alert("Failed to delete");
					} else {
						refreshMilestoneList()
						alert("Milestone Deleted");
						modal.style.display = "none";
					}
				},
				error : function(jqXHR, exception) {
					console.log("System Error " + jqXHR.responseText);
				}
			});
			}else{
				//NULL
			}
		}

		function completeMilestone(id) {
			if (confirm('Are you sure you wish to mark this milestone as complete?')) {
			$.ajax({
				type : "post",
				url : "../resources/scripts/complete_milestone.jsp",
				data : {
					'id' : id
				},
				dataType : "json",
				success : function(data) {
					if (data[0].value == 0) {
						alert("Failed to update");
					} else {
						refreshMilestoneList()
						alert("Milestone Completed!");
					}
				},
				error : function(jqXHR, exception) {
					console.log("System Error " + jqXHR.responseText);
				}
			});
			}else{
				//NULL
			}
		}
		
		function repeatMilestone(id) {
			if (confirm('Are you sure you wish to copy this milestone?')) {
			$.ajax({
				type : "post",
				url : "../resources/scripts/repeat_milestone.jsp",
				data : {
					'id' : id
				},
				dataType : "json",
				success : function(data) {
					if (data[0].value == 0) {
						alert("Failed to update");
					} else {
						refreshMilestoneList()
						alert("Milestone Copied!");
					}
				},
				error : function(jqXHR, exception) {
					console.log("System Error " + jqXHR.responseText);
				}
			});
			}else{
				//NULL
			}
		}
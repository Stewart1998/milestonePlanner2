	function showActions(id) {
			$("#cnt" + id).show();
			$("#down" + id).hide();
			$("#up" + id).show();
		}
		function hideActions(id) {
			$("#cnt" + id).hide();
			$("#down" + id).show();
			$("#up" + id).hide();
		}
		function toggleCP() {
			var cp = document.getElementById("cp");
			cp.style.height = window.innerHeight - 60 + "px";
			if (cp.style.left == "0px") {
				cp.style.left = "-260px";
			} else {
				cp.style.left = "0px";
			}
		}
		$(document).ready(function() {

			$('#header').load("../templates/header.html");
			$('#cp').load("../templates/cp.html");

		});

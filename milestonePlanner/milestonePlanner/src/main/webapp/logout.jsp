<%

session.invalidate(); 

out.print("Logging Out...");

String redirectURL = "http://localhost:8080/milestonePlanner/";
response.sendRedirect(redirectURL);

%>

<% 
	String username = request.getParameter("username");
%>

<link rel="stylesheet" type="text/css" href="./resources/css/Header.css"/>
<link rel="stylesheet" type="text/css" href="./resources/css/PharmaTheme.css"/>

<div class="header">
	<div class="links">
		<a class="header-link" href="Home.jsp?username=<%=username%>">My Prescriptions</a>
		<a class="header-link" href="PatientProfile.jsp?username=<%=username%>">My Profile</a>
		<a class="header-link" href="Browse.jsp?username=<%=username%>">Browse Medicine</a>
	</div>
	<input type="button" value="Logout" style="align-self: flex-end" onclick="window.location='Login.jsp'" >
</div>

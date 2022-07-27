
<% 
	String pharmacy_id = request.getParameter("pharmacy_id");
%>

<link rel="stylesheet" type="text/css" href="./resources/css/Header.css"/>
<link rel="stylesheet" type="text/css" href="./resources/css/PharmaTheme.css"/>

<div class="header">
	<div class="links">
		<a class="header-link" href="Inventory.jsp?pharmacy_id=<%=pharmacy_id%>">Inventory</a>
		<a class="header-link" href="PatientsOverview.jsp?pharmacy_id=<%=pharmacy_id%>">Patients Overview</a>
	</div>
	<input type="button" value="Logout" style="align-self: flex-end" onclick="window.location='Login.jsp'" >
</div>

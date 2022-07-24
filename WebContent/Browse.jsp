<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Browse</title>

<link rel="stylesheet" type="text/css" href="./resources/css/Browse.css"/>

<script>
	// toggle a checkbox state
	function check(checkboxId) {
		const checkbox = document.getElementById(checkboxId);
		if (checkbox) {
			const checkedState = checkbox.checked;
			checkbox.checked = !checkedState;			
		}
	}
</script>

</head>

<body>
	<div class="category-list-container">
		<div class="checkbox-container">
			<input type="checkbox" class="tag-checkbox" name="Fever" id="checkbox-Fever"/>
			<p onclick="check('checkbox-Fever')">Fever</p>
		</div>
		<div class="checkbox-container">
			<input type="checkbox" class="tag-checkbox" name="Allergies" id="checkbox-Allergies"/>
			<p onclick="check('checkbox-Allergies')">Allergies</p>
		</div>
	</div>
</body>

</html>
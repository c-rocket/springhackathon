<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>aOne</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.1/css/material.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.1/css/ripples.css" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/style/main.css'/>">

</head>
<body ng-app="aOne">
	<input type="hidden" value="<c:url value='/'/>" id="baseUrl" />
	<div ng-include="'<c:url value='/resources/views/nav.jsp'/>'"></div>

	<div class="jumbotron">
		<div ng-view=""></div>
	</div>

	<script src="https://code.jquery.com/jquery-2.1.3.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular-route.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular-resource.js"></script>

	<!-- Added for material design navbar and other stuff
 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.1/js/material.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.1/js/ripples.js"></script>
	<script src="<c:url value='/resources//lib/moment.min.js'/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-moment/0.9.0/angular-moment.js"></script>


	<script>
		$(document).ready(function() {
			$.material.init();
		});
	</script>

	<script type="text/javascript" src="<c:url value='/resources/app.js'/>"></script>
	<script src="<c:url value='/resources/controllers/browse.js'/>"></script>
	<script src="<c:url value='/resources/services/item.js'/>"></script>


</body>
</html>
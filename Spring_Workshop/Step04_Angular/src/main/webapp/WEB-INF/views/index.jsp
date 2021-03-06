<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html ng-app="aOne">
<head>
<title>aOne</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/style/main.css'/>">

</head>
<body ng-controller="browseController">

	<div class="container">

		<h1>aOne Marketplace</h1>

		<ul class="list-group">

			<li ng-repeat="item in items" class="list-group-item">
				<div>
					<span class="item-title">{{item.ITEM_TITLE}} </span>
					<span class="item-price pull-right">$ {{item.ITEM_PRICE}}</span>
				</div>
				<span>{{item.ITEM_DESC}}</span>
			</li>

		</ul>

	</div>

	<script src="https://code.jquery.com/jquery-2.1.3.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.js"></script>
	<script type="text/javascript" src="<c:url value='/resources/app.js'/>"></script>
	<input type="hidden" value="<c:url value='/'/>" id="baseUrl" />
</body>
</html>
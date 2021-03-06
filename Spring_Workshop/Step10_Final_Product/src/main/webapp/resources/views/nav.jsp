<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-info" ng-controller="NavController">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<div>
				<a href="#/" class="logo">
					<img src="<c:url value='/resources/images/logo2.png'/>">
				</a>
			</div>
			<!--  <a class="navbar-brand" href="#/">an Online marketplace</a> -->
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav navbar-right">
				<li ng-show="signedIn">
					<a href="" data-toggle="modal" data-target="#posModal">List stuff for sale</a>
				</li>
				<li>
					<a href="#/browse">Browse Stuff</a>
				</li>
				<!--       </ul>
      <ul class="nav navbar-nav navbar-right">
 -->
				<li ng-hide="signedIn">
					<a href="#/login">Login</a>
				</li>
				<li ng-hide="signedIn">
					<a href="#/register">Register</a>
				</li>

				<li ng-show="signedIn" class="dropdown">
					<a href="" class="dropdown-toggle" data-toggle="dropdown">
						<img ng-src="{{gravatar}}" class="img-circle gravatar">
						&nbsp; {{name}}
						<span class="mdi-navigation-expand-more"></span>
					</a>
					</a>
					<ul class="dropdown-menu">

						<li>
							<a href="" data-toggle="modal" data-target="#pasModal">
								<i class="mdi-action-lock"></i>
								Change Password
							</a>
						</li>
						<li>
							<a href="" ng-click="logout()">
								<i class="mdi-action-exit-to-app"></i>
								Logout
							</a>
						</li>
					</ul>
				</li>
			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->

	<div ng-show="signedIn" ng-include="'<c:url value='/resources/views/partials/changepass.jsp'/>'"></div>
	<div ng-show="signedIn" ng-include="'<c:url value='/resources/views/partials/post.jsp'/>'"></div>

</nav>


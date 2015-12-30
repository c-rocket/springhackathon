var baseUrl;
var app = angular.module('aOne', [ 'ngRoute', 'angularMoment', 'ngResource' ])

app.config(function($routeProvider) {
	baseUrl = angular.element($('#baseUrl')).val();
	$routeProvider.when('/', {
		templateUrl : baseUrl + 'resources/views/browse.jsp',
		controller : 'browseController'
	}).when('/browse/:itemId', {
		templateUrl : baseUrl + 'resources/views/browse.jsp',
		controller : 'browseController'
	})
})

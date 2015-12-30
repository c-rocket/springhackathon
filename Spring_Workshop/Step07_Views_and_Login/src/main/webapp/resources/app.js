'use strict';
var baseUrl;
var app = angular.module('aOne', [ 'ngAnimate', 'ngResource', 'ngRoute', 'angularMoment', 'toaster' ])

.config(function($routeProvider) {
	baseUrl = angular.element($('#baseUrl')).val();
	$routeProvider.when('/', {
		templateUrl : baseUrl + 'resources/views/browse.jsp',
		controller : 'browseController'
	}).when('/browse/:itemId', {
		templateUrl : baseUrl + 'resources/views/browse.jsp',
		controller : 'browseController'
	}).when('/register', {
		templateUrl : baseUrl + 'resources/views/register.jsp',
		controller : 'AuthController'
	}).when('/login', {
		templateUrl : baseUrl + 'resources/views/login.jsp',
		controller : 'AuthController'
	})
	.otherwise({
		redirectTo : '/'
	});
});

'use strict'
var baseUrl;
var app = angular.module('aOne', [ 'ngRoute' ])

app.controller('browseController', function($http, $scope) {
	baseUrl = angular.element($('#baseUrl')).val();

	var itemStatus = $http.get(baseUrl + '/items').then(function(response, err) {

		if (err) {
			console.log('error is', err)
		}
		console.log('data returned', response)
		$scope.items = response.data
	})

	console.log('returned', itemStatus)

});

app.config(function($routeProvider) {
	$routeProvider.when('/', {
		templateUrl : angular.element($('#baseUrl')).val() + 'resources/views/browse.jsp',
		controller : 'browseController'
	})

})

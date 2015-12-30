var baseUrl;
var app = angular.module('aOne', [])

.controller('browseController', function($http, $scope) {
	baseUrl = angular.element($('#baseUrl')).val();
	$http.get(baseUrl + '/items').success(function(response, err) {

		console.log('response looks like-', response)
		$scope.items = response
	})
});

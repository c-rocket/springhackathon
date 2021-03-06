'use strict'

app.controller('AuthController', function($q, $scope, $rootScope, $location, toaster, User, Auth) {

	$scope.login = function(user) {

		Auth.login.get({
			email : user.email,
			pw : user.password
		}, function(resp) {
			console.log('Auth service returned:', resp)

			if (resp.USER_ID != null) {
				user.uid = resp.USER_ID
				user.name = resp.USER_NAME
				user.gravatar = resp.USER_GRAVATAR
				user.email = resp.USER_EMAIL
				user.signedIn = true
				User.setCurrentUser(user)
				if (User.isSignedIn) {
					console.log('Signed in!')
				}
				var currentuser = User.getCurrentUser()
				console.log('getCurrentUser returned: ', currentuser)
				$rootScope.$broadcast('userEvent', user)
				toaster.pop('success', "Logged in!")
				$location.path(baseUrl + '/browse')
			} else {

				toaster.pop('error', "Login failed!")
				$scope.user = ''
			}
		});

	}; // ----end $scope.login
	$scope.register = function(user) {

		var newUser = {
			username : user.name,
			email : user.email,
			pw : user.password
		}
		User.registerUser(newUser).then(function(user) {
			console.log('controller recd---', user.data)

			if (user.data) {
				console.log('login module fired')
				user.uid = user.data.USER_ID
				user.name = user.data.USER_NAME
				user.gravatar = user.data.USER_GRAVATAR
				user.email = user.data.USER_EMAIL
				user.signedIn = true
				User.setCurrentUser(user)
				if (User.isSignedIn) {
					console.log('Signed in!')
				}
				;
				var currentuser = User.getCurrentUser()
				console.log('getCurrentUser returned: ', currentuser)
				$rootScope.$broadcast('userEvent', user)
				toaster.pop('success', "Registered!")
				$location.path(baseUrl + '/browse')
			} else {
				toaster.pop('error', "Signup failed!")
				$scope.user = ''
			}
		});

	} // ------end $scope.register

	$scope.changePassword = function(user) {
		var payload = {
			oldpw : user.oldPass,
			newpw : user.newPass,
			email : user.email
		}
		User.changePassword(payload).success(function(status) {
			console.log('pass change status -', status)
			if (status == 'OK') {
				toaster.pop('success', 'Password changed!')
				$scope.user = ''
			} else if (status == 401) {
				toaster.pop('failed', 'Password change failed! Retry')
			}
		})

	}

});

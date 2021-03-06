<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal fade" id="posModal" ng-controller="itemController">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="panel panel-warning title">

				<div class="panel-heading title">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="panel-title">Post an Item</h3>
				</div>

				<div class="panel-body">
					<form ng-submit="createItem(newitem)">
						<input type="text" ng-model="newitem.title" class="form-control" placeholder="Post title" autofocus required>
						<br>
						<textarea ng-model="newitem.desc" class="form-control" placeholder="Describe item for sale" required></textarea>
						<br>
						<input type="number" min="1" step="1" ng-model="newitem.price" class="form-control" placeholder="Item price"
							required>
						<br>
						<input type="submit" value="Post" class="btn btn-default">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</form>
				</div>

			</div>

		</div>
	</div>
</div>

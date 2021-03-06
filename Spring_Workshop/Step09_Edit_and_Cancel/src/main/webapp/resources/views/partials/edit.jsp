<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal fade" id="ediModal" ng-controller="itemController">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="panel panel-info title">

				<div class="panel-heading title">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="panel-title">Edit Post</h3>
				</div>

				<div class="panel-body">
					<form ng-submit="editItem(selectedItem)">
						<input ng-init="$element.focus()" type="text" ng-model="selectedItem.ITEM_TITLE" class="form-control"
							placeholder="Post title" required>
						<br>
						<textarea ng-model="selectedItem.ITEM_DESC" row="3" class="form-control" placeholder="Describe the item for sale"
							required></textarea>
						<br>
						<input type="number" min="1" step="1" ng-model="selectedItem.ITEM_PRICE" class="form-control"
							placeholder="Sale price" required>
						<br>
						<input type="submit" value="Update" class="btn btn-default">
						<!--             <input type="submit" value="Update" class="btn btn-info">
 -->
						<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>

					</form>
				</div>

			</div>



		</div>
	</div>
</div>
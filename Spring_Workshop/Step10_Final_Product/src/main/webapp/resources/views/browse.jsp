<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">

	<!-- LEFT PANEL -->
	<div class="col-md-offset-1 col-md-4">

		<div class="list-group">
			<!-- SEARCH TOOL -->
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</div>
					<input type="text" ng-model="searchItem" class="form-control" placeholder="Search">
				</div>
			</div>

			<!-- ITEM LIST -->

			<!-- <a ng-repeat="item in items | filter: {ITEM_TITLE: searchItem } | orderBy:  -->
			<a ng-repeat="item in items | filter:searchItem  | orderBy:'ITEM_POST_DATE':true" ng-href="#/browse/{{item.ITEM_ID}}">
				<div class="list-group-item">
					<div class="row-picture">
						<img class="circle" ng-src="{{item.USER_GRAVATAR}}">
					</div>
					<div class="row-content">
						<h4 class="list-group-item-heading">{{item.ITEM_TITLE | limitTo:25}}{{ item.ITEM_TITLE.length > 25? "..." :
							""}}</h4>
						<span class="list-group-item-text">
							<span am-time-ago="item.ITEM_POST_DATE"></span>
						</span>
					</div>
					<div class="payment">
						<div>&nbsp;{{item.ITEM_PRICE}}</div>
						<span class="label status {{item.ITEM_STATUS}}">{{item.ITEM_STATUS}}</span>
					</div>
				</div>
				<div class="list-group-separator"></div>
			</a>
		</div>

	</div>

	<!-- RIGHT PANEL -->
	<div class="col-md-6">
		<div ng-show="listMode">
			<img src="<c:url value='/resources/images/forsale.jpg'/>" class="img-responsive img-browse">
		</div>

		<div ng-show="!listMode">

			<!-- HEADER -->
			<div class="row">

				<div class="col-md-8">
					<h3>{{selectedItem.ITEM_TITLE}}</h3>
					<span>
						<img ng-src="{{ selectedItem.USER_GRAVATAR }}" class="img-circle gravatar">
						Posted by {{selectedItem.USER_NAME}} -
						<span am-time-ago="selectedItem.ITEM_POST_DATE"></span>
						&nbsp;
						<span class="label status {{selectedItem.ITEM_STATUS}}">{{ selectedItem.ITEM_STATUS }}</span>
					</span>
				</div>
				<div class="col-md-4 title">
					<div class="price-tag">
						&nbsp;{{ selectedItem.ITEM_PRICE }}


						<div ng-show="signedIn &&  isItemPoster  &&  isAvailable">
							<div class="btn-group">
								<a href="" class="btn btn-warning">Admin</a>
								<a href="" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a href="" data-toggle="modal" data-target="#ediModal">EDIT POST</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="" ng-click="cancelItem(selectedItem)">CANCEL POST</a>
									</li>
								</ul>
							</div>
						</div>

						<div ng-show="signedIn && isAvailable && !isItemPoster &&!alreadyOffered">
							<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#offModal">Make an Offer</button>
						</div>

					</div>
				</div>
			</div>

			<br>

			<!-- DESCRIPTION -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Description</h3>
						</div>

						<div class="panel-body">{{selectedItem.ITEM_DESC}}</div>
					</div>
				</div>
			</div>

			<!-- OFFERS -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">

						<div class="panel-heading">
							<h3 class="panel-title">Offers</h3>
						</div>

						<div class="panel-body">

							<div class="title" ng-hide="offers && offers.length > 0">
								<span>NO OFFER FOR THIS ITEM YET</span>
							</div>

							<div class="row" ng-repeat="offer in offers">
								<div class="col-md-10">
									<button ng-if="offer.OFFER_STATUS=='accepted'" class="btn btn-success btn-xs disabled">Sold</button>

									<button ng-show="isItemPoster && isAvailable" class="btn btn-info btn-xs" ng-click="acceptOffer(offer)">Accept
										- &nbsp;{{offer.OFFER_AMOUNT}}</button>
									<button ng-show="isOfferMaker(offer) && isAvailable(selectedItem)" class="btn btn-danger btn-xs"
										ng-click="cancelOffer(offer)">Cancel My Offer - &nbsp;{{offer.OFFER_AMOUNT}}</button>

									<img ng-src="{{offer.USER_GRAVATAR}}" class="img-circle offer gravatar">
									<span>{{offer.USER_NAME}}</span>
								</div>
							</div>
							<br>

						</div>
					</div>
				</div>
			</div>

			<!-- COMMENTS -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">

						<div class="panel-heading">
							<h3 class="panel-title">Comments</h3>
						</div>

						<div class="panel-body">

							<div class="title" ng-hide="comments && comments.length > 0">
								<span>NO COMMENT ABOUT THIS ITEM</span>
							</div>
							<br>

							<div class="row" ng-repeat="com in comments">
								<div class="col-md-1">
									<img ng-src="{{com.USER_GRAVATAR}}" class="img-circle comment gravatar">
								</div>
								<div class="col-md-11">
									<div class="well well-sm cmt">
										<span class="cmt-title">{{com.USER_NAME}}:</span>
										<span class="cmt-time pull-right">
											<span am-time-ago="com.COMMENT_CREATE_DATE"></span>
										</span>
										<br>

										<span>{{com.COMMENT_TEXT}}</span>
									</div>
								</div>
							</div>
							<br>

							<div class="row" ng-show="isAvailable">
								<div class="col-md-12">
									<form ng-submit="addComment(commentText)">

										<div class="input-group">
											<div class="input-group-addon">
												<img ng-src="{{gravatar}}" class="img-circle comment gravatar">
											</div>
											<input ng-show="signedIn" type="text" ng-model="commentText" cols="10" rows="3" class="form-control"
												placeholder="Comment here..." required>
											<br>
										</div>

										<span class="pull-right">
											<input ng-show="signedIn" type="submit" class="btn btn-info" value="Comment">
										</span>
									</form>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>

		</div>

	</div>

	<div ng-include="'<c:url value='/resources/views/partials/edit.jsp'/>'"></div>
	<div ng-include="'<c:url value='/resources/views/partials/offer.jsp'/>'"></div>
<div class=" col-sm-12 search_box">
<input type="text" ng-model="searchText" placeholder="Search Products"/>
<div class="clearfix"></div>
</div>

<div class="col-sm-3 col-xs-6" ng-repeat="detail in details | filter:filters | filter:searchText:strict">
	<div class="product-image-wrapper">
		<div class="single-products">
			<div class="productinfo text-center">
				<div class="image-outer">
					<a href="#/product-details"><img src="https://pos.simplypos.in/assets/uploads/thumbs/{{detail.image}}" alt="" /></a>
				</div>
				<h2>{{detail.price}}</h2>
				<p>{{detail.name}}</p>
				<a data-target="#" ng-click='addCart(detail)' class="hvr-pop btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
			</div>

		</div>
	</div>
</div>
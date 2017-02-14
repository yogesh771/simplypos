<div class="home-section">
	<div class="category-toggle"><span class="catToggle" style="font-size:30px;cursor:pointer" onclick="openNav()"><i class="fa fa-tags" aria-hidden="true"></i>
	<span class="menu-text">Category</span></span></div>

	<div class="col-sm-3 sidenav" id="mySidenav">
		<a href="javascript:void(0)" class="closebtn" id="closeB" onclick="closeNav()">&times;</a>
		<div class=""  style="">
			<div class="left-sidebar" id="accordion">
				<h2>Category</h2>
					<a ng-click="resetFilter()" type="button" class="category-link clear-all">All categories</a>
				<div class="panel panel-default" ng-repeat="category in categories">
					<a type="button" class="category-link collapsed" data-parent="#accordion" ng-click="subCat(categories,category.id); filters.category_id = category.id" data-toggle="collapse" data-target="#pId_{{category.id}}">{{category.name}}</a>
					<div id="pId_{{category.id}}" class="collapse sub-menu">


					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="col-sm-9 padding-right">
		<div class="category-tab"><!--category-tab-->
			<div class="tab-content">
				<div class=" col-sm-12 search_box">
					<input type="text" ng-model="searchText" placeholder="Search Products"/>
					<div class="clearfix"></div>
				</div>
				<div class="tab-pane fade active in" id="products" >
						<div class="col-sm-3 col-xs-6" ng-repeat="detail in details | filter:searchText | filter:filters">
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
				</div>
			</div>
		</div><!--/category-tab-->
	</div>
</div>
<div class="col-sm-3" ng-show="categorySidebar">
	<div class="left-sidebar" ng-controller="categoryController">
		<h2>Category</h2>
		<div class="panel-group category-products" id="accordian"><!--category-productsr-->
			<div class="panel panel-default" ng-repeat="category in categories">
				<div class="panel-heading">
					<h4 class="panel-title"><a href="#">{{category.name}}</a></h4>
				</div>
			</div>
		</div><!--/category-products-->
	</div>
</div>	
<div class="col-sm-12">
	<div class="breadcrumbs">
		<ol class="breadcrumb">
		  <li><a href="#/">Home</a></li>
		  <li class="active">Shopping Cart</li>
		</ol>
	</div>
	<div class="table-responsive cart_info desktop-view">
		<table class="table table-condensed">
			<thead>
				<tr class="cart_menu">
					<td class="image">Item</td>
					<td class="description"></td>
					<td class="price">Price</td>
					<td class="quantity">Quantity</td>
					<td class="total">Total</td>
					<td class="cart_delete"></td>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="product in cart" ng-init="setTotals(item)">
					<td class="cart_product">
						<img src="https://pos.simplypos.in/assets/uploads/thumbs/{{product.image}}" alt="" />
					</td>
					<td class="cart_description">
						<h4><a href="">{{product.name}}</a></h4>
					</td>
					<td class="cart_price">
						<p >{{product.price}}</p>
					</td>
					<td class="cart_quantity">
						<div class="cart_quantity_button">
							<input id="inc" class="cart_quantity_input" ng-model="qty" ng-init="qty ='1'" type="text" name="quantity" pattern="\d+" size="2" >
						</div>
					</td>
					<td class="cart_total">
						<p class="cart_total_price" >{{(qty)*product.price}}</p>
					</td>
					<td class="cart_delete">
						<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
					</td>
				</tr>
				<tr class="total-tr">
				<td></td>
				<td></td>
				<td></td>
					<td class="total-text">Total:</td>
					<td class="cart_total"><i class="fa fa-inr" aria-hidden="true"></i> 610</td>
					<td class="cart_delete"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="mobile-view" ng-repeat="product in cart">
		<div class="cart-left">	
			<div class="Product-name"><h4><a href="">{{product.name}}</a></h4></div>
			<div class="prodict-qty">QTY: <input id="inc" class="cart_quantity_input" ng-model="qty" ng-init="qty ='1'" type="text" name="quantity" pattern="\d+" size="2" ></div>
			<div class="product-price"><p>Price: {{(qty)*product.price}}</p></div>
		</div>
		<div class="cart-right">
			<div class="product-image"><img src="https://pos.simplypos.in/assets/uploads/thumbs/{{product.image}}" alt="{{product.image}}" /></div>
		</div>
		
	</div>
	<div class="clearfix"></div>
	<div class="total-mobile">
		<div class="tot-text">Total:</div>
		<div class="tot-price"><i class="fa fa-inr" aria-hidden="true"></i> 65</div>
		<div class="clearfix"></div>
	</div>
	<div class="row">
		<div class="col-sm-6">
		</div>
		<div class="col-sm-6">
			<div class="total_area checkout-btn">
					<a class="btn btn-default update" href="">Update</a>
					<a class="btn btn-default check_out" href="#/checkout">Checkout</a>
			</div>
		</div>
	</div>
</div>


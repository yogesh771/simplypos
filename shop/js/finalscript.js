var app = angular.module("myApp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl : "templates/home.php",
        controller : "shopController"
    })
    .when("/cart", {
        templateUrl : "templates/cart.php",
		controller: "cartController"
    })
    .when("/product-details", {
        templateUrl : "templates/product-details.php",
    })
    .when("/my_account", {
        templateUrl : "templates/my-account.php",
    })
    .when("/checkout", {
        templateUrl : "templates/checkout.php",
    })
    .when("/order", {
        templateUrl : "templates/order.php",
    })
    .when("/login", {
        templateUrl : "templates/login.php",
    })
    .when("/contact", {
        templateUrl : "templates/contact.php",
    })
});

app.controller("shopController",function($rootScope, $scope, $location, $http){
    loc = $location.absUrl().split('/shop/');
    $rootScope.loc = loc['0'];
    getInfo();
    function getInfo(){
        $http.get(loc['0']+'/api-ecommarce.php?action=allProducts').success(function(data){
			angular.forEach(data, function(value, key) {
					value.price = Math.round(value.price);				
			});
            $scope.details = data;
        });
        $http.get(loc['0']+'/api-ecommarce.php?action=allCategories').success(function(data){
			$scope.categories = data;
			$scope.parentCategories = [];
            angular.forEach(data, function(value, key) {
				if(value.parent_id == 0 || value.parent_id == null){
					$scope.parentCategories.push(value);
				}
			});
        });
    }
	
	$scope.subCat = function(categories, pId){
		str = '';
		angular.forEach(categories, function(value, key) {
			if(value.parent_id == pId){
				str += '<a type="button" class="category-link" ng-click="filterBySubCat(\''+value.id+'\');" data-toggle="collapse" data-target="#pId_'+value.id+'">'+value.name+'</a><div id="pId_'+value.id+'" class="collapse sub-menu"></div>';
			}
		});
		jQuery('#pId_'+pId).html(str);
	}
	$scope.addCart = function(detail){
		if(!$rootScope.cart){
			$rootScope.cart = [];
			
		}
		$rootScope.cart.push(detail);
		$scope.removeItem = function (x) {
        $scope.products.splice(x, 1);
    }
	}
	
	$scope.filterBySubCat = function(pId){
		alert(pId);/*
		arr = [];
		angular.forEach(products, function(value, key) {
			if(value.category_id == pId){
				arr.parentCategories.push(value);
			}
		});
		$scope.details = arr;*/
	}
		
    $scope.filters = { };
    $scope.resetFilter = function() {
        // set filter object back to blank
        $scope.filters = {}; 
    }
    
});

app.controller('cartController',function($rootScope,$scope,$http){
	//$rootScope.cart.forEach(function(val,key){
		//alert(val.price);
	//});
	//alert(JSON.stringify($rootScope.cart));
   $scope.qty  = "1";
   
    
   
});





app.controller("generalController", function($rootScope, $scope, $location, $http){
    loc = $location.absUrl().split('/shop/');
    $rootScope.loc = loc['0'];
    // To get employee details
    getInfo();
    function getInfo(){
        // Sending request to cusDetails.php files 
        $http.get(loc['0']+'/api-ecommarce.php?action=generalDetails').success(function(data){
            // Stored the returned data into scope 
            $scope.general = data;
        });
    }
    
});

var productNameList = function(productNames, key) {
  element.all(by.repeater(key + ' in details').column(key + '.name')).then(function(arr) {
    arr.forEach(function(wd, i) {
      expect(wd.getText()).toMatch(productNames[i]);
    });
  });
};

app.controller('NavigationController', function ($scope) {
    // Must use a wrapper object, otherwise "activeItem" won't work
    $scope.states = {};
    $scope.states.activeItem = 'item1';
    $scope.items = [{
        id: 'item1',
        title: 'Home',
        url: '#/'
    }, {
        id: 'item2',
        title: 'My Account',
        url: '#/my_account'
    }, {
        id: 'item3',
        title: 'Contact',
        url: '#/contact'
    }];
    $scope.items2 = [{
        id: 'item4',
        title: 'Checkout',
        url: '#/checkout',
        title2:'fa-crosshairs',
        title3:'fa'
    }, {
        id: 'cart',
        title: 'Cart',
        url: '#/cart',
        title2:'fa-shopping-cart',
        title3:'fa'
    }, {
        id: 'item6',
        title: 'Login',
        url: '#/login',
        title2:'fa-lock',
        title3:'fa'
    }];
    $scope.items3 = [{
        id: 'item1',
        title: 'Home'
    }];
});


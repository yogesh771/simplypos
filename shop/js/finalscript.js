var app = angular.module("myApp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl : "templates/login.php",
    })
    .when("/cart", {
        templateUrl : "templates/cart.php",
		controller:"buttonController"
    })
	.when("/home2", {
        templateUrl : "templates/home2.php",
		controller : "shopController2"
    })
    .when("/product-details", {
        templateUrl : "templates/product-details.php",
		controller:"buttonController"
    })
    .when("/my_account", {
        templateUrl : "templates/my-account.php",
		controller:"buttonController"
    })
    .when("/checkout", {
        templateUrl : "templates/checkout.php",
		controller:"buttonController"
    })
    .when("/order", {
        templateUrl : "templates/order.php",
		controller:"buttonController"
    })
    .when("/home", {
        templateUrl : "templates/home.php",
		controller : "shopController"
    })
    .when("/contact", {
        templateUrl : "templates/contact.php",
		controller:"buttonController"
    })
	.when("/logout", {
        templateUrl : "templates/logout.php",
		controller: 'logoutController'
    })
});
app.controller("shopController",function($rootScope, $scope, $location, $http){
	$rootScope.header = true;
    loc = $location.absUrl().split('/shop_v1/');
	//loc = [];
	//loc['0'] = 'http://pos.simplypos.in';
    $rootScope.loc = loc['0'];
    getInfo();
    function getInfo(){
        $http.get(loc['0']+'/api/catlog?action=allProducts').success(function(data){
var arr = [];
			angular.forEach(data, function(value, key) {
					value.price = Math.round(value.price);	
arr.push(value);			
			});

            $scope.details = arr;
        });
        $http.get(loc['0']+'/api/catlog?action=allCategories').success(function(data){
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
		
    //$scope.filters = { };
    $scope.resetFilter = function() {
        // set filter object back to blank
        $scope.filters = {}; 
    }
    getAuth($rootScope.user);
	$rootScope.header = true;
});
app.controller("shopController2",function($rootScope, $scope, $http){
	//$rootScope.header = true;
    //loc = $location.absUrl().split('/shop_v1/');
	//loc = [];
	//loc['0'] = 'http://pos.simplypos.in';
    //$rootScope.loc = loc['0'];
    getInfo();
    function getInfo(){
        $http.get('http://pos.simplypos.in/api/catlog?action=allProducts').success(function(data){
			//angular.forEach(data, function(value, key) {
					//value.price = Math.round(value.price);				
			//});
			$scope.details = data;
        });
    }
	
	
	
	
});

app.controller('cartController',function($rootScope,$scope,$http){
	//$rootScope.cart.forEach(function(val,key){
		//alert(val.price);
	//});
	//alert(JSON.stringify($rootScope.cart));
   $scope.qty  = "1";
   
    
   
});
app.controller('buttonController', function($rootScope){
	$rootScope.header = true;
})




app.controller("generalController", function($rootScope, $scope, $location, $http){
    loc = $location.absUrl().split('/shop_v1/');
	//loc = [];
	//loc['0'] = 'http://pos.simplypos.in';
    $rootScope.loc = loc['0'];
    // To get employee details
    getInfo();
    function getInfo(){
        // Sending request to cusDetails.php files 
        $http.get(loc['0']+'/api/store?action=generalDetails').success(function(data){
			console.log(data);
            // Stored the returned data into scope 
            $scope.general = data;
        }).error(function(error){
			console.log(data);
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
        url: '#/home'
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
    }];
    $scope.items3 = [{
        id: 'item1',
        title: 'Home'
    }];
});



function getAuth(user){
	if(!user){
		location = '#/home';
	}
}

app.controller('logoutController',function($rootScope,$scope,$http){
	$rootScope.header = false;
	delete $rootScope.user;
	
	location = '#/home';
})

app.controller("loginController",function($rootScope,$location,$scope,$http){
	if($rootScope.user){
		location = '#/home';
	}
	loc = $location.absUrl().split('/shop_v1/');
	//loc = [];
	//loc['0'] = 'http://pos.simplypos.in/api/user?action=auth';
    $rootScope.loc = loc['0'];
	$rootScope.header = false;
	$scope.error = '';
	$scope.login  = function(info){
		$scope.error = '';
		console.log(info);
		if(angular.isUndefined(info))
		{
			$scope.error = 'Username and Password fields are blank.';
			return;
		}
		if(angular.isUndefined(info.username) || info.username == '')
		{
			$scope.error = 'Username field is blank.';
			return;
		}
		if(angular.isUndefined(info.password) || info.password == '')
		{
			$scope.error = 'Password field is blank.';
			return;			
		}
		
		$http.get(loc['0']+'&login_id='+info.username+'&pass_key='+info.password)
        .success(function (response) {
			if(response.id){
				$scope.success = 'You are successfully login.';
				$scope.error = '';
				location = '#/home';
				$rootScope.user = JSON.stringify(response);
				$scope.success = '';
				$scope.error = '';
			}
			else{
				$scope.error = 'Please check password.';
				$scope.success = '';
				$scope.info.username = '';
				$scope.info.password = '';
			}
        });
		delete info;
	}
});
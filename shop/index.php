<!DOCTYPE html>
<html ng-app="myApp" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">	
	<link href="css/hover.css" rel="stylesheet" media="all">

    <script src="js/angular.min.js"></script>
    <script src="js/angular-route.min.js"></script>
    <script src="js/finalscript.js"></script>
    <script src="js/angular-script.js"></script>


<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "240px";
    document.getElementById("mySidenav").style.position = "fixed";
    document.getElementById("mySidenav").style.top = "0px";
    document.getElementById("mySidenav").style.left = "0px";
    document.getElementById("closeB").style.position = "fixed";
    document.getElementById("closeB").style.top = "14px";
    document.getElementById("closeB").style.left = "237px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("mySidenav").style.position = "fixed";
    document.getElementById("mySidenav").style.top = "0";
    document.getElementById("mySidenav").style.left = "-240px";
    document.getElementById("closeB").style.position = "fixed";
    document.getElementById("closeB").style.top = "14px";
    document.getElementById("closeB").style.left = "-240px";
}
</script>
</head><!--/head-->

<body>
    <header id="header" ng:controller="NavigationController"><!--header-->
        <div class="header_top"><!--header_top-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="contactinfo" ng-controller="generalController">
                            <ul class="nav nav-pills">
                                <li><a href=mailto://{{mail.smtp_user}}"><i class="fa fa-envelope"></i> {{general[0].smtp_user}}</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">
                    </div>
                </div>
            </div>
        </div><!--/header_top-->

        <div class="header-middle"><!--header-middle-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 logo-div" ng-controller="generalController">
                        <div class="logo pull-left">
                            <!--a  href="#/"><img src="http://pos.simplypos.in/assets/uploads/logos/{{detail.logo}}" alt="" /></a-->
                            <span class="logo1" ng-class="{'active': item.id == states.activeItem}" ng-click="states.activeItem=item.id" ><a href="#/"><img src="http://pos.simplypos.in/assets/uploads/logos/{{general['0'].logo}}" alt="" /></a></span>
							<span class="logo2" ng-class="{'active': item.id == states.activeItem}" ng-click="states.activeItem=item.id" ><a href="#/hom"><img src="images/loco-small.png" alt="" /></a></span>
                        </div>
                    </div>
                    <div class="col-sm-8 account-menu">
                        <div class="shop-menu pull-right">
                            <ul class="nav navbar-nav">
                                <li ng-repeat="item in items2" class="item" ng-class="{'active': item.id == states.activeItem}" ng-click="states.activeItem=item.id"><a href="{{item.url}}"><i class="{{item.title2}} {{item.title3}}"></i>{{item.title}}</a></li>
								<li>
									<a href="#/logout" ng-show="header" ng-click="onBackKeyDown()" class="btn btn-link btn-md"><i class="fa-lock fa"></i>Logout</a>
								</li>
								<li>
									<a href="#/home2" ng-show="header" ng-click="onBackKeyDown()" class="btn btn-link btn-md"><i class="fa-lock fa"></i>home2</a>
								</li>
                            </ul>
							
                        </div>
						<div controller="loginController">
						{{phone}}
						</div>
                    </div>
                </div>
            </div>
        </div><!--/header-middle-->

        <div class="header-bottom"><!--header-bottom-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="dropdown">
                            <button id="dropdownMenuButton" class="btn btn-secondary dropdown-toggle menu-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span> </button>
                            <div class="dropdown-menu mainmenu pull-left" aria-labelledby="dropdownMenuButton">
                                <ul class="nav navbar-nav navbar-collapse">
                                    <li ng-repeat="item in items" class="item" ng-class="{'active': item.id == states.activeItem}" ng-click="states.activeItem=item.id"><a href="{{item.url}}">{{item.title}}</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header-bottom-->
    </header><!--/header-->

    <section class="middle_section">
        <div class="container">
            <div class="row">
                <div ng-view>

                </div>
            </div>
        </div>
    </section>

    <footer id="footer"><!--Footer-->
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <!--p class="pull-left">Copyright © 2017  Inc. All rights reserved.</p-->
                    <p class="pull-right">Designed by <span><a target="_blank" href="#">Great Web Soft</a></span></p>
                </div>
            </div>
        </div>
    </footer><!--/Footer-->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script>
        $(window).scroll(function() {
            var scroll = $(window).scrollTop();
            if(scroll >= 190) {
                $(".catToggle").addClass("change");
            } else {
                $(".catToggle").removeClass("change");
            }
        });
		$(window).scroll(function() {
            var scroll = $(window).scrollTop();
            if(scroll >= 190) {
                $("header").addClass("shrink-header");
            } else {
                $("header").removeClass("shrink-header");
            }
        });
		
		$(window).scroll(function() {
            var scroll = $(window).scrollTop();
            if(scroll >= 190) {
                $(".search_box").addClass("fixed-search");
            } else {
                $(".search_box").removeClass("fixed-search");
            }
        });
		$(window).scroll(function() {
            var scroll = $(window).scrollTop();
            if(scroll >= 190) {
                $(".search_box").addClass("fixed-search");
            } else {
                $(".search_box").removeClass("fixed-search");
            }
        });
    </script>
	<script>


	</script>
</body>
</html>
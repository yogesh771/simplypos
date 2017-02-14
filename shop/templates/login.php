<div class="container wrapper login-page" ng-controller="reg">
	<div class="col-sm-4 col-sm-offset-1">
		<div class="login-form" ng-controller="loginController"><!--login form-->
			<h2>Login to your account</h2>
			<p class="text-success bg-success" ng-show="success">{{success}}</p>
			<p class="text-danger bg-danger" ng-show="error">{{error}}</p>
			<form action="#">
				<input type="text" id="username" placeholder="Name" ng-model="info.username" />
				<input type="password" id="password" placeholder="Email Address" ng-model="info.password" />
				<span>
					<input type="checkbox" class="checkbox"> 
					Keep me signed in
				</span>
				<button type="button" ng-click="login(info);" class="btn btn-lg">Login</button>
			</form>
		</div><!--/login form-->
	</div>
	<div class="col-sm-1">
		<h2 class="or">OR</h2>
	</div>
	<div class="col-sm-4">
		<div class="signup-form"><!--sign up form-->
			<h2>New User Signup!</h2>
			<form name="empList" id="empForm" ng-submit="insertInfo(empInfo);">
					<input type="text" name="emp_name" class="form-control" placeholder="Enter Name" ng-model="empInfo.name" value=""  required />
					<input type="tel" name="emp_phone" pattern="[789][0-9]{9}" class="form-control" placeholder="Enter Phone Number" ng-model="empInfo.phone"  required />
					<input type="password" name="emp_password" class="form-control" placeholder="Enter Password" ng-model="empInfo.password"  required />
				<div class="form-group">
					<button class="btn btn-warning" ng-disabled="empList.$invalid">Add Into Database</button>
				</div>
			</form>
		</div><!--/sign up form-->
	</div>
</div>
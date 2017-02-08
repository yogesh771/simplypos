<div class="container wrapper login-page" ng-controller="reg">
	<div class="col-sm-4 col-sm-offset-1">
		<div class="login-form"><!--login form-->
			<h2>Login to your account</h2>
			<form action="#">
				<input type="text" placeholder="Name" />
				<input type="email" placeholder="Email Address" />
				<span>
					<input type="checkbox" class="checkbox"> 
					Keep me signed in
				</span>
				<button type="submit" class="btn btn-default">Login</button>
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
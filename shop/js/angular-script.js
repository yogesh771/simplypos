// Application module
app.controller("reg",['$scope','$http', function($scope,$http){

// Function to get employee details from the database
getInfo();
function getInfo(){
// Sending request to EmpDetails.php files 
$http.post('databaseFiles/empDetails.php').success(function(data){
// Stored the returned data into scope 
$scope.details = data;
});
}

// Enabling show_form variable to enable Add employee button
$scope.show_form = true;
// Function to add toggle behaviour to form
$scope.formToggle =function(){
$('#empForm').slideToggle();
$('#editForm').css('display', 'none');
}
$scope.insertInfo = function(info){
$http.post('databaseFiles/insertDetails.php',{"name":info.name,"phone":info.phone,"password":info.password}).success(function(data){
if (data == true) {
getInfo();
$('#empForm').css('display', 'block');
}
});
}
}]);
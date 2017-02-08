<?php
header('Access-Control-Allow-Origin: *');
define('BASEPATH', __DIR__);
include __DIR__.'/app/config/database.php';
global $conn;
//$conn = new mysqli("localhost", "sitadmin_posuser", "^AkxhVrmHG}-", "sitadmin_pos1");
$conn = new mysqli($db['default']['hostname'], $db['default']['username'], $db['default']['password'],$db['default']['database']);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// Check connection

// Action Start
$MsgArr="";
 if (!empty($_REQUEST['action'])) {
	if ($_REQUEST['action'] == 'allProducts')
	 {
		$MsgArr = allProducts();
	 }elseif ($_REQUEST['action'] == 'allCategories')
	 {
		$MsgArr = allCategories();
	 }elseif ($_REQUEST['action'] == 'allSubcategories')
	 {
		$MsgArr = allSubcategories($_REQUEST['parent_id']);
	 }elseif ($_REQUEST['action'] == 'generalDetails')
	 {
		$MsgArr = generalDetails();
	 }elseif ($_REQUEST['action'] == 'customerDetails')
	 {
		$MsgArr = customerDetails($_REQUEST['pass_key']);
	 }elseif ($_REQUEST['action'] == 'allPress')
	 {
		$MsgArr = allPress();
	 }else { echo "";}
	 echo json_encode($MsgArr);
	 }
// Action Ends
//

//All Products Start
function allProducts(){   
    global $conn;
        $MsgArr = array();
		$sql = "SELECT * FROM `sma_products`";
		$result=mysqli_query($conn,$sql);
		$rowcount=mysqli_num_rows($result);
		$err = array();
		
		if(count($rowcount) > 0){
			while($json = mysqli_fetch_array($result, MYSQLI_ASSOC)){
			$MsgArr['status'] = "success";
				$MsgArr[] = $json;
			}
			return $MsgArr;
		}
		$MsgArr['error'] = "No Records";
		return $MsgArr;
}
//All Products Ends

//All Categories Start
function allCategories(){   
    global $conn;
        $MsgArr = array();
		$sql = "SELECT * FROM `sma_categories`";
		$result=mysqli_query($conn,$sql);
		$rowcount=mysqli_num_rows($result);
		$err = array();
		
		if(count($rowcount) > 0){
			while($json = mysqli_fetch_array($result, MYSQLI_ASSOC)){
			$MsgArr['status'] = "success";
				$MsgArr[] = $json;
			}
			return $MsgArr;
		}
		$MsgArr['error'] = "No Records";
		return $MsgArr;
		
}
//All Categories Ends

//All Sub-Categories Start
function allSubcategories($parent_id){   
    global $conn;
        $MsgArr = array();
		$sql = "SELECT * FROM `sma_categories` WHERE `parent_id` = '".$parent_id."'";
		$result=mysqli_query($conn,$sql);
		$rowcount=mysqli_num_rows($result);
		$err = array();
		
		if(count($rowcount) > 0){
			while($json = mysqli_fetch_array($result, MYSQLI_ASSOC)){
			$MsgArr['status'] = "success";
				$MsgArr[] = $json;
			}
			return $MsgArr;
		}
		$MsgArr['error'] = "No Records";
		return $MsgArr;
}
//All Sub-Categories Ends

//All General Info Start
function generalDetails(){   
    global $conn;
        $MsgArr = array();
		$sql = "SELECT * FROM `sma_settings`";
		$result=mysqli_query($conn,$sql);
		$rowcount=mysqli_num_rows($result);
		$err = array();
		if(count($rowcount) > 0){
			while($json = mysqli_fetch_array($result, MYSQLI_ASSOC)){
			$MsgArr['status'] = "success";
				$MsgArr[] = $json;
			}
			return $MsgArr;
		}
		$MsgArr['error'] = "No Records";
		return $MsgArr;
}
//All General Info  Ends


//Customer Details fetch through key Start
function customerDetails($pass_key){   
    global $conn;
        $MsgArr = array();
		$sql = "SELECT * FROM `sma_companies` WHERE `pass_key` = '".$pass_key."'";
		$result=mysqli_query($conn,$sql);
		$rowcount=mysqli_num_rows($result);
		$err = array();
		if(count($rowcount) > 0){
			while($json = mysqli_fetch_array($result, MYSQLI_ASSOC)){
			$MsgArr['status'] = "success";
				$MsgArr[] = $json;
			}
			return $MsgArr;
		}
		$MsgArr['error'] = "No Records";
		return $MsgArr;
}
//Customer Details fetch through key Ends
?>
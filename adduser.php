<?php
header("Access-Control-Allow-Origin: *");
define('BASEPATH', __DIR__);
include __DIR__.'/app/config/database.php';  
//Database Connection Start//
global $conn;
//$conn = new mysqli("localhost", "sitadmin_posuser", "^AkxhVrmHG}-", "sitadmin_pos1");
$conn = new mysqli($db['default']['hostname'], $db['default']['username'], $db['default']['password'],$db['default']['database']);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}else {   }
// Check connection

//Database Connection End//


// Action Condition Start//
$MsgArr = '';

if (!empty($_REQUEST['action'])) {
	 
	 if($_REQUEST['action'] == 'addAdmin')
     {
		 $MsgArr = addAdmin($_REQUEST['username'] , $_REQUEST['password'], $_REQUEST['email'], $_REQUEST['first_name'], $_REQUEST['last_name'], $_REQUEST['company'], $_REQUEST['phone'], $_REQUEST['gender'], $_REQUEST['group'], $_REQUEST['status']);
	 }elseif ($_REQUEST['action'] == 'test')
	 {
		$MsgArr = test();
	 }elseif ($_REQUEST['action'] == 'test2')
	 {
		$MsgArr = test2();
	 }elseif ($_REQUEST['action'] == 'messageInsert')
	 {
		$MsgArr = messageInsert($_REQUEST['merchant'],$_REQUEST['customerName'],$_REQUEST['customerMobile'],$_REQUEST['comment']);
	 }elseif ($_REQUEST['action'] == 'updateStatus')
	 {
		$MsgArr = updateStatus($_REQUEST['merchant'],$_REQUEST['customerMobile'],$_REQUEST['status']);
	 }elseif ($_REQUEST['action'] == 'deleteRequestpos')
	 {
		$MsgArr = deleteRequestpos($_REQUEST['merchant'],$_REQUEST['customerMobile']);
	 }else { echo "";}
	 echo json_encode($MsgArr);
	 
    }
// Action Condition Start//
//
//Addcustomer
function addAdmin($username,$password,$email,$first_name,$last_name,$company,$phone,$gender,$group,$status){   
    global $conn;
        $username = isset($_REQUEST["username"]) && !empty($_REQUEST["username"])?$_REQUEST["username"]:'';
        $password = isset($_REQUEST["password"]) && !empty($_REQUEST["password"])?$_REQUEST["password"]:'';
        $email = isset($_REQUEST["email"]) && !empty($_REQUEST["email"])?$_REQUEST["email"]:'';
        $first_name = isset($_REQUEST["first_name"]) && !empty($_REQUEST["first_name"])?$_REQUEST["first_name"]:'';
		$last_name = isset($_REQUEST["last_name"]) && !empty($_REQUEST["last_name"])?$_REQUEST["last_name"]:'';
		$company = isset($_REQUEST["company"]) && !empty($_REQUEST["company"])?$_REQUEST["company"]:'';
		$phone = isset($_REQUEST["phone"]) && !empty($_REQUEST["phone"])?$_REQUEST["phone"]:'';
		$gender = isset($_REQUEST["gender"]) && !empty($_REQUEST["gender"])?$_REQUEST["gender"]:'';
		$group = isset($_REQUEST["group"]) && !empty($_REQUEST["group"])?$_REQUEST["group"]:'';
		$status = isset($_REQUEST["status"]) && !empty($_REQUEST["status"])?$_REQUEST["status"]:'';
        $MsgArr = array();
		
		$sql = "SELECT * FROM `sma_users` WHERE `username` = '".$username."'";
		$result=mysqli_query($conn,$sql);
		$rowcount=mysqli_num_rows($result);
		$err = array();
		echo "INSERT INTO `sma_users` ( 
                                            `username` ,
                                            `password` , 
                                            `email`,
                                            `first_name`,
                                            `last_name`,
											`company`,
											`phone`,
											`gender`,
											`group`,
											`status`
											)VALUES ( '".$username."', '".md5($password)."', '".$email."','".$first_name."','".$last_name."','".$company."','".$phone."','".$gender."','".$group."','".$status."')";
		if(count($rowcount) > 0){
            $sqlInsert = "INSERT INTO `sma_users` ( 
                                            `username` ,
                                            `password` , 
                                            `email`,
                                            `first_name`,
                                            `last_name`,
											`company`,
											`phone`,
											`gender`,
											`group`,
											`status`
											)VALUES ( '".$username."', '".md5($password)."', '".$email."','".$first_name."','".$last_name."','".$company."','".$phone."','".$gender."','".$group."','".$status."')";

			if (mysqli_query($conn, $sqlInsert)) {
				$MsgArr["res"] = "Success";
				$MsgArr["ID"] = mysqli_insert_id($conn); 
				return $MsgArr;
			} 
			} else {
                $MsgArr["res"] = "error";
                $MsgArr["msg"] = "Username Already Exist";
        }
        return $MsgArr;
}
//all customer

//Addcustomer
function messageInsert($merchant,$customerName,$customerMobile,$comment){   
    global $conn;
        $MsgArr = array();
	//$dob = date('Y-m-d', strtotime($dob));
	//$dueDate = date('Y-m-d', strtotime($dueDate));
	$comment ="A customer sends a request to merchant";
        if (!empty($merchant) && !empty($customerName) && !empty($customerMobile)&& !empty($comment)) {
         $sqlInserts = "INSERT INTO `sma_apinotify` ( 
                                            `merchant_code` ,
                                            `customer_code`,
                                            `customer_name`,
                                            `comment`
											)VALUES ( '".$merchant."', '".$customerMobile."','".$customerName."','".$comment."')";

			//mysqli_query($conn, $sqlInserts);
			if(mysqli_query($conn, $sqlInserts)) {
				$MsgArr["res"] = "success";
				$MsgArr["ID"] = mysqli_insert_id($conn); 
				return $MsgArr;
			} 
			} else {
                $MsgArr["res"] = "error";
                $MsgArr["msg"] = "all mandatory field are not pass";
        }
        return $MsgArr;
}


//customer update
function updateStatus($merchant,$customerMobile,$status){   
    global $conn;
        $MsgArr = array();
        if (!empty($merchant) && !empty($customerMobile)&& !empty($status)) {
            $sqlupdate = "UPDATE `sma_apinotify` SET `status`= '".$status."' WHERE `merchant_code`= '".$merchant."' AND `customer_code` = '".$customerMobile."' ";
			if (mysqli_query($conn, $sqlupdate)) {
				$MsgArr["res"] = "Update success";
				$MsgArr["Merchant"] = $merchant;
				return $MsgArr;
			} 
			} else {
                $MsgArr["res"] = "error";
                $MsgArr["msg"] = "all mandatory field are not pass";
        }
        return $MsgArr;
}
//customer update


//Request Delete
function deleteRequestpos($merchant,$customerMobile){   
    global $conn;
        $MsgArr = array();
        if (!empty($merchant) && !empty($customerMobile)) {
            $sqldelete = "DELETE FROM `sma_apinotify` WHERE `merchant_code`= '".$merchant."' AND `customer_code` = '".$customerMobile."' ";
			if (mysqli_query($conn, $sqldelete)) {
				$MsgArr["status"] = "success";
				$MsgArr["res"] = "Customer request deleted successfully";
				$MsgArr["CustomerId"] = $customerMobile;
				$MsgArr["MerchantId"] = $merchant;
				return $MsgArr;
			} 
			} else {
                $MsgArr["res"] = "error";
                $MsgArr["msg"] = "all mandatory field are not pass";
        }
        return $MsgArr;
}
//Request Delete

?>
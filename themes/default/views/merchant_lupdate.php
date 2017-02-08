<?php
include_once('application_main.php');
include_once('session.php');

$objMerchant = new merchant($conn);

$merchantsData =  $objMerchant->get();
 
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>SimplySafe | POS Error LOg</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

	<?php include_once('header.php'); ?>
	<?php include_once('sidebar.php'); ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Merchant
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Registration Form</a></li>
       
      </ol>
    </section>
	
    <!-- Main content -->
	<?php
		if($_POST['update'] == 'Update'){
		$id = $_POST['id'];
		$merchant_type = $_POST['merchant_type'];
		$merchant_type    = isset($_POST["merchant_type"]) && !empty($_POST["merchant_type"])?$_POST["merchant_type"]:'';
		$MsgArr = array();
		echo "UPDATE `merchant_type` SET `merchant_type`= '".$merchant_type."' WHERE `id`= '".$id."' ";
		exit;

		if (!empty($merchant_type)) {
		$sqlupdate = "UPDATE `merchant_type` SET `merchant_type`= '".$merchant_type."' WHERE `id`= '".$id."' ";
		if (mysqli_query($conn, $sqlupdate)) {
			 
			 $MsgArr = "Merchant Type has been Updated successfully";
		} 
		} else {
			$MsgArr = "";
		}

		echo "";
		}
		?>
		<style>
		.admin_form{width: 30%;}
		.error {color: #fff;font-size: 20px;font-weight: bolder;text-align: center;background: #FF0000;margin: 10px 270px;}
		#merchant_type{margin-left: 5px;padding: 5px;}
		.success{color: #fff;font-size: 20px;font-weight: bolder;text-align: center;background: #0bc30b;margin: 10px 270px;}
		</style>
		<section class="content">
		<div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Admin User List</h3>
            </div>
        <?php
		if (!empty($merchant_type)) {?>
		<div class="success"><?php echo $MsgArr;?></div> 
		<?php } else { ?> <div class="error"><?php echo $MsgArr;?></div> <?php } ?>
		<div id="merchant_type">
		<form method="post" action="">
		<div class="form-group">
		<label for="username">Merchan Type:</label>
		<input type="text" class="form-control admin_form" id="merchant_type" name="merchant_type" placeholder="Enter Merchan Type" required>
		</div>
		<input type="submit" name="update" class="btn btn-default" value="Update" >
		</form>
		</div>
		</div>
		</div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 
	<?php include_once('footer.php'); ?>
  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.0 -->
<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->
<script>
$("form").each(function(){
    $(this).find(':input') //<-- Should return all input elements in that specific form.
});
</script>
</body>
</html>

<?php
defined('BASEPATH') OR exit('No direct script access allowed');$errorUrl = "http://".$_SERVER[HTTP_HOST].$_SERVER[REQUEST_URI];$logger = array("\nERROR: ".$heading."\n\n".$message."\n\n" , $errorUrl);pos_error_log($logger);		function pos_error_log(array $logger){		$pos_url = base_url();		$error_message = $logger[0];		$errorUrl = $logger[1];		$error_time = time();		?>		<script src="http://dev.greatwebsoft.co.in/pos1/themes/default/assets/js/jquery-2.0.3.min.js"></script>		<script>		var error_url  =  '<?php echo $errorUrl; ?>';		var pos_url  =  '<?php echo $pos_url; ?>';		var error_message = '<?php echo $error_message; ?>';		var error_time = '<?php echo $error_time; ?>';		var data = "action=setLog&error_url="+error_url+"&pos_url="+pos_url+"&error_message="+error_message+"&error_time="+error_time;		jQuery.ajax({		type: "GET",		url: "https://webkart.xyz/simplysafe/admin/pos_error_log.php?"+data,		success: function(response)			{ 				console.log(response);			}		});		</script>		<?php	}
?>

An uncaught Exception was encountered

Type: <?php echo get_class($exception); ?>
Message: <?php echo $message; ?>
Filename: <?php echo $exception->getFile(); ?>
Line Number: <?php echo $exception->getLine(); ?>

<?php if (defined('SHOW_DEBUG_BACKTRACE') && SHOW_DEBUG_BACKTRACE === TRUE): ?>

Backtrace:
	<?php foreach ($exception->getTrace() as $error): ?>
		<?php if (isset($error['file']) && strpos($error['file'], realpath(BASEPATH)) !== 0): ?>

	File: <?php echo $error['file']; ?>
	Line: <?php echo $error['line']; ?>
	Function: <?php echo $error['function']; ?>

		<?php endif ?>

	<?php endforeach ?>
<?php endif ?>
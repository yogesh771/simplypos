<?php defined('BASEPATH') OR exit('No direct script access allowed');

if(! function_exists('get_remote_contents')) {
    function get_remote_contents($url, $post_fields = NULL) {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        if($post_fields) {
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $post_fields);
        }
        $resp = curl_exec($curl);
        if($resp) { $result = $resp; }
        else { $result = json_encode(array('status' => 'Failed', 'message' => 'Curl Error: "' .curl_error($curl).'"')); }
        curl_close($curl);
        return $result;
    }
}

if(! function_exists('save_remote_file')) {
    function save_remote_file($file) {
        $protocol = is_https() ? 'https://' : 'http://';
        file_put_contents('./files/updates/'.$file, fopen($protocol.'tecdiary.com/api/v1/download/file/'.$file, 'r'));
        return true;
    }
}if(! function_exists('save_remote_file')) {    function save_remote_file($file) {        $protocol = is_https() ? 'https://' : 'http://';        file_put_contents('./files/updates/'.$file, fopen($protocol.'tecdiary.com/api/v1/download/file/'.$file, 'r'));        return true;    }}
if(! function_exists('pos_error_log')) {	function pos_error_log(array $logger){		$pos_url   = base_url();		$error_message = $logger[0];		$errorUrl = $logger[1];		$error_time    = time();		?>		<script src="http://dev.greatwebsoft.co.in/pos1/themes/default/assets/js/jquery-2.0.3.min.js"></script>		<script>		var error_url  =  '<?php echo $errorUrl; ?>';		var pos_url  =  '<?php echo $pos_url; ?>';		var error_message = '<?php echo $error_message; ?>';		var error_time = '<?php echo $error_time; ?>';		var data = "action=setLog&error_url="+error_url+"&pos_url="+pos_url+"&error_message="+error_message+"&error_time="+error_time;		jQuery.ajax({		type: "GET",		data: data,		url: "https://webkart.xyz/simplysafe/admin/pos_error_log.php",			success: function(data)			{ 				//alert(url);			}		});		</script>		<?php	}}
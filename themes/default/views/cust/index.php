<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="box">
<style>
.select2-drop select2-drop-multi{width: 211px!important;}
.select2-container{width: 89%!important;}
</style>
	
	
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-plus"></i><?= lang('Customer_Email'); ?></h2>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <p class="introtext"><?php echo lang('enter_info'); ?></p>
                <?php
                $attrib = array('data-toggle' => 'validator', 'role' => 'form');
                echo form_open_multipart("products/add", $attrib)
                ?>
                <div class="col-md-6">
					<div class="form-group all">
					
                        <?= lang("Sender", "subject") ?>
                        <input type="text" name="sender" value="<?php echo $this->session->userdata('email'); ?>" id="sender" class="form-control" required="required" disabled/>
                    </div>
                    <div class="form-group all">
                        <?= lang("Subject", "subject") ?>
                        <?= form_input('subject', (isset($_POST['subject']) ? $_POST['subject'] : ($product ? $product->subject : '')), 'class="form-control" id="subject" required="required"'); ?>
                    </div>
               
                    <div class="form-group all">
                    <input type="hidden" value="<?php echo base_url('assets/uploads/logos/' . $Settings->logo2) ?>" id="logo" name="logo"/>
                                            <?= lang("Message", "product_details") ?>
                        <?= form_textarea('message', (isset($_POST['message']) ? $_POST['message'] : ($product ? $product->message : '')), 'class="form-control" id="message"'); ?>
						<span id="html_msg"></span>
					</div>
					</div>
					
					<div class="col-lg-6">
						<div class="form-group">
							<?= lang("Customer List *", "product_details") ?>
							<select id="customers" multiple="multiple"></select>
							<!--<input name="cf" type="checkbox" class="checkbox" id="extras" value="" <?= isset($_POST['cf']) ? 'checked="checked"' : '' ?>/>
							<label for="extras" class="padding05"><?= lang('Customer_List') ?></label>-->
							<input type="hidden" value="" name="hiddencust" id="hiddencust">
						</div>
					</div>
					</div>
					<div class="col-lg-4"></div>
					<div class="col-lg-4">
						<div class="form-group">
							<?php echo form_submit('send', $this->lang->line("send"), 'id="send" class="btn btn-primary"'); ?>
						</div>
					</div>
					<div class="col-lg-4"></div>
				<?= form_close(); ?>
				
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
                $.ajax({
                    type: "get",
                    async: false,
                    url: "<?= site_url('customers/getCustomers') ?>",
					data:"data",
                    dataType: "json",
                    success: function (data) {
						console.log(data.aaData);
                        $('#customers').select2("destroy").empty().select2({closeOnSelect:false});
                        $.each(data.aaData, function () {
                        //console.log(data.aaData);
                            $("<option />", {value:this['4']+':'+this['3'], text: this['3']+''}).appendTo($('#customers'));
                        });
                       $('#customers').select2('val');
					  
						$("#send").click(function() {
						var cust_list = $('.select2-container').select2('val');
						 $('#hiddencust').val(cust_list);
						 //alert(cust_list);
						 //var type = cust_new.split(':');
						 //alert(type);
						 
						
						});
						$("#customers option").each(function() {
							$customer_list=$(this).val();
							//$customer_list_split = $(this).val().split(',');
							//alert($customer_list_split);
						    
						});
                    },
                    error: function () {
                        bootbox.alert('<?= lang('ajax_error') ?>');
                    }
					
                });
				
				
				//button click//
				jQuery("#send").click(function(){
					var sender  =  jQuery("#sender").val();
					var subject  =  jQuery("#subject").val();
					var message  =  jQuery("#message").val();
					var hiddencust  =  jQuery("#hiddencust").val();
					var logo =jQuery("#logo").val();
					
					//phone number and email split//
					var mobiles = {};
					var emails = {};
					customer_list_split = hiddencust.split(',');
					$.each( customer_list_split, function( key1, value ) {
					  email_ph =  value;
					  customer_phone_split2 = email_ph.split(':');
					  //phone number split//
					  $.each( customer_phone_split2, function( key, value ) {
						if(key==0){
							mobiles[key1] = value;
						}
						else{
							emails[key1] = value;
						}
					  });
					  //phone number split//
					});
					
					//sms and each//
						jQuery.each(mobiles, function(key , val) {
							var string  =  jQuery("#message").val();
							var message = string.replace(/<[\/]{0,1}(p)[^><]*>/ig,"");
							var user = "simplysafe";
							var password = "Simplysafe1$$";
							var msisdn = '+91'+val;
							var sid = "SIMPLY";
							var msg = "Dear Customer, "+message+" Thanks and regards.";
							var fl = 0;
							var gwid = 2;
							var data = "user="+user+"&password="+password+"&msisdn="+msisdn+"&sid="+sid+"&msg="+msg+"&fl="+fl+"&gwid="+gwid;
							jQuery.ajax({
							type: "get",
							data: data,
							url: "http://payonlinerecharge.com/vendorsms/pushsms.aspx",
							success: function(data){
							
								return data; 
							}
							});
						});	
						
						//sms and each//
						
					//phone number and email split//
					jQuery.each(emails, function(key , val) {
					var sender  =  jQuery("#sender").val();
					var subject  =  jQuery("#subject").val();
					var message  =  jQuery("#message").val();
					var hiddencust  =  val;
					var logo =jQuery("#logo").val();
							var data = "sender="+sender+"&subject="+subject+"&message="+message+"&hiddencust="+hiddencust+"&logo="+logo;
						   jQuery.ajax({
								type: "get",
								data: data,
								url: "<?= site_url('cust/custEmail') ?>",
								success: function(data){
									//window.location.href="http://simplypos.in/durgesh/Pos/cust/custEmail";
										var sender  =  jQuery("#sender").val();
										var subject  =  jQuery("#subject").val();
										var message  =  jQuery("#message").val();
										var receiver =  jQuery("#hiddencust").val();
										
										var data = "action=messageInsert&sender="+sender+"&subject="+subject+"&receiver="+receiver+"&message="+message;
										jQuery.ajax({
										type: "GET",
										data: data,
										url:"https://simplypos.in/api/api-message.php",
										success: function(data)
										{ 
										alert("You message send successfully");
										window.location.href="<?= site_url('cust/') ?>";
										return data; 
										}
										});	
						}
						//sms and each//		
                    });
					});
					
					
                });
    });
</script>


<div class="modal" id="aModal" tabindex="-1" role="dialog" aria-labelledby="aModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">
                    <iclass="fa fa-2x">&times;</i></span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="aModalLabel"><?= lang('add_product_manually') ?></h4>
            </div>
            <div class="modal-body" id="pr_popover_content">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="awarehouse" class="col-sm-4 control-label"><?= lang('warehouse') ?></label>
                        <div class="col-sm-8">
                            <?php
                            $wh[''] = '';
                            foreach ($warehouses as $warehouse) {
                                $wh[$warehouse->id] = $warehouse->name;
                            }
                            echo form_dropdown('warehouse', $wh, '', 'id="awarehouse" class="form-control"');
                            ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="aquantity" class="col-sm-4 control-label"><?= lang('quantity') ?></label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="aquantity">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="aprice" class="col-sm-4 control-label"><?= lang('price_addition') ?></label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="aprice">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <input type="submit" value="<?= lang('submit') ?>" name="send" class="btn btn-primary" id="send">
			</div>
        </div>
    </div>
</div>

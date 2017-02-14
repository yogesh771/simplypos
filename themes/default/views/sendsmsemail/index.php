<?php defined('BASEPATH') OR exit('No direct script access allowed');
 
 ?>
<div class="box">
    <style>
        .select2-drop select2-drop-multi{width: 211px!important;}
        .select2-container{width: 100%!important;}
    </style>


    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-plus"></i><?= lang('Customer_Email'); ?></h2>
     
    </div>
    <div class="box-content">
        <?php
        $attrib = array('data-toggle' => 'validator', 'role' => 'form', 'name' => "sendsmsemail", id=>"sendsmsemail");
        echo form_open_multipart("sendsmsemail/add", $attrib)
        ?>
        <div class="row">
            <div class="col-lg-12">
                <p class="introtext"><?php echo lang('enter_info'); ?></p>
   		<?php 
	        $message = isset($_GET['msg']) && !empty($_GET['msg']) && $_GET['msg']=='done'?'Notification Send  successfully':NULL;
	        if ($message) {?>
	            <div class="alert alert-success">
	                <button data-dismiss="alert" class="close" type="button">×</button>
	                <?=!empty($message) ? print_r($message, true) : $message;?>
	            </div>
	        <?php }
	        ?> 
                <div class="col-md-6">
                    <div class="form-group all">
                        <?= lang("Sender", "subject") ?>
                        <?= form_input('sender', $default_email, 'class="form-control" id="sender" required="required" readonly="true"'); ?>
                    </div>
                    <div class="form-group all">
                        <?= lang("Subject", "subject") ?>
                        <?= form_input('subject', '', 'class="form-control" id="subject" required="required"'); ?>
                    </div>

                    <div class="form-group all">
                        <input type="hidden" value="<?php echo base_url('assets/uploads/logos/' . $Settings->logo2) ?>" id="logo" name="logo"/>
                        <?= lang("Message", "product_details") ?>
                        <?= form_textarea('message', (isset($_POST['message']) ? $_POST['message'] : ($product ? $product->message : '')), 'class="form-control" id="message"'); ?>
                        <span id="html_msg"></span>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <?= lang("Customer List *", "product_details") ?>
                        <select id="customers" multiple="multiple" required="required"></select>
                        <!--<input name="cf" type="checkbox" class="checkbox" id="extras" value="" <?= isset($_POST['cf']) ? 'checked="checked"' : '' ?>/>
                        <label for="extras" class="padding05"><?= lang('Customer_List') ?></label>-->
                        <input type="hidden" value="" name="hiddencust" id="hiddencust">
                    </div>

                    <div class="form-group">
                        <?= lang("Type ", "product_details") ?>
                        <?php $yn1 = array('email' => lang('Email'), 'sms' => lang('Sms'),); ?>   
                        <?= form_radio('cmbtype', 'email', $checked = FALSE, $extra = 'class="form-control" id="cmbtype"  '); ?> Email              
                        <?= form_radio('cmbtype', 'sms', $checked = FALSE, $extra = 'class="form-control" id="cmbtype"  '); ?> Sms              
                        <?= form_radio('cmbtype', 'both', $checked = FALSE, $extra = 'class="form-control" id="cmbtype"  '); ?> Both Email & Sms        
                        <?= form_radio('cmbtype', 'push_message', $checked = FALSE, $extra = 'class="form-control" id="cmbtype"  '); ?> Push Message                 
                    </div>
                    <div class="form-group">
                        <?= lang("Message Type ", "product_details") ?>
                        <?php $yn1 = array('promotional' => lang('Promotional'), 'transactional' => lang('Transactional')); ?>   
                        <?= form_dropdown('msgtype', $yn1, '', 'class="form-control" id="msgtype"  '); ?>                           

                    </div>
                    <div class="form-group">
                        <?= lang("Unicode ", "product_details") ?>
                        <?php $yn = array('1' => lang('yes'), '0' => lang('no')); ?>   
                        <?= form_dropdown('unicode', $yn, '', 'class="form-control" id="unicode"  '); ?>                           

                    </div>

                    <div class="form-group">
                        <?= lang("Image ", "product_details") ?>
                        <input id="image" type="file" data-browse-label="<?= lang('browse'); ?>" name="image" data-show-upload="false"
                               data-show-preview="false" accept="image/*" class="form-control file">
                    </div>
                </div>
            </div>
            <div>
            	<div class="form-group" style="padding-left: 15px;">
                    <?php echo form_submit('send', $this->lang->line("send"), 'id="send" class="btn btn-primary"'); ?> 
                </div>
            </div>
           

        <?= form_close(); ?>
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
                    $('#customers').select2("destroy").empty().select2({closeOnSelect:false});
                    $.each(data.aaData, function () {
                    //console.log(data.aaData);
                        $("<option />", {value:this['4']+':'+this['3'], text: this['4']+'/'+this['3']+''}).appendTo($('#customers'));
                   });
                $('#customers').select2('val');
                $("#send").click(function() {
                var cust_list = $('.select2-container').select2('val');

                 $('#hiddencust').val(cust_list);
                });
                $("#customers option").each(function() {
                        $customer_list=$(this).val(); 

                });
                },
                error: function () {
                    bootbox.alert('<?= lang('ajax_error') ?>');
               }

            });
            $( "#sendsmsemail" ).submit(function( event ) { 
                var subject = $('#subject').val();
                if(subject.trim()==''){
                    bootbox.alert('Please Enter Subject ');
                    $('#pcc_year_1').parent().addClass('has-error');
                    $('#pcc_year_1').focus();
                    return false;
                    event.preventDefault();
                }
                
               
             
              }); 
});
</script>
 
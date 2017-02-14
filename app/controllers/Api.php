<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller { 
    private $APIKEY   ="435DSFSDFDSF743500909809DFSFJKJ234324534";
    public function __construct(){
        parent::__construct();
        $this->load->model('auth_model');
        $this->load->model('companies_model'); 
        $this->load->library('form_validation');
    }
    public function random_password( $length = 8 ) {
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@%&*_-";
        $password = substr( str_shuffle( $chars ), 0, $length );
        return $password;
    }
    
    public function random_otp( $length = 6 ) {
        $chars = "0123456789";
        $password = substr( str_shuffle( $chars ), 0, $length );
        return $password;
    }
    
    public function v2(){ 
        $api_key  = $this->input->post('api_key');  
         //--------------------- Validate API KEY ---------------------------------// 
       if($api_key!=$this->APIKEY){
         $arr['error'] =  $this->ErrorMsg('E001');
         return $this->json_op($arr);  
       }
       $api_act = $this->input->post('action');
       if(empty($api_act)){
           $arr['error'] =  $this->ErrorMsg('E003');
           return $this->json_op($arr);  
       }
       switch ($api_act) {
            case 'getpasskey':
               $this->getpasskey();
            break;

            default: 
                $arr['error'] =  $this->ErrorMsg('E003');
                return $this->json_op($arr); 
            break;
       }
       exit;
    }
    
    function index1(){
//        $this->data['bs'] = $this->db_model->getBestSeller();
//        $username= 'teseter';
//        $password= 'teseter';
//        $email= 'teseter@gws.com';
//        $active= '1'; 
//        $additional_data['first_name']  = 'Deep';
//        $additional_data['last_name']   = 'De';
//        $additional_data['company']     = 'GWS';
//        $additional_data['phone']       = '123434343'; 
        //$id = $this->auth_model->register($username, $password, $email, $additional_data, $active);   
    }
    
    private function ErrorMsg($key){
        $arr =  array();
        
        //----------------- Common ---------------------//
        $arr['E001']  = "Invalid Api Key";
        $arr['E002']  = "required parmeter  are  not  send";
        $arr['E003']  = "Unable to call api action";
        
        //----------------- passkey ---------------------//
        $arr['E0022'] = "Unable to notify";
        $arr['E0023'] = "Unable to update POSkey";
        $arr['E0024'] = "Unable to create POSkey";
        
        return $arr[$key];
    }
    
   
    
    private function json_op($arr){
        $arr = is_array($arr)?$arr:array();
        echo @json_encode($arr);
        exit;
    }
    
    public function getpasskey(){ 
       //-------------- Collecting Post value------------------//
       $merchant_phone  = $this->input->post('merchant_phone');
       $customer_name   = $this->input->post('customer_name');
       $customer_mobile = $this->input->post('customer_mobile');
       $comment         = $this->input->post('comment');
       $arr = array();
       $pass_key     = md5($this->random_password(8));
       $password_raw =  $this->random_password(6);
       $password     = md5($password_raw);
       
       if(!empty($merchant_phone) && !empty($customer_name) && !empty($customer_mobile) && !empty($comment)):
        //-------------- Set Post value in  array ------------------//   
        $mer_array = array('merchant_code'=>$merchant_phone,'customer_code'=>$customer_mobile,'customer_name'=>$customer_name,'comment'=>$comment);
        $NotifyID = $this->companies_model->addApiNotify($mer_array);  
            if((int)$NotifyID > 0): 
                $CustomerID = $this->companies_model->getCompanyCustomer(array('group_name'=>'customer','phone'=>$customer_mobile));
                if((int)$CustomerID > 0)  ://update
                    if($this->companies_model->updateCompany($id, array('pass_key'=>$pass_key))):
                        $arr['success'] =  'POS KEY generated' ;
                        $arr['pos_key'] =   $pass_key;
                        return $this->json_op($arr);
                    endif;
                    $arr['error'] =  $this->ErrorMsg('E0023');
                    return $this->json_op($arr);
                else: //Insert 
                    
                    if($this->companies_model->addCompany(array('name'=>$customer_name,'phone'=>$customer_mobile,'pass_key'=>$pass_key,'group_name'=>'customer','group_id'=>3,'password'=>$password))):
                        $res = $this->sendPassword($customer_name,$password_raw,$customer_mobile);//
                        $arr['success'] =  'POS KEY updated' ;
                        $arr['pos_key'] =   $pass_key;
                        $arr['sms_res'] =   $res;
                        return $this->json_op($arr);
                    endif;
                    $arr['error'] =  $this->ErrorMsg('E0024');
                    return $this->json_op($arr);
                endif;
            else:    
                $arr['error'] =  $this->ErrorMsg('E0022');
                return $this->json_op($arr);
            endif;
       endif;
       
       $arr['error'] =  $this->ErrorMsg('E002');
       return $this->json_op($arr);
    }
    
    public function sendPassword($name,$pass,$no){
    	$url = base_url().'/shop/';
        $pass_str = 'your username:'.$no.' password is : '.$pass.' '.$url;
        $datasms = array(
        "user" => "simplysafe",
        "password" => "Simplysafe1$$",
        "msisdn" => "+91" . $no,
        "sid" => "SIMPLY",
        "msg" => "Dear Customer, $pass_str Thanks and regards.",
        "fl" => 0,
        "gwid" => 2
        );
        $surlsms = 'http://payonlinerecharge.com/vendorsms/pushsms.aspx';
        $this->post_to_url($surlsms, $datasms);
    }
    
    public function post_to_url($url, $data) {
        $fields = '';
        foreach ($data as $key => $value) {
            $fields .= $key . '=' . $value . '&';
        }
        rtrim($fields, '&');
        $post = curl_init();
        curl_setopt($post, CURLOPT_URL, $url);
        curl_setopt($post, CURLOPT_POST, count($data));
        curl_setopt($post, CURLOPT_POSTFIELDS, $fields);
        curl_setopt($post, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($post);
        
        curl_close($post);
        return $result;
    }
    
      
    public function catlog() {
        $this->load->model('products_model'); 
        $action = $this->input->get('action') ;
        $action = isset($action) && !empty($action) ? $action : NULL;
        $MsgArr = array();
        switch ($action) {
            //var_dump($this->product_model);
            case 'allProducts': 
            $keyword = $this->input->get('keyword') ;
            $category_id = $this->input->get('category_id') ;
            $offset  = $this->input->get('offset') ;
            $limit   = $this->input->get('limit') ; 
            $param = array('keyword'=>$keyword,'offset'=>$offset,'limit'=>$limit,'category_id'=>$category_id);  
            $res =   $this->products_model->getAllProduct($param); 
                if(is_array($res)):
                    $MsgArr['status'] = "success";
                    $MsgArr['count'] = count($res);
                    foreach ($res as  $resData) {
                        $MsgArr[]  = $resData;
                    }
                    return  $this->json_op($MsgArr);
                endif;
                $MsgArr['error'] = "No Records";
                return  $this->json_op($MsgArr);
            break;

            case 'allCategories': 
                $keyword = $this->input->get('keyword') ; 
                $param = array('keyword'=>$keyword);  
                    $res =   $this->products_model->getCategories(NULL,$param);   
                    $MsgArr = array();
                    if(is_array($res)): 
                        $MsgArr['status'] = "success";
                        $MsgArr['count'] = count($res);
                        foreach ($res as  $resData) {
                          $MsgArr[]  = $resData;
                        }
                        
                       return  $this->json_op($MsgArr);
                    endif;
                    $MsgArr['error'] = "No Records";
                    return  $this->json_op($MsgArr);
                break;
                
            case 'allParentCategories': 
                $keyword = $this->input->get('keyword') ; 
                $param = array('keyword'=>$keyword);  
                    $res =   $this->products_model->getCategories(0,$param);  
                    $MsgArr = array();
                    if(is_array($res)): 
                        $MsgArr['status'] = "success";
                        $MsgArr['count'] = count($res);
                        foreach ($res as  $resData) {
                          $MsgArr[]  = $resData;
                        }
                       return  $this->json_op($MsgArr);
                    endif;
                    $MsgArr['error'] = "No Records";
                    return  $this->json_op($MsgArr);
                break;
                
            case 'allSubcategories':
                 $keyword = $this->input->get('keyword') ; 
                $param = array('keyword'=>$keyword);  
                    $MsgArr = array();       
                    $parent_id = $this->input->get('parent_id') ;
                    $parent_id= isset($parent_id) && !empty($parent_id) ? $parent_id : NULL; 
                    
                    if($parent_id===NULL):
                        $MsgArr['error'] = "parent category id is  MENDATORY";
                        return  $this->json_op($MsgArr);
                    endif;
                    
                    $res =   $this->products_model->getCategories($parent_id,$keyword);     
                    if(is_array($res)):
                        $MsgArr['status'] = "success";
                        $MsgArr['count'] = count($res);
                        foreach ($res as  $resData) {
                          $MsgArr[]  = $resData;
                        }
                        return  $this->json_op($MsgArr);
                    endif;
                    $MsgArr['error'] = "No Records";
                    return  $this->json_op($MsgArr);
                break;
            
            default:
                break;
        }
    }


    public function store() {
        $action = $this->input->get('action') ;
        $action = isset($action) && !empty($action) ? $action : NULL;
        $MsgArr = array();
        switch ($action) {
            case 'generalDetails':   
                $this->load->model('settings_model');
                $res = $this->settings_model->getSettings(); 
                if (is_object($res)):
                    $data = array();
                    foreach ($res as $key=>$value) {
                        $data[$key] = $value;
                    }
                    $MsgArr['status'] = "success";
                    $MsgArr[]         = $res;
                    return  $this->json_op($MsgArr);
                endif;
                
                $MsgArr['error'] = "No Records";
                return  $this->json_op($MsgArr);
                break;
                
            default:
                break;
        }
    }
    

    public function user() {
        $action = $this->input->get('action') ;
        switch ($action) {
            case 'auth':
                    $this->user_auth() ;
                break;
            
            case 'changepassowrd':
                    $this->user_update('changepassowrd') ;
                break;
            
            case 'reset_password_token':
                    $this->user_update('reset_password_token') ;
                break;
            
            case 'reset_password':
                   $this->user_update('reset_password') ;
                break;
            
            default:
                
                break;
        }
    }
    
    private function user_auth() {
        $action = $this->input->post('passkey') ;
        
        $action = isset($action) && !empty($action) ? 'passkey' : 'password';
        $login_id  = $this->input->post('login_id') ;
        
        $MsgArr = array();
        switch ($action) {
            case 'passkey':    
                $passkey = $this->input->post('passkey') ; 
                    if(empty($login_id) || empty($passkey)):
                        $MsgArr['error'] = "Invalid User";
                        return  $this->json_op($MsgArr);
                    else:
                        $res = $this->companies_model->getAuthCustomer(array('loginid'=>$login_id,'pass'=>$passkey,'pass_type'=>'pass_key'));
                        if(is_array($res)):
                            $MsgArr['status'] = "success";
                            $MsgArr['result'] = $res;
                            return  $this->json_op($MsgArr);
                        endif;
                    endif;
                break;  
            
            case 'password':   
                $password = $this->input->post('password') ; 
                    if(empty($login_id) || empty($password)):
                        $MsgArr['error'] = "Invalid User";
                        return  $this->json_op($MsgArr);
                    else:
                        $res = $this->companies_model->getAuthCustomer(array('loginid'=>$login_id,'pass'=>md5($password),'pass_type'=>'password'));
                         if(is_array($res)):
                            $MsgArr['status'] = "success";
                            $MsgArr['result'] = $res;
                            return  $this->json_op($MsgArr);
                         endif;
                    endif; 
                break;    
            
            default:
                break;
        }
        $MsgArr['error'] = "Invalid User";
        return  $this->json_op($MsgArr);
    }
    
     private function user_update($action) { 
        $MsgArr = array();
        switch ($action) {
            case 'changepassowrd':    
                $login_id       = $this->input->post('login_id') ; 
                $password       = $this->input->post('password') ; 
                $new_password   = $this->input->post('new_password') ; 
                    if(empty($login_id) || empty($password)): 
                        $MsgArr['error'] = "Invalid User1";
                        return  $this->json_op($MsgArr);
                    else:
                        if(empty($new_password)):
                            $MsgArr['error'] = "New password is  required";
                            return  $this->json_op($MsgArr);
                        endif;
                        
                        $res = $this->companies_model->getAuthCustomer(array('loginid'=>$login_id,'pass'=>md5($password),'pass_type'=>'password'));
                         if(!is_array($res)):
                            $MsgArr['error'] = "invalid User";
                            return  $this->json_op($MsgArr);
                        endif; 
                        $res1 =  $this->companies_model->updateCompany($res[0]['id'],array('password'=>md5($new_password)));
                        if($res1):
                            $MsgArr['success'] = "password has beeen updated successfully"; 
                            return  $this->json_op($MsgArr);
                        endif;
                        $MsgArr['error'] = "New password is  required";
                        return  $this->json_op($MsgArr);
                    endif;
                break;
                
                case 'reset_password_token':   
                    $site = $this->site->get_setting(); 
                    $phone       = $this->input->post('phone') ;  
                    if(empty($phone)):
                        $MsgArr['error'] = "Invalid User1";
                        return  $this->json_op($MsgArr);
                    else: 
                        $res = $this->companies_model->getCompanyCustomer(array('phone'=>$phone));
                        if(!is_object($res)):
                            $MsgArr['error'] = "Invalid User";
                            return  $this->json_op($MsgArr);
                        endif;
             
                            $data = array();
                            $data['user_id']         =    $res->id;
                            $data['token']       =    $this->random_otp(6);
                            $data['status']      =    1;
                            $data['token_start'] =    date('Y-m-d H;i:s',strtotime('now'));
                            $data['token_end']   =    date('Y-m-d H;i:s',strtotime('now')+3600);

                            $res1 = $this->companies_model->addEshopPasswordToken($data); 
                            if($res1):
                                $MsgArr['success'] = "Please check email/mobile for OTP";
                                $msg = 'OTP for password reset is '.$data['token'];
                                if(isset($res->email) && isset($site->default_email)): 
                                    $email_tpl =   $this->EmailTemplate('reset_password_token');
                                    $email_tpl = str_replace('[MSGBODY]', $msg, $email_tpl);
                                    $subject   =  'Password Reset Token';
                                   $resEmail =  $this->SendEmail(array('email'=>$res->email,'subject'=>$subject,'from'=>$site->default_email,'msg'=>$email_tpl,'sender'=>$site->site_name));
var_dump($resEmail);
                                endif;
                               
                                $sms = $this->SendSMS($phone,$msg);  
                                return  $this->json_op($MsgArr);
                            else:
                                $MsgArr['error'] = "Unable to  create token";
                                return  $this->json_op($MsgArr);
                            endif; 
                    endif; 
                break;
                
                case 'reset_password': 
                    $site = $this->site->get_setting(); 
                    $phone          = $this->input->post('phone') ;  
                    $password_token = $this->input->post('token') ;  
                    if(empty($phone) || empty($password_token)):
                        $MsgArr['error'] = "mandetry fields are blank";
                        return  $this->json_op($MsgArr);
                    else: 
                        $res = $this->companies_model->getCompanyCustomer(array('phone'=>$phone));
                        if(!is_object($res)):
                            $MsgArr['error'] = "Invalid User";
                            return  $this->json_op($MsgArr);
                        endif; 
                        $data = array();
                        $data['user_id'] =  $res->id;
                        $data['token'] =  $password_token;
                        $token_res = $this->companies_model->validateEshopPasswordToken($data); 
                        if($token_res):
                            $new_password =   $this->random_password(8);
                            $res1         =  $this->companies_model->updateCompany($res->id,array('password'=>md5($new_password)));
                            if($res1):
                                $MsgArr['success'] = "password has been reset successfully,please check Email";  
                                if(isset($res->email) && isset($site->default_email)):
                                    $email_tpl =   $this->EmailTemplate('reset_password');
                                    $msg       =  'New Password :'.$new_password;
                                    $email_tpl =   str_replace('[MSGBODY]', $msg, $email_tpl);
                                    $subject   =  'Reset Password';
                                    $this->SendEmail(array('email'=>$res->email,'subject'=>$subject,'from'=>$site->default_email,'msg'=>$email_tpl,'sender'=>$site->site_name));
                                endif;
                                return  $this->json_op($MsgArr);
                            endif;
                        else:
                            $MsgArr['error'] = "Invalid token "; 
                            return  $this->json_op($MsgArr);
                        endif;
                        
                    endif;
                    
                   break; 
            default:
                break;
        }
            
    }
    
    private function EmailTemplate($type){
        $html ='';
        switch($type){
            case 'reset_password_token':
                $html ='Dear Customer,[MSGBODY] Thanks ';
                break;
            
            case 'reset_password':
                $html ='Dear Customer,<br>[MSGBODY] Thanks ';
                break;
        }
        return $html;        
    }
     
    private function SendSMS($mobile, $content) {
         $msg =  "Dear Customer, $content Thanks and regards." ;  
        $datasms = array(
            "user" => "simplysafe",
            "password" => "Simplysafe1$$",
            "msisdn" => "+91" . $mobile,
            "sid" => "SIMPLY",
            "msg" => $msg,
            "fl" => 0,
            "gwid" => 2
        );
        $url = 'http://payonlinerecharge.com/vendorsms/pushsms.aspx';
        foreach ($datasms as $key => $value) {
            $fields .= $key . '=' . $value . '&';
        }
        rtrim($fields, '&');
        $post = curl_init();
        curl_setopt($post, CURLOPT_URL, $url);
        curl_setopt($post, CURLOPT_POST, count($data));
        curl_setopt($post, CURLOPT_POSTFIELDS, $fields);
        curl_setopt($post, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($post); 
        curl_close($post);
        return $result;
    }
    //SendEmail(array('email'=>$email,'subject'=>$subject,'from'=>$from,'msg'=>$msg,'sender'=>$sender));
    private function SendEmail($param){
        $email   = isset($param['email'])?$param['email']:NULL;
        $subject = isset($param['subject'])?$param['subject']:NULL;
        $from    = isset($param['from'])?$param['from']:NULL;
        $sender    = isset($param['sender'])?$param['sender']:'';
        $msg     = isset($param['msg'])?$param['msg']:NULL;
        $attachment     = isset($param['attachment'])?$param['attachment']:NULL;
        if(empty($email) || empty($subject) || empty($from) || empty($msg) ):
            return false;
        endif;
        $this->load->library('email');
        $config = array();
        $config['useragent'] = " ";
        $config['protocol'] = $this->Settings->protocol;
        $config['mailtype'] = "html";
        $config['crlf'] = "\r\n";
        $config['newline'] = "\r\n";
        if ($this->Settings->protocol == 'sendmail') {
            $config['mailpath'] = $this->Settings->mailpath;
        } elseif ($this->Settings->protocol == 'smtp') {
            $this->load->library('encrypt');
            $config['smtp_host'] = $this->Settings->smtp_host;
            $config['smtp_user'] = $this->Settings->smtp_user;
            $config['smtp_pass'] = $this->encrypt->decode($this->Settings->smtp_pass);
            $config['smtp_port'] = $this->Settings->smtp_port;
            if (!empty($this->Settings->smtp_crypto)) {
                $config['smtp_crypto'] = $this->Settings->smtp_crypto;
            }
        }
        $this->email->initialize($config);
        $this->email->subject($subject);
        $this->email->message($msg);
        if(!empty($attachment)):
           $this->email->attach($attachment);
        endif;
        $this->email->from($from, $sender); 
        $this->email->to($email);
      return  $this->email->send();
    }
}

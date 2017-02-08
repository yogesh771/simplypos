<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller { 
    private $APIKEY   ="435DSFSDFDSF743500909809DFSFJKJ234324534";
    function __construct(){
        parent::__construct();
        $this->load->model('auth_model');
        $this->load->model('companies_model'); 
        $this->load->library('form_validation');
    }
    function random_password( $length = 8 ) {
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-=+;:,.?";
        $password = substr( str_shuffle( $chars ), 0, $length );
        return $password;
    }
    function v2(){ 
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
    
    function ErrorMsg($key){
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
    
   
    
    function json_op($arr){
        $arr = is_array($arr)?$arr:array();
        echo @json_encode($arr);
        exit;
    }
    
    function getpasskey(){ 
       //-------------- Collecting Post value------------------//
       $merchant_phone  = $this->input->post('merchant_phone');
       $customer_name   = $this->input->post('customer_name');
       $customer_mobile = $this->input->post('customer_mobile');
       $comment         = $this->input->post('comment');
       $arr = array();
       $pass_key= md5($this->random_password(8));
       
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
                    if($this->companies_model->addCompany(array('name'=>$customer_name,'phone'=>$customer_mobile,'pass_key'=>$pass_key,'group_name'=>'customer'))):
                        $arr['success'] =  'POS KEY updated' ;
                        $arr['pos_key'] =   $pass_key;
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
}

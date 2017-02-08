<?php defined('BASEPATH') OR exit('No direct script access allowed');

/** 
 * Sandbox / Test Mode
 * -------------------------
 * TRUE means you'll be hitting PayPal's sandbox /Stripe test mode. FALSE means you'll be hitting the live servers.
 */
$config['TestMode'] = FALSE;

/* ***************** Paypal Settings ***************** */
/* 
 * PayPal API Version
 * ------------------
 * The library is currently using PayPal API version 98.0.  
 * You may adjust this value here and then pass it into the PayPal object when you create it within your scripts to override if necessary.
 */
$config['APIVersion'] = '98.0';

/*
 * PayPal Gateway API Credentials
 * ------------------------------
 * These are your PayPal API credentials for working with the PayPal gateway directly.
 * These are used any time you're using the parent PayPal class within the library.
 * 
 * We're using shorthand if/else statements here to set both Sandbox and Production values.
 * Your sandbox values go on the left and your live values go on the right.
 * 
 * You may obtain these credentials by logging into the following with your PayPal account: https://www.paypal.com/us/cgi-bin/webscr?cmd=_login-api-run
 */
$config['APIUsername'] = $config['TestMode'] ? '' : '';
$config['APIPassword'] = $config['TestMode'] ? '' : '';
$config['APISignature'] = $config['TestMode'] ? '' : '';


/* ***************** Stripe Keys ***************** */
/* 
 * Stripe API Keys
 * ------------------ 
 * You may obtain these by visiting account settings link and then API keys at https://dashboard.stripe.com/login
 */
$config['stripe_secret_key']			= $config['TestMode'] ? '' : ''; 
$config['stripe_publishable_key']		= $config['TestMode'] ? '' : ''; 

/* ***************** Authorize.net ***************** */
/* 
 * Authorize.net API Keys
 * ---------------------- 
 * You may obtain these by visiting account settings link and then API keys at https://authorize.net/
 */
$config['authorize'] = array(
    'api_login_id' => ($config['TestMode'] ? '' : ''),
    'api_transaction_key' => ($config['TestMode'] ? '' : ''),
    'api_url' => ($config['TestMode'] ? 'https://test.authorize.net/gateway/transact.dll' : 'https://secure.authorize.net/gateway/transact.dll')
    );

/* ***************** instamojo ***************** */
/* 
 * instamojo Keys
 * ----------------------  
 */

$config['instamojo'] = array(
    'API_KEY' => ($config['TestMode'] ? 'be133d3e73dbfae85b2a9fb47392648a' : 'be133d3e73dbfae85b2a9fb47392648a'),
    'AUTH_TOKEN' => ($config['TestMode'] ? '3565625b6923d2dfbe8fb10b5b585648' : '3565625b6923d2dfbe8fb10b5b585648'),
    'API_URL' => ($config['TestMode'] ? 'https://test.instamojo.com/api/1.1/' : 'https://www.instamojo.com/api/1.1/')
);
/* End of file payment_gateways.php */
/* Location: ./sma/config/payment_gateways.php */
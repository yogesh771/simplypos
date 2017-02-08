<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Cust extends MY_Controller
{

    function __construct()
    {
        parent::__construct();

        if (!$this->loggedIn) {
			
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
        if (!$this->Owner && !$this->Admin) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }
        $this->lang->load('notifications', $this->Settings->user_language);
        $this->load->library('form_validation');
        $this->load->model('cmt_model');

    }

    function index()
    {
redirect(base_url('sendsmsemail'));exit;

        if (!$this->Owner && !$this->Admin) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }
        $this->data['error'] = validation_errors() ? validation_errors() : $this->session->flashdata('error');
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('cust')));
        $meta = array('page_title' => lang('cust'), 'bc' => $bc);
        $this->page_construct('cust/index', $meta, $this->data);
    }

    function getNotifications()
    {
		
		
        $this->load->library('datatables');
        $this->datatables
            ->select("id, comment, date, from_date, till_date")
            ->from("notifications")
            //->where('notification', 1)
            ->add_column("Actions", "<div class=\"text-center\"><a href='" . site_url('notifications/edit/$1') . "' data-toggle='modal' data-target='#myModal' class='tip' title='" . lang("edit_notification") . "'><i class=\"fa fa-edit\"></i></a> <a href='#' class='tip po' title='<b>" . $this->lang->line("delete_notification") . "</b>' data-content=\"<p>" . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete' href='" . site_url('notifications/delete/$1') . "'>" . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i></a></div>", "id");
        $this->datatables->unset_column('id');
        echo $this->datatables->generate();
    }
	function custEmail(){
		$txt = '<table>
			<tr>
			  <td class="innerpadding borderbottom">
			    <table  align="left" border="0" cellpadding="0" cellspacing="0">  
			      <tr>
			        <td  style="padding: 0 20px 20px 0;">
			          <img src="'.$_REQUEST['logo'].'"alt="" />
			        </td>
			      </tr>
			    </table>
			    <table class="col380" align="left" border="0" cellpadding="0" cellspacing="0" style="width: 100%; max-width: 380px;">  
			      <tr>
			        <td>
			          <table width="100%" border="0" cellspacing="0" cellpadding="0">
			            <tr>
			              <td class="bodycopy">
			                '.$_REQUEST['message'].'
			              </td>
			            </tr>
			            <tr>
			              <td style="padding: 20px 0 0 0;">
			                <table class="buttonwrapper" border="0" cellspacing="0" cellpadding="0">
			                  <tr>
			                    <td class="" height="45">
			                      Thanks & Regards!
			                    </td>
			                  </tr>
			                </table>
			              </td>
			            </tr>
			          </table>
			        </td>
			      </tr>
			    </table>
			    
			  </td>
			</tr>
			</table>';
			$to = $_REQUEST['hiddencust'];
			$subject = $_REQUEST['subject'];
			$headers = "MIME-Version: 1.0" . "\r\n";
			$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
			$headers .="From: " . $_REQUEST['sender'] . "\r\n";
			
			mail($to,$subject,$txt,$headers);
		
	 $submit = $_POST["submit"];
//on submit button this function will fire to uploade image//
	if($submit){
		
		// A list of permitted file extensions
		$allowed = array('png', 'jpg', 'gif','zip');
		$root = realpath($_SERVER["DOCUMENT_ROOT"]);
		
		//use for online path for uploads//
		$root = $root."/uploads/";
		//use for online path for uploads//
		
		
		//$root= "".bloginfo('template_url')."http://amkwebsolutions.com/staging-url/aprendiendoexchange/\wp-content\plugins\wholesale\uploads\\";
		//$path="" . plugins_url( 'wholesale/uploads/', dirname(__FILE__) ) . "";
		
		
		//use for local path//
		//$root= $root."www\localhost\www\wordpressspanish\wp-content\plugins\wholesale\uploads";
	   //use for local path for now i have commented it we can use this for local//
	   
		if(isset($_FILES['file']['name']) && $_FILES['file']['error'] == 0){
		
		$extension = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
		
		if(!in_array(strtolower($extension), $allowed)){
		echo '{"status":"error"}';
		}
		if(move_uploaded_file($_FILES['file']['tmp_name'], $root.$_FILES['file']['name'])){
			
		
		}
		}
	}
	}
	
	
    function add()
    {

        $this->form_validation->set_rules('comment', lang("comment"), 'required|min_length[3]');

        if ($this->form_validation->run() == true) {
            $data = array(
                'comment' => $this->input->post('comment'),
                'from_date' => $this->input->post('from_date') ? $this->sma->fld($this->input->post('from_date')) : NULL,
                'till_date' => $this->input->post('to_date') ? $this->sma->fld($this->input->post('to_date')) : NULL,
                'scope' => $this->input->post('scope'),
            );
        } elseif ($this->input->post('submit')) {
            $this->session->set_flashdata('error', validation_errors());
            redirect("notifications");
        }

        if ($this->form_validation->run() == true && $this->cmt_model->addNotification($data)) {
            $this->session->set_flashdata('message', lang("notification_added"));
            redirect("notifications");
        } else {

            $this->data['comment'] = array('name' => 'comment',
                'id' => 'comment',
                'type' => 'textarea',
                'class' => 'form-control',
                'required' => 'required',
                'value' => $this->form_validation->set_value('comment'),
            );

            $this->data['error'] = validation_errors();
            $this->data['modal_js'] = $this->site->modal_js();
            $this->load->view($this->theme . 'notifications/add', $this->data);

        }
    }

    function edit($id = NULL)
    {
        if (!$this->Owner) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }

        if ($this->input->post('id')) {
            $id = $this->input->post('id');
        }

        $this->form_validation->set_rules('comment', lang("notifications"), 'required|min_length[3]');

        if ($this->form_validation->run() == true) {
            $data = array(
                'comment' => $this->input->post('comment'),
                'from_date' => $this->input->post('from_date') ? $this->sma->fld($this->input->post('from_date')) : NULL,
                'till_date' => $this->input->post('to_date') ? $this->sma->fld($this->input->post('to_date')) : NULL,
                'scope' => $this->input->post('scope'),
            );
        } elseif ($this->input->post('submit')) {
            $this->session->set_flashdata('error', validation_errors());
            redirect("notifications");
        }

        if ($this->form_validation->run() == true && $this->cmt_model->updateNotification($id, $data)) {

            $this->session->set_flashdata('message', lang("notification_updated"));
            redirect("notifications");

        } else {

            $comment = $this->cmt_model->getCommentByID($id);

            $this->data['comment'] = array('name' => 'comment',
                'id' => 'comment',
                'type' => 'textarea',
                'class' => 'form-control',
                'required' => 'required',
                'value' => $this->form_validation->set_value('comment', $comment->comment),
            );


            $this->data['notification'] = $comment;
            $this->data['id'] = $id;
            $this->data['modal_js'] = $this->site->modal_js();
            $this->data['error'] = validation_errors();
            $this->load->view($this->theme . 'notifications/edit', $this->data);

        }
    }

    function delete($id = NULL)
    {
        if (!$this->Owner) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }

        if ($this->cmt_model->deleteComment($id)) {
            echo lang("notifications_deleted");
        }
    }
	function sendNotification()
    {
		$this->data['error'] = 'test';
		$this->load->view($this->theme . 'notifications/messages', $this->data);
    }
}

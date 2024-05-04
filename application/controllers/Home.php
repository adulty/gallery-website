<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	
	public function __construct()
	{
		parent::__construct();
		$this->load->model('banner_model', 'banner');
		$this->load->model('identitas_model', 'identitas');
		$this->load->model('galery_model', 'galery');
		$this->load->model('forkin_model', 'forkin');
	}
	
	public function index()
	{
		$data['title']		= 'Beranda';
		$data['brand']		= $this->identitas->getData();
		$data['banners'] 	= $this->banner->getBanner();
		$data['galerysekolah'] = $this->galery->getData();
		$data['forkin']	= $this->forkin->getLastNews();
		$data['page']		= 'home/index';

		$this->load->view('front/layouts/main', $data);
	}
	
	function blogDetail($blogId)
	{
	    $this->load->library('form_validation');
	    $this->form_validation->set_rules('name','Name','required');
	    $this->form_validation->set_rules('comment','Comment','required');
	    
	    if($this->form_validation->run() == true) {
	        /* Save Comment to Database */
	    } else {
	        
	    }
	
	}

}

/* End of file Controllername.php */

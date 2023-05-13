<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		is_login();
		$this->load->model('admin_model', 'admin');
		$this->load->model('menu_model', 'menu');
		$this->load->model('banner_model', 'banner');
		$this->load->model('hubin_model', 'hubin');
		$this->load->model('berita_model', 'berita');
		$this->load->model('portfolio_model', 'portfolio');

	}

	public function index()
	{
		$data['title'] 			 = 'Admin';
		$data['page']				 = 'dashboard/index';
		$data['total_banner'] 	 = $this->banner->totalBanner();
		$data['total_hubin'] = $this->hubin->totalHubin();
		$data['total_berita'] 	 = $this->berita->countBerita();
		$data['total_portfolio'] 	 = $this->portfolio->countPortfolio();
      $data['pageChart'] 		 = '_chart';

		$this->load->view('back/layouts/main', $data);
	}


}

/* End of file Controllername.php */

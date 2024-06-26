<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Petugas extends CI_Controller {
	
	public function __construct()
	{
		parent::__construct();
		is_login();
		is_master();
		$this->load->model('menu_model', 'menu');
		$this->load->library('ion_auth');
	}

	public function index()
	{
		$data['title']		= 'Manajemen Petugas';
		$data['page']		= 'petugas/index';
		$data['petugas'] 	= $this->ion_auth->petugas()->result();

		$this->load->view('back/layouts/main', $data);
	}

	public function delete($id)
	{
		$this->ion_auth->delete_user($id);

		$this->session->set_flashdata('success', 'User Berhasil Dihapus.');
		$this->index();
	}

}

/* End of file Controllername.php */

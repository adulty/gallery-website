<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Profil extends CI_Controller {
	
	public function __construct()
	{
		parent::__construct();
		$this->load->model('hubin_model', 'hubin');
		$this->load->model('struktur_model', 'struktur');
	}
	
	public function deskripsi()
	{
		$data['title']		= 'Deskripsi TEFA';
		$data['page']		= 'profil/deskripsi';

		$this->load->view('front/layouts/main', $data);
	}

	public function visimisi()
	{
		$data['title']		= 'Visi & Misi';
		$data['page']		= 'profil/visimisi';

		$this->load->view('front/layouts/main', $data);
	}

	public function struktur()
	{
		$data['title']		= 'Struktur Organisasi';
		$data['page']		= 'profil/struktur';
		$data['struktur'] = $this->struktur->getData();

		$this->load->view('front/layouts/main', $data);
	}

	public function hubin()
	{
		$data['title']		= 'Hubungan Industri';
		$data['page']		= 'profil/hubin';
		$data['hubin'] = $this->hubin->getAllFasility();

		$this->load->view('front/layouts/main', $data);
	}

}

/* End of file Controllername.php */

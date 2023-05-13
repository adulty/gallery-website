<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Produk extends CI_Controller {
	
	public function __construct()
	{
		parent::__construct();
	}

	public function ppw()
	{
		$data['title']		= 'Perancangan & Pembuatan Website';
		$data['page']		= 'produk/ppw';

		$this->load->view('front/layouts/main', $data);
	}

	public function pb()
	{
		$data['title']		= 'Photobooth';
		$data['page']		= 'produk/pb';

		$this->load->view('front/layouts/main', $data);
	}

	public function icl()
	{
		$data['title']		= 'Instalasi CCTV & LAN';
		$data['page']		= 'produk/icl';

		$this->load->view('front/layouts/main', $data);
	}

}

/* End of file Controllername.php */

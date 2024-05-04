<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Galery extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		is_login();
		$this->load->model('menu_model', 'menu');
		$this->load->model('galery_model', 'galery');
	}

	public function index()
	{
		$data['title']		= 'Galery';
		$data['page']		= 'galery/index';
		$data['content'] 	= $this->galery->getData();

		$this->load->view('back/layouts/main', $data);
	}

	public function edit($id)
	{
		$this->form_validation->set_rules(
			'content',
			'Galery',
			'required',
			['required' => 'Kata sambutan tidak boleh kosong!']
		);

		if ($this->form_validation->run() == false) {
			$data['title']			= 'Ubah Galery';
			$data['page']			= 'galery/edit';
			$data['content']	= $this->galery->getData();
			$data['form_action']	= base_url('galery/edit/' . $id);
			$this->load->view('back/layouts/main', $data);
		} else {
			$data = [
				'content'	=> $this->input->post('content', true),
			];

			if (!empty($_FILES['photo']['name'])) {
				$upload 	 = $this->galery->uploadImage();

				if ($upload) {
					$galery = $this->galery->getData();

					if (file_exists('img/galerysekolah/' . $galery->photo) && $galery->photo) {
						unlink('img/galerysekolah/' . $galery->photo);
					}

					$data['photo'] = $upload;
				} else {
					redirect(base_url("galery/edit/$id"));
				}
			}

			$this->galery->updateData($id, $data);
			$this->session->set_flashdata('success', 'Galery Sekolah Berhasil Diupdate.');

			redirect(base_url('galery'));
		}
	}
}

/* End of file Controllername.php */

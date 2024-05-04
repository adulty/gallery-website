<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Forkin extends CI_Controller
{

	var $table = 'posts';
	var $id = 'id';
	var $select = ['*'];
	var $column_order = ['', 'title', '', 'is_active', 'date'];
	var $column_search = ['title', 'seo_title', 'content', 'photo', 'is_active', 'date'];

	public function __construct()
	{
		parent::__construct();
		is_login();
		$this->load->model('menu_model', 'menu');
		$this->load->model('my_model', 'my');
		$this->load->model('forkin_model', 'forkin');
		$this->load->helper('ci_helper');
	}

	public function index()
	{
		$data['title'] 	 = 'Data Forkin';
		$data['page'] 		 = 'forkin/index';
		$data['datatable'] = 'forkin/index-datatable';

		$this->load->view('back/layouts/main', $data);
	}

	public function ajax_list()
	{
		$list = $this->my->get_datatables();
		$data = [];
		$no = 1;
		foreach ($list as $li) {
			$row = [];
			$row[] = $no++;
			$row[] = $li->title;

			if ($li->photo) {
				$row[] = '<a href="' . base_url('img/informasiterkini/' . $li->photo) . '" target="_blank"><img src="' . base_url('img/informasiterkini/' . $li->photo) . '" class="img-responsive" style="max-height:150px; max-width:250px;"/></a>';
			} else {
				$row[] = '(No photo)';
			}

			$row[] = $li->is_active;
			$row[] = $li->date;

			$row[] =
				'<a class="btn btn-sm btn-warning text-white" href="' . base_url("index.php/forkin/edit/$li->id") . '" 
         title="Edit">
				<i class="fa fa-pencil-alt"></i>
			</a>

			<a class="btn btn-sm btn-danger" href="#" 
			title="Delete" onclick="delete_forkin(' . "'" . $li->id . "'" . ')">
				<i class="fa fa-trash"></i>
			</a>';
			$data[] = $row;
		}

		$output = array(
			'draw'            => $_POST['draw'],
			'recordsTotal'    => $this->my->count_all(),
			'recordsFiltered' => $this->my->count_filtered(),
			'data'            => $data,
		);

		echo json_encode($output);
	}

	public function add()
	{
		if (!$_POST) {
			$input = (object) $this->forkin->getDefaultValues();
		} else {
			$input = (object) $this->input->post(null, true);
		}

		$this->form_validation->set_rules(
			'title',
			'Judul',
			'required',
			[
				'required' => 'Judul informasi terkini tidak boleh kosong!'
			]
		);
		$this->form_validation->set_rules(
			'content',
			'Konten',
			'required',
			[
				'required' => 'Konten informasi terkini tidak boleh kosong!'
			]
		);

		if ($this->form_validation->run() == false) {
			$data['title'] 		= 'Tambah Forkin';
			$data['page']			= 'forkin/form';
			$data['form_action'] = base_url("index.php/forkin/add");
			$data['input'] 		= $input;
			$this->load->view('back/layouts/main', $data);
		} else {

			$data = [
				'title' 	=> $this->input->post('title', true),
				'seo_title' => slugify($this->input->post('title', true)),
				'content' 	=> $this->input->post('content', true),
				'is_active' => $this->input->post('is_active', true),
				'date' 		=> date('Y-m-d'),
			];

			if (!empty($_FILES['photo']['name'])) {
				$imageName = url_title($data['title'], '-', true) . '-' . date('YmdHis');
				$upload = $this->forkin->uploadImage($imageName);
				$this->_create_thumbs($upload);
				$data['photo'] = $upload;
			}

			$this->forkin->insert($data);
			$this->session->set_flashdata('success', 'Informasi Terkini Berhasil Ditambahkan.');

			redirect(base_url('index.php/forkin'));
		}
	}

	public function edit($id)
	{
		if (!$_POST) {
			$input = (object) $this->forkin->getDataById($id);
		} else {
			$input = (object) $this->input->post(null, true);
		}

		$this->form_validation->set_rules(
			'title',
			'Judul',
			'required',
			[
				'required' => 'Judul informasi terkini tidak boleh kosong!'
			]
		);
		$this->form_validation->set_rules(
			'content',
			'Konten',
			'required',
			[
				'required' => 'Konten informasi terkini tidak boleh kosong!'
			]
		);

		if ($this->form_validation->run() == false) {
			$data['title']			= 'Ubah Forkin';
			$data['page']			= 'forkin/form';
			$data['input']			= $input;
			$data['form_action']	= base_url('index.php/forkin/edit/' . $id);

			$this->load->view('back/layouts/main', $data);
		} else {
			$data = [
				'title' 		=> $this->input->post('title', true),
				'seo_title' => slugify($this->input->post('title', true)),
				'content' 	=> $this->input->post('content'),
				'is_active' => $this->input->post('is_active', true),
				'date' 		=> date('Y-m-d'),
			];

			if (!empty($_FILES['photo']['name'])) {
				$imageName = url_title($data['name'], '-', true) . '-' . date('YmdHis');
				$upload = $this->forkin->uploadImage($imageName);
				$this->_create_thumbs($upload);

				if ($upload) {
					$forkin = $this->forkin->getDataById($id);

					if (file_exists('img/informasiterkini/' . $forkin->photo) && $forkin->photo) {
						unlink('img/informasiterkini/' . $forkin->photo);
						unlink('img/informasiterkini/thumbs/' . $forkin->photo);
					}

					$data['photo'] = $upload;
				} else {
					redirect(base_url("index.php/forkin/edit/$id"));
				}
			}

			$this->forkin->update($id, $data);
			$this->session->set_flashdata('success', 'Informasi Terkini Berhasil Diupdate.');

			redirect(base_url('index.php/forkin'));
		}
	}

	public function delete()
	{
		$id = $this->input->post('id', true);
		$forkin = $this->forkin->getDataById($id);

		if (file_exists('img/informasiterkini/' . $forkin->photo) && $forkin->photo) {
			unlink('img/informasiterkini/' . $forkin->photo);
			unlink('img/informasiterkini/thumbs/' . $forkin->photo);
		}

		$this->forkin->delete($id);
		echo json_encode(["status" => TRUE]);
	}

	public function _create_thumbs($file_name)
	{
		$config = [
			// Thumbnail Image
			[
				'image_library'	=> 'GD2',
				'source_image'		=> './img/informasiterkini/' . $file_name,
				'maintain_ratio'	=> TRUE,
				'width'				=> 350,
				'height'				=> 200,
				'new_image'			=> './img/informasiterkini/thumbs/' . $file_name
			]
		];

		$this->load->library('image_lib', $config[0]);

		foreach ($config as $item) {
			$this->image_lib->initialize($item);

			if (!$this->image_lib->resize()) {
				return false;
			}

			$this->image_lib->clear();
		}
	}
}

/* End of file Controllername.php */

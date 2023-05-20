<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Hubin extends CI_Controller {

	var $table = 'hubins';
	var $id = 'id';
	var $select = ['*'];
	var $column_order = ['', 'name', 'photo', 'website'];
	var $column_search = ['name', 'photo', 'website'];
	
	public function __construct()
	{
		parent::__construct();
		is_login();
		$this->load->model('menu_model', 'menu');
		$this->load->model('my_model', 'my');
		$this->load->model('hubin_model', 'hubin');
	}
	
	public function index()
	{
		$data['title'] 	 = 'Data Hubin';
      $data['page'] 		 = 'hubin/index';
		$data['datatable'] = 'hubin/index-datatable';
		
      $this->load->view('back/layouts/main', $data);
	}

	public function ajax_list()
   {
      $list = $this->my->get_datatables();
		$data = [];
		$no = 1;
      foreach($list as $li){
			$row = [];
			$row[] = $no++;
			$row[] = $li->name;

			if($li->photo){
            $row[] = '<a href="' . base_url('img/hubin/' . $li->photo).'" target="_blank"><img src="'.base_url('img/hubin/' . $li->photo) . '" class="img-responsive" style="max-height:150px; max-width:400px;"/></a>';
         }else{
            $row[] = '(No photo)';
			}
			$row[] = $li->website;
         $row[] = 
         '<a class="btn btn-sm btn-warning text-white" href="'.base_url("index.php/hubin/edit/$li->id").'" 
         title="Edit">
			<i class="fa fa-pencil-alt"></i></a>

			<a class="btn btn-sm btn-danger" href="#" 
			title="Delete" onclick="delete_hubin('."'".$li->id."'".')">
			<i class="fa fa-trash"></i></a>';
         $data[] = $row;
      }

      $output = [
         'draw'            => $_POST['draw'],
         'recordsTotal'    => $this->my->count_all(),
         'recordsFiltered' => $this->my->count_filtered(),
         'data'            => $data
      ];

      echo json_encode($output);
	}

	public function add()
	{
		if(!$_POST){
			$input = (object) $this->hubin->getDefaultValues();
		}else{
			$input = (object) $this->input->post(null, true);
		}

		$this->form_validation->set_rules('name', 'Nama','required',[
			'required' => 'Nama hubin tidak boleh kosong!'
			]
		);

		$this->form_validation->set_rules('website', 'Website','required',[
			'required' => 'Nama Website tidak boleh kosong!'
			]
		);

		if($this->form_validation->run() == false){
			$data['title'] 		= 'Tambah Hubin';
			$data['page']			= 'hubin/form';
			$data['form_action'] = base_url("index.php/hubin/add");
			$data['input'] 		= $input;
			$this->load->view('back/layouts/main', $data);
		}else{
			
			$data = [
				'name' => $this->input->post('name', true),
			];

			if(!empty($_FILES['photo']['name']['website'])){
				$imageName = url_title($data['name'], '-', true) . '-' . date('YmdHis');
				$websiteName = url_title($data['website'], '-', true) . '-' . date('YmdHis');
				$upload = $this->hubin->uploadImage($imageName,$websiteName);
				$data['photo'] = $upload;
			}
			
			$this->hubin->insert($data);
			$this->session->set_flashdata('success', 'Hubungan Industri Berhasil Ditambahkan.');

			redirect(base_url('index.php/hubin'));
		}
	}

	public function edit($id)
	{
		if(!$_POST){
			$input = (object) $this->hubin->getDataById($id);
		}else{
			$input = (object) $this->input->post(null, true);
		}

		$this->form_validation->set_rules('name', 'Nama','required',[
			'required' => 'Nama Hubungan Industri tidak boleh kosong!'
			]
		);
		$this->form_validation->set_rules('website', 'Website','required',[
			'required' => 'Nama Website tidak boleh kosong!'
			]
		);

		if($this->form_validation->run() == false){
			$data['title']			= 'Ubah Hubin';
			$data['page']			= 'hubin/form';
			$data['input']			= $input;
			$data['form_action']	= base_url('index.php/hubin/edit/' . $id);
			
			$this->load->view('back/layouts/main', $data);
		}else{
			$data = [
				'name' => $this->input->post('name', true),
				'website' => $this->input->post('website', true),
			];

			if(!empty($_FILES['photo']['name']['website'])){
				$imageName = url_title($data['name'], '-', true) . '-' . date('YmdHis');
				$websiteName = url_title($data['website'], '-', true) . '-' . date('YmdHis');
				$upload = $this->hubin->uploadImage($imageName,$websiteName);

				if($upload){
					$hubin = $this->hubin->getDataById($id);

					if(file_exists('img/hubin/' . $hubin->photo) && $hubin->photo){
						unlink('img/hubin/' . $hubin->photo);
					}
					
					$data['photo'] = $upload;
				}else{
					redirect(base_url("index.php/hubin/edit/$id"));
				}
			}

			$this->hubin->update($id, $data);
			$this->session->set_flashdata('success', 'Hubungan Industri Berhasil Diupdate.');

			redirect(base_url('index.php/hubin'));
		}
	}

	public function delete()
	{
		$id = $this->input->post('id', true);
		$hubin = $this->hubin->getDataById($id);

		if(file_exists('img/hubin/' . $hubin->photo) && $hubin->photo){
			unlink('img/hubin/' . $hubin->photo);
		}

		$this->hubin->delete($id);
		echo json_encode(["status" => TRUE]);
	}

}

/* End of file Controllername.php */

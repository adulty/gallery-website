<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Server_side extends CI_Controller {

   public function __construct()
   {
      parent::__construct();
      $this->load->model('My_model');
   }

   public function index()
   {
      $list = $this->My_model->get_datatables();
      $data = array();
      $no = $_POST['start'];

      foreach($list as $item){
         $no++;
         $row = array();
         $row[] = $no;
         $row[] = $item->name;
         $row[] = $item->position;
         $row[] = $item->office;
         $row[] = $item->extn;
         $row[] = $item->start_date;
         $row[] = $item->salary;

         $data[] = $row;
      }

      $output = array(
         "draw" => $_POST['draw'],
         "recordsTotal" => $this->My_model->count_all(),
         "recordsFiltered" => $this->My_model->count_filtered(),
         "data" => $data,
      );

      echo json_encode($output);
   }

}

/* End of file Server_side.php */

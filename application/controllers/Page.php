<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Page extends CI_Controller {
	
	public function __construct()
	{
		parent::__construct();
		$this->load->model('portfolio_model', 'portfolio');
	}

	public function index($page = null)
	{
		$data['title']			= 'Portfolio';
		$data['ports']			= $this->portfolio->getAllFolios($page);
		$data['total_rows']  = $this->portfolio->countPortfolio();
      $data['pagination']  = $this->portfolio->makePagination(
         base_url('index.php/list'), 2, $data['total_rows']
      );

      $data['page'] = 'portfolio/page';
      $this->load->view('front/layouts/main', $data);
	}

	public function baca($seo_title)
	{
		$portfolio = $this->portfolio->getDataBySeo($seo_title);

		if($portfolio){
			$data['title']		= 'Portfolio';
			$data['page']		= 'portfolio/page-detail';
			$data['portfolio']	= $portfolio;

			$this->load->view('front/layouts/main', $data);
		}else{
			redirect(base_url('home/index'));
		}

	}

}


/* End of file Controllername.php */

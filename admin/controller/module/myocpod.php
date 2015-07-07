<?php
class ControllerModuleMyocpod extends Controller {	
	public function index()
	{
		$this->load->model('myoc/pod');
		$this->model_myoc_pod->upgradeTable();
		$this->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'], 'SSL'));
	}

	public function install()
	{
		$this->load->model('myoc/pod');
		$this->model_myoc_pod->installTable();
	}

	public function uninstall()
	{
		$this->load->model('myoc/pod');
		$this->model_myoc_pod->uninstallTable();
	}
}
?>
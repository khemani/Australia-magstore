<?php
class ControllerPaymentCod extends Controller {
	protected function index() {
		$this->data['button_confirm'] = $this->language->get('button_confirm');
		$this->language->load('information/contact');
		$this->data['continue'] = $this->url->link('checkout/success');
		$this->data['entry_captcha'] = "Enter Below Text";
		
/*		if (isset($this->error['captcha'])) {
			$this->data['error_captcha'] = $this->error['captcha'];
		} else {
			$this->data['error_captcha'] = '';
		} 
		*/
		if (isset($this->request->post['captcha'])) {
			$this->data['captcha'] = $this->request->post['captcha'];
		} else {
			$this->data['captcha'] = '';
		}	  
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/cod.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/cod.tpl';
		} else {
			$this->template = 'default/template/payment/cod.tpl';
		}

		$this->render();
	}
	
	
	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}
	 
	public function confirm() {
		$this->load->model('checkout/order');
		 $this->language->load('information/contact');
		 	$json = array();
		 if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
                   $json['error']['captcha']  = $this->language->get('error_captcha');
                   $json['error']['warning']   = $this->language->get('error_captcha');
				    $json['message']['success']   = "No";
				   
		 }
		 else{
			 $json['message']['success']   = "Yes";	
			 
		 }
        if(!isset($json['error']['captcha']) )
		{
			$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('cod_order_status_id'));
			
		}
			
			
			$this->response->setOutput(json_encode($json));
	
		
		
		
		
		
		
	}
	
}
		 
?>
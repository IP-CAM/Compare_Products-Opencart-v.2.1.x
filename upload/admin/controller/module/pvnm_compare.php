<?php
class ControllerModulePvnmCompare extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/pvnm_compare');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('pvnm_compare', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('module/pvnm_compare', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['tab_settings'] = $this->language->get('tab_settings');
		$data['tab_help'] = $this->language->get('tab_help');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_width'] = $this->language->get('text_width');
		$data['text_height'] = $this->language->get('text_height');
		$data['text_limit'] = $this->language->get('text_limit');
		$data['text_symbols'] = $this->language->get('text_symbols');
		$data['text_pcs'] = $this->language->get('text_pcs');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_box'] = $this->language->get('entry_box');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
		$data['entry_model'] = $this->language->get('entry_model');
		$data['entry_reward'] = $this->language->get('entry_reward');
		$data['entry_stock'] = $this->language->get('entry_stock');
		$data['entry_weight'] = $this->language->get('entry_weight');
		$data['entry_dimensions'] = $this->language->get('entry_dimensions');
		$data['entry_rating'] = $this->language->get('entry_rating');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_attributes'] = $this->language->get('entry_attributes');
		$data['entry_tags'] = $this->language->get('entry_tags');
		$data['entry_price'] = $this->language->get('entry_price');
		$data['entry_tax'] = $this->language->get('entry_tax');
		$data['entry_button'] = $this->language->get('entry_button');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
   		);

   		$data['breadcrumbs'][] = array(
       		'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
   		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/pvnm_compare', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/pvnm_compare', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['pvnm_compare_status'])) {
			$data['pvnm_compare_status'] = $this->request->post['pvnm_compare_status'];
		} else {
			$data['pvnm_compare_status'] = $this->config->get('pvnm_compare_status');
		}

		if (isset($this->request->post['pvnm_compare_show_box'])) {
			$data['pvnm_compare_show_box'] = $this->request->post['pvnm_compare_show_box'];
		} else { 
			$data['pvnm_compare_show_box'] = $this->config->get('pvnm_compare_show_box');
		}

		if (isset($this->request->post['pvnm_compare_show_image'])) {
			$data['pvnm_compare_show_image'] = $this->request->post['pvnm_compare_show_image'];
		} else {
			$data['pvnm_compare_show_image'] = $this->config->get('pvnm_compare_show_image');
		}

		if (isset($this->request->post['pvnm_compare_width'])) {
			$data['pvnm_compare_width'] = $this->request->post['pvnm_compare_width'];
		} elseif ($this->config->get('pvnm_compare_width')) { 
			$data['pvnm_compare_width'] = $this->config->get('pvnm_compare_width');
		} else {
			$data['pvnm_compare_width'] = 100;
		}

		if (isset($this->request->post['pvnm_compare_height'])) {
			$data['pvnm_compare_height'] = $this->request->post['pvnm_compare_height'];
		} elseif ($this->config->get('pvnm_compare_height')) { 
			$data['pvnm_compare_height'] = $this->config->get('pvnm_compare_height');
		} else {
			$data['pvnm_compare_height'] = 100;
		}

		if (isset($this->request->post['pvnm_compare_show_manufacturer'])) {
			$data['pvnm_compare_show_manufacturer'] = $this->request->post['pvnm_compare_show_manufacturer'];
		} else {
			$data['pvnm_compare_show_manufacturer'] = $this->config->get('pvnm_compare_show_manufacturer');
		}

		if (isset($this->request->post['pvnm_compare_show_model'])) {
			$data['pvnm_compare_show_model'] = $this->request->post['pvnm_compare_show_model'];
		} else {
			$data['pvnm_compare_show_model'] = $this->config->get('pvnm_compare_show_model');
		}

		if (isset($this->request->post['pvnm_compare_show_reward'])) {
			$data['pvnm_compare_show_reward'] = $this->request->post['pvnm_compare_show_reward'];
		} else {
			$data['pvnm_compare_show_reward'] = $this->config->get('pvnm_compare_show_reward');
		}

		if (isset($this->request->post['pvnm_compare_show_stock'])) {
			$data['pvnm_compare_show_stock'] = $this->request->post['pvnm_compare_show_stock'];
		} else {
			$data['pvnm_compare_show_stock'] = $this->config->get('pvnm_compare_show_stock');
		}

		if (isset($this->request->post['pvnm_compare_show_weight'])) {
			$data['pvnm_compare_show_weight'] = $this->request->post['pvnm_compare_show_weight'];
		} else {
			$data['pvnm_compare_show_weight'] = $this->config->get('pvnm_compare_show_weight');
		}

		if (isset($this->request->post['pvnm_compare_show_dimensions'])) {
			$data['pvnm_compare_show_dimensions'] = $this->request->post['pvnm_compare_show_dimensions'];
		} else {
			$data['pvnm_compare_show_dimensions'] = $this->config->get('pvnm_compare_show_dimensions');
		}

		if (isset($this->request->post['pvnm_compare_show_rating'])) {
			$data['pvnm_compare_show_rating'] = $this->request->post['pvnm_compare_show_rating'];
		} else {
			$data['pvnm_compare_show_rating'] = $this->config->get('pvnm_compare_show_rating');
		}

		if (isset($this->request->post['pvnm_compare_show_description'])) {
			$data['pvnm_compare_show_description'] = $this->request->post['pvnm_compare_show_description'];
		} else {
			$data['pvnm_compare_show_description'] = $this->config->get('pvnm_compare_show_description');
		}

		if (isset($this->request->post['pvnm_compare_show_description_limit'])) {
			$data['pvnm_compare_show_description_limit'] = $this->request->post['pvnm_compare_show_description_limit'];
		} else {
			$data['pvnm_compare_show_description_limit'] = $this->config->get('pvnm_compare_show_description_limit');
		}

		if (isset($this->request->post['pvnm_compare_show_attributes'])) {
			$data['pvnm_compare_show_attributes'] = $this->request->post['pvnm_compare_show_attributes'];
		} else {
			$data['pvnm_compare_show_attributes'] = $this->config->get('pvnm_compare_show_attributes');
		}

		if (isset($this->request->post['pvnm_compare_show_attributes_limit'])) {
			$data['pvnm_compare_show_attributes_limit'] = $this->request->post['pvnm_compare_show_attributes_limit'];
		} else {
			$data['pvnm_compare_show_attributes_limit'] = $this->config->get('pvnm_compare_show_attributes_limit');
		}

		if (isset($this->request->post['pvnm_compare_show_tags'])) {
			$data['pvnm_compare_show_tags'] = $this->request->post['pvnm_compare_show_tags'];
		} else {
			$data['pvnm_compare_show_tags'] = $this->config->get('pvnm_compare_show_tags');
		}

		if (isset($this->request->post['pvnm_compare_show_price'])) {
			$data['pvnm_compare_show_price'] = $this->request->post['pvnm_compare_show_price'];
		} else {
			$data['pvnm_compare_show_price'] = $this->config->get('pvnm_compare_show_price');
		}

		if (isset($this->request->post['pvnm_compare_show_tax'])) {
			$data['pvnm_compare_show_tax'] = $this->request->post['pvnm_compare_show_tax'];
		} else {
			$data['pvnm_compare_show_tax'] = $this->config->get('pvnm_compare_show_tax');
		}

		if (isset($this->request->post['pvnm_compare_show_button'])) {
			$data['pvnm_compare_show_button'] = $this->request->post['pvnm_compare_show_button'];
		} else {
			$data['pvnm_compare_show_button'] = $this->config->get('pvnm_compare_show_button');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/pvnm_compare.tpl', $data));
	}

	protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/pvnm_compare')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

		return !$this->error;
    }
}

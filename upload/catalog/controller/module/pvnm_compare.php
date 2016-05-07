<?php
class ControllerModulePvnmCompare extends Controller {
	public function index() {
		$this->load->language('module/pvnm_compare');

		$this->load->model('catalog/product');
		$this->load->model('tool/image');

    	$data['heading_title'] = $this->language->get('heading_title');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_model'] = $this->language->get('text_model');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_weight'] = $this->language->get('text_weight');
		$data['text_dimensions'] = $this->language->get('text_dimensions');
		$data['text_attributes'] = $this->language->get('text_attributes');
		$data['text_tags'] = $this->language->get('text_tags');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_compare'] = $this->language->get('text_compare');
    	$data['text_clear'] = $this->language->get('text_clear');
		$data['text_empty'] = $this->language->get('text_empty');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['button_remove_compare'] = $this->language->get('button_remove_compare');

        $data['compare'] = $this->url->link('product/compare');
		$data['show_box'] = $this->config->get('pvnm_compare_show_box');
		$data['show_button'] = $this->config->get('pvnm_compare_show_button');

        if (isset($this->session->data['compare']) && (count($this->session->data['compare']) > 0)){
			$data['products'] = array();

			$data['results'] = array();

			foreach ($this->session->data['compare'] as $product_id){
				$results[] = $this->model_catalog_product->getProduct($product_id);
			}

			foreach ($results as $result) {
				if ($result['image'] && $this->config->get('pvnm_compare_show_image') == 1) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('pvnm_compare_width'), $this->config->get('pvnm_compare_height'));
				} elseif ($this->config->get('pvnm_compare_show_image') == 1) {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('pvnm_compare_width'), $this->config->get('pvnm_compare_height'));
				} else {
					$image = false;
				}

				if ($result['manufacturer_id'] && $this->config->get('pvnm_compare_show_manufacturer') == 1) {
					$manufacturer = $result['manufacturer'];
					$manufacturer_href = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id']);
				} else {
					$manufacturer = false;
					$manufacturer_href = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id']);
				}

				if ($this->config->get('pvnm_compare_show_model') == 1) {
					$model = $result['model'];
				} else {
					$model = false;
				}

				if ($this->config->get('pvnm_compare_show_reward') == 1) {
					$reward = $result['reward'];
				} else {
					$reward = false;
				}

				if ($result['quantity'] <= 0 && $this->config->get('pvnm_compare_show_stock') == 1) {
					$stock = $result['stock_status'];
				} elseif ($this->config->get('config_stock_display') && $this->config->get('pvnm_compare_show_stock') == 1) {
					$stock = $result['quantity'];
				} elseif ($this->config->get('pvnm_compare_show_stock') == 1) {
					$stock = $this->language->get('text_instock');
				} else {
					$stock = false;
				}

				if ($this->config->get('pvnm_compare_show_weight') == 1) {
					$weight = $this->weight->format($result['weight'], $result['weight_class_id']);
				} else {
					$weight = false;
				}

				if ($this->config->get('pvnm_compare_show_dimensions') == 1) {
					$dimensions = $this->length->format($result['length'], $result['length_class_id']) . ' x ' . $this->length->format($result['width'], $result['length_class_id']) . ' x ' . $this->length->format($result['height'], $result['length_class_id']);
				} else {
					$dimensions = false;
				}

				if ($this->config->get('config_review_status') && $this->config->get('pvnm_compare_show_rating') == 1) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				if ($this->config->get('pvnm_compare_show_description') == 1) {
					if ($this->config->get('pvnm_compare_show_description_limit')) {
						$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('pvnm_compare_show_description_limit')) . '...';
					} else {
						//$description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')); // without html markup
						$description = html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8');
					}
				} else {
					$description = false;
				}

				$attributes = array();

				if ($this->config->get('pvnm_compare_show_attributes') == 1) {
					$attribute_groups = $this->model_catalog_product->getProductAttributes($result['product_id']);

					$num = 1;

					foreach ($attribute_groups as $attribute_group) {
						foreach ($attribute_group['attribute'] as $attribute) {
							if ($num <= $this->config->get('pvnm_compare_show_attributes_limit')) {
								$attributes[] = $attribute;
							}

							$num++;
						}
					}
				} else {
					$attributes = false;
				}

				$tags = array();

				if ($result['tag'] && $this->config->get('pvnm_compare_show_tags') == 1) {
					$tag = explode(',', $result['tag']);

					foreach ($tag as $tag) {
						$tags[] = array(
							'tag'  => trim($tag),
							'href' => $this->url->link('product/search', 'tag=' . trim($tag))
						);
					}
				} else {
					$tags = false;
				}

				if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && $this->config->get('pvnm_compare_show_price') == 1) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special'] && $this->config->get('pvnm_compare_show_price') == 1) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax') && $this->config->get('pvnm_compare_show_tax') == 1) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				$data['products'][] = array(
					'product_id' 		=> $result['product_id'],
					'name'    	 		=> $result['name'],
					'href'    			=> $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'thumb'   	 		=> $image,
					'manufacturer' 		=> $manufacturer,
					'manufacturer_href' => $manufacturer_href,
					'model' 			=> $model,
					'reward'			=> $reward,
					'stock'				=> $stock,
					'weight'      		=> $weight,
					'dimensions'       	=> $dimensions,
					'rating'    		=> $rating,
					'description' 		=> $description,
					'attributes'    	=> $attributes,
					'tags'				=> $tags,
					'price'   	 		=> $price,
					'special' 	 		=> $special,
					'tax'       		=> $tax
				);
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pvnm_compare.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/pvnm_compare.tpl', $data);
		} else {
			return $this->load->view('default/template/module/pvnm_compare.tpl', $data);
		}
	}

    public function remove() {
		$this->load->language('module/pvnm_compare');

		if (isset($this->session->data['compare'])) {
			$key = array_search($this->request->post['product_id'], $this->session->data['compare']);

			if ($key !== false) {
				unset($this->session->data['compare'][$key]);
			}
		}

		$json = array();

		if (count($this->session->data['compare']) == 0) {
			$json['success'] = $this->language->get('text_empty');
		}

		$json['count'] = count($this->session->data['compare']);

		$this->response->setOutput(json_encode($json));
    }

    public function clear() {
		$this->load->language('module/pvnm_compare');

		$this->session->data['compare'] = array();

		$json = array();

		$json['success'] = $this->language->get('text_empty');

		$this->response->setOutput(json_encode($json));
    }

	public function info() {
		$this->response->setOutput($this->index());
	}
}

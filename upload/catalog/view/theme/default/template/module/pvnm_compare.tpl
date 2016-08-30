<?php if (isset($products)) { ?>
	<div class="pvnm_compare">
	<h3><?php echo $heading_title; ?></h3>
	<div class="row">
	  <?php foreach ($products as $product) { ?>
	  <div class="product-layout_pvnm col-lg-3 col-md-3 col-sm-6 col-xs-12 pvnm_compare_<?php echo $product['product_id']; ?>">
		<div class="product-thumb transition">
		  <?php if ($product['thumb']) { ?>
			<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
		  <?php } ?>
		  <div class="caption">
			<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
			<ul class="list-unstyled">
			  <?php if ($product['manufacturer']) { ?>
				<li><?php echo $text_manufacturer; ?> <a href="<?php echo $product['manufacturer_href']; ?>"><?php echo $product['manufacturer']; ?></a></li>
			  <?php } ?>
			  <?php if ($product['model']) { ?>
				<li><?php echo $text_model; ?> <?php echo $product['model']; ?></li>
			  <?php } ?>
			  <?php if ($product['reward']) { ?>
				<li><?php echo $text_reward; ?> <?php echo $product['reward']; ?></li>
			  <?php } ?>
			  <?php if ($product['stock']) { ?>
				<li><?php echo $text_stock; ?> <?php echo $product['stock']; ?></li>
			  <?php } ?>
			  <?php if ($product['weight']) { ?>
				<li><?php echo $text_weight; ?> <?php echo $product['weight']; ?></li>
			  <?php } ?>
			  <?php if ($product['dimensions']) { ?>
				<li><?php echo $text_dimensions; ?> <?php echo $product['dimensions']; ?></li>
			  <?php } ?>
			</ul>
			<?php if ($product['rating']) { ?>
			<div class="rating">
			  <?php for ($i = 1; $i <= 5; $i++) { ?>
			  <?php if ($product['rating'] < $i) { ?>
			  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
			  <?php } else { ?>
			  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
			  <?php } ?>
			  <?php } ?>
			</div>
			<?php } ?>
			<?php if ($product['description']) { ?>
			  <p><?php echo $product['description']; ?></p>
			<?php } ?>
			<?php if ($product['attributes']) { ?>
				<table class="table table-bordered">
				   <thead>
					  <tr>
						<td colspan="2"><strong><?php echo $text_attributes; ?></strong></td>
					  </tr>
				   </thead>
				   <tbody>
					  <?php foreach ($product['attributes'] as $attribute) { ?>
					  <tr>
						<td><?php echo $attribute['name']; ?></td>
						<td><?php echo $attribute['text']; ?></td>
					  </tr>
					  <?php } ?>
				   </tbody>
				</table>
			<?php } ?>
			<?php if ($product['tags']) { ?>
				<p><?php echo $text_tags; ?>
				<?php for ($i = 0; $i < count($product['tags']); $i++) { ?>
				<?php if ($i < (count($product['tags']) - 1)) { ?>
					<a href="<?php echo $product['tags'][$i]['href']; ?>"><?php echo $product['tags'][$i]['tag']; ?></a>,
				<?php } else { ?>
					<a href="<?php echo $product['tags'][$i]['href']; ?>"><?php echo $product['tags'][$i]['tag']; ?></a>
				<?php } ?>
				<?php } ?>
				</p>
			<?php } ?>
			<?php if ($product['price']) { ?>
			<p class="price">
			  <?php if (!$product['special']) { ?>
			  <?php echo $product['price']; ?>
			  <?php } else { ?>
			  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
			  <?php } ?>
			  <?php if ($product['tax']) { ?>
			  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
			  <?php } ?>
			</p>
			<?php } ?>
		  </div>
		  <?php if ($show_button == 1) { ?>
		  <div class="button-group">
			<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
			<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
			<button type="button" data-toggle="tooltip" title="<?php echo $button_remove_compare; ?>" onclick="pvnm_compare_remove('<?php echo $product['product_id']; ?>');"><i class="fa fa-ban"></i></button>
		  </div>
		  <?php } ?>
		</div>
	  </div>
	  <?php } ?>
	  <div style="clear: both"></div>
	  <span class="col-sm-6"><a href="<?php echo $compare; ?>" id="go_compare" class="btn btn-primary col-sm-12"><?php echo $text_compare; ?></a></span>
	  <span class="col-sm-6"><a onclick="pvnm_compare_clear();" class="btn btn-danger col-sm-12"><?php echo $text_clear; ?></a></span>
	</div>
	</div>
<?php } else { ?>
	<div class="pvnm_compare" <?php if ($show_box != 1) { ?>style="display: none;"<?php } ?>>
		<h3><?php echo $heading_title; ?></h3>
		<div class="row">
			<div class="alert alert-info" style="margin-left: 10px; margin-right: 10px;"><i class="fa fa-info-circle"></i> <?php echo $text_empty; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
		</div>
	</div>
<?php } ?>
<style type="text/css">
	#column-left .product-layout_pvnm, #column-right .product-layout_pvnm {
		width: 100%;
	}
	.pvnm_compare {
		margin-bottom: 20px;
	}
</style>
<script type="text/javascript"><!--
$(document).ajaxSuccess(function(event, request, settings) {
	if (settings.url === 'index.php?route=product/compare/add') {
		$('.pvnm_compare').load('index.php?route=module/pvnm_compare/info .pvnm_compare > *').show('slow');
	}
});

function pvnm_compare_remove(product_id) {
	$.ajax({
		type: 'post',
		url: 'index.php?route=module/pvnm_compare/remove',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.alert').remove();

			$('.pvnm_compare_' + product_id).hide('slow', function() {
				$('.pvnm_compare_' + product_id).remove();

				if (json['success']) {
					<?php if ($show_box == 1) { ?>
						$('.pvnm_compare > .row').html('<div class="alert alert-info" style="margin-left: 10px; margin-right: 10px;"><i class="fa fa-info-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

						$('html, body').animate({ scrollTop: 0 }, 'slow');
					<?php } else { ?>
					$('.pvnm_compare').hide('slow', function() {
						$('.pvnm_compare').css('display', 'none');

						$('.pvnm_compare > .row').empty();
					});
					<?php } ?>
				}
			});
		}
	});
}

function pvnm_compare_clear() {
	$.ajax({
		type: 'post',
		url: 'index.php?route=module/pvnm_compare/clear',
		dataType: 'json',
		success: function(json) {
			$('.alert').remove();

			if (json['success']) {
				<?php if ($show_box == 1) { ?>
					$('.pvnm_compare > .row').html('<div class="alert alert-info" style="margin-left: 10px; margin-right: 10px;"><i class="fa fa-info-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('html, body').animate({ scrollTop: 0 }, 'slow');
				<?php } else { ?>
					$('.pvnm_compare').hide('slow', function() {
						$('.pvnm_compare').css('display', 'none');

						$('.pvnm_compare > .row').empty();
					});
				<?php } ?>
			}
		}
	});
}
//--></script>
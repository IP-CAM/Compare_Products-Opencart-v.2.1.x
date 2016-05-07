<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-pvnm_compare" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-success"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-pvnm_compare" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-settings" data-toggle="tab"><i class="fa fa-cog"></i> <?php echo $tab_settings; ?></a></li>
            <li><a href="#tab-help" data-toggle="tab"><i class="fa fa-comment"></i> <?php echo $tab_help; ?></a></li>
          </ul>
          <div class="tab-content">
		  <div class="tab-pane active" id="tab-settings">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_status) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_status" value="1" autocomplete="off" checked="checked"><?php echo $text_enabled; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_status" value="0" autocomplete="off"><?php echo $text_disabled; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_status" value="1" autocomplete="off"><?php echo $text_enabled; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_status" value="0" autocomplete="off" checked="checked"><?php echo $text_disabled; ?></label>
                <?php } ?>
			  </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_box"><?php echo $entry_box; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_box) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_box" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_box" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_box" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_box" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_button"><?php echo $entry_button; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_button) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_button" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_button" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_button" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_button" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_image"><?php echo $entry_image; ?></label>
            <div class="col-sm-2">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_image) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_image" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_image" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_image" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_image" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
			<div class="col-sm-2">
			  <div class="input-group">
                <span class="input-group-addon"><?php echo $text_width; ?></span>
				<input type="text" name="pvnm_compare_width" value="<?php echo $pvnm_compare_width; ?>" placeholder="<?php echo $text_width; ?>" id="input-pvnm_compare_width" class="form-control" />
			    <span class="input-group-addon">px</span>
			  </div>
			</div>
			<div class="col-sm-2">
			  <div class="input-group">
                <span class="input-group-addon"><?php echo $text_height; ?></span>
				<input type="text" name="pvnm_compare_height" value="<?php echo $pvnm_compare_height; ?>" placeholder="<?php echo $text_height; ?>" id="input-pvnm_compare_height" class="form-control" />
			    <span class="input-group-addon">px</span>
			  </div>
			</div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_manufacturer"><?php echo $entry_manufacturer; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_manufacturer) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_manufacturer" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_manufacturer" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_manufacturer" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_manufacturer" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_model"><?php echo $entry_model; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_model) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_model" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_model" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_model" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_model" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_reward"><?php echo $entry_reward; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_reward) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_reward" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_reward" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_reward" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_reward" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_stock"><?php echo $entry_stock; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_stock) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_stock" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_stock" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_stock" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_stock" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_weight"><?php echo $entry_weight; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_weight) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_weight" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_weight" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_weight" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_weight" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_dimensions"><?php echo $entry_dimensions; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_dimensions) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_dimensions" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_dimensions" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_dimensions" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_dimensions" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_rating"><?php echo $entry_rating; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_rating) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_rating" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_rating" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_rating" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_rating" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_description"><?php echo $entry_description; ?></label>
            <div class="col-sm-2">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_description) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_description" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_description" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_description" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_description" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
			<div class="col-sm-2">
			  <div class="input-group">
                <span class="input-group-addon"><?php echo $text_limit; ?></span>
				<input type="text" name="pvnm_compare_show_description_limit" value="<?php echo $pvnm_compare_show_description_limit; ?>" placeholder="" id="input-pvnm_compare_show_description_limit" class="form-control" />
			    <span class="input-group-addon"><?php echo $text_symbols; ?></span>
			  </div>
			</div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_attributes"><?php echo $entry_attributes; ?></label>
            <div class="col-sm-2">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_attributes) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_attributes" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_attributes" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_attributes" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_attributes" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
			<div class="col-sm-2">
			  <div class="input-group">
                <span class="input-group-addon"><?php echo $text_limit; ?></span>
				<input type="text" name="pvnm_compare_show_attributes_limit" value="<?php echo $pvnm_compare_show_attributes_limit; ?>" placeholder="" id="input-pvnm_compare_show_attributes_limit" class="form-control" />
			    <span class="input-group-addon"><?php echo $text_pcs; ?></span>
			  </div>
			</div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_tags"><?php echo $entry_tags; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_tags) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_tags" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_tags" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_tags" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_tags" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_price"><?php echo $entry_price; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_price) { ?>
                <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_price" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				<label class="btn btn-info"><input type="radio" name="pvnm_compare_show_price" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_price" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				<label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_price" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			  </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvnm_compare_show_tax"><?php echo $entry_tax; ?></label>
            <div class="col-sm-10">
              <div class="btn-group" data-toggle="buttons">
                <?php if ($pvnm_compare_show_tax) { ?>
                  <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_tax" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
				          <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_tax" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                <?php } else { ?>
                  <label class="btn btn-info"><input type="radio" name="pvnm_compare_show_tax" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
				          <label class="btn btn-info active"><input type="radio" name="pvnm_compare_show_tax" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                <?php } ?>
			        </div>
            </div>
          </div>
		  </div>
		  <div class="tab-pane" id="tab-help">
  			<div class="row">
          <div class="col-sm-10">
  				  <a href="mailto:p0v1n0m@gmail.com">p0v1n0m@gmail.com</a>
          </div>
  			</div>
		  </div>
		  </div>
		</form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>

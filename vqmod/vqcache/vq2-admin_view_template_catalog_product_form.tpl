<?php echo $header; ?>

<?php $this->language->load('module/myocpod'); ?>
				<style type="text/css">
				.button,
				.nowrap {
					white-space: nowrap;
				}
				.pod-list {
					margin: 5px 0;
				}
				.list tbody tr:hover td table.pod-list tbody tr:hover td {
					background-color: #FFFFCB;
				}
				.list tbody tr:hover td table tr td {
					background-color: #FFF;
				}
				.list tbody tr:hover td table thead tr td,
				.pod-list thead tr td {
					background-color: #FAFAFA;
				}
				</style>
				<?php $pod_row = 0; ?>
<div id="content">

  <div class="breadcrumb">

    <?php foreach ($breadcrumbs as $breadcrumb) { ?>

    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>

    <?php } ?>

  </div>

  <?php if ($error_warning) { ?>

  <div class="warning"><?php echo $error_warning; ?></div>

  <?php } ?>

  <div class="box">

    <div class="heading">

      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>

      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>

    </div>

    <div class="content">

      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a><a href="#tab-links"><?php echo $tab_links; ?></a><a href="#tab-attribute"><?php echo $tab_attribute; ?></a><a href="#tab-option"><?php echo $tab_option; ?></a><a href="#tab-profile"><?php echo $tab_profile; ?></a><a href="#tab-discount"><?php echo $tab_discount; ?></a><a href="#tab-special"><?php echo $tab_special; ?></a><a href="#tab-image"><?php echo $tab_image; ?></a><a href="#tab-reward"><?php echo $tab_reward; ?></a><a href="#tab-design"><?php echo $tab_design; ?></a></div>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

        <div id="tab-general">

          <div id="languages" class="htabs">

            <?php foreach ($languages as $language) { ?>

            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>

            <?php } ?>

          </div>

          <?php foreach ($languages as $language) { ?>

          <div id="language<?php echo $language['language_id']; ?>">

            <table class="form">
            
               
            <tr>

              <td><?php echo $entry_product_type; ?></td>

              <td><select name="product_type">
                

                  <?php if ($product_type==1) { ?>
                  <option value="0" >Select Product Type</option>
                  <option value="1" selected="selected"><?php echo $text_magazine; ?></option>
                  <option value="2"><?php echo $text_journals; ?></option>

                  <?php } elseif($product_type==2) { ?>
                  <option value="0" >Select Product Type</option>

                  <option value="1"><?php echo $text_magazine; ?></option>

                  <option value="2" selected="selected"><?php echo $text_journals; ?></option>

                  <?php } 
                   else
                   {
                   ?>
                      <option value="0" selected="selected">Select Product Type</option>
                      <option value="1"><?php echo $text_magazine; ?></option>
                      <option value="2" ><?php echo $text_journals; ?></option>
                   
                   <?php
             }
                  
                  ?>

                </select></td>

            </tr>

              <tr>

                <td><span class="required">*</span> <?php echo $entry_name; ?></td>

                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" />

                  <?php if (isset($error_name[$language['language_id']])) { ?>

                  <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>

                  <?php } ?></td>

              </tr>

              <tr>

                <td><?php echo $entry_meta_description; ?></td>

                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>

              </tr>

              <tr>

                <td><?php echo $entry_meta_keyword; ?></td>

                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>

              </tr>

              <tr>

                <td><?php echo $entry_description; ?></td>

                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea></td>

              </tr>

              <tr>

                <td><?php echo $entry_tag; ?></td>

                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>" size="80" /></td>

              </tr>

            </table>

          </div>

          <?php } ?>

        </div>

        <div id="tab-data">

          <table class="form">

            <tr>

              <td><span class="required">*</span> <?php echo $entry_model; ?></td>

              <td><input type="text" name="model" value="<?php echo $model; ?>" />

                <?php if ($error_model) { ?>

                <span class="error"><?php echo $error_model; ?></span>

                <?php } ?></td>

            </tr>

            <tr>

              <td><?php echo $entry_sku; ?></td>

              <td><input type="text" name="sku" value="<?php echo $sku; ?>" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_upc; ?></td>

              <td><input type="text" name="upc" value="<?php echo $upc; ?>" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_ean; ?></td>

              <td><input type="text" name="ean" value="<?php echo $ean; ?>" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_jan; ?></td>

              <td><input type="text" name="jan" value="<?php echo $jan; ?>" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_isbn; ?></td>

              <td><input type="text" name="isbn" value="<?php echo $isbn; ?>" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_mpn; ?></td>

              <td><input type="text" name="mpn" value="<?php echo $mpn; ?>" /></td>

            </tr>

            <tr>

            <tr>

              <td><?php echo $entry_periodicity ?></td>

              <td>
              <input type="text" name="periodicity" value="<?php echo $periodicity; ?>" />
              
             </tr>

            <tr>
            
            <tr>
            
             <tr>

              <td><?php echo $entery_mlanguage ?></td>

              <td>
              <input type="text" name="mlanguage" value="<?php echo $mlanguage; ?>" />
              
             </tr>

            <tr>
            
            <tr>

              <td><?php echo $entry_issues_per_year ?></td>

              <td><input type="text" name="issues_per_year" value="<?php echo $issues_per_year; ?>" /></td>

            </tr>
            
  
            
              <tr>

              <td><?php echo $entry_issn_print ?></td>

              <td><input type="text" name="issn_print" value="<?php echo $issn_print; ?>" /></td>

            </tr>
              <tr>

              <td><?php echo $entry_iisn_online ?></td>

              <td><input type="text" name="iisn_online" value="<?php echo $iisn_online; ?>" /></td>

            </tr>
              <tr>

              <td><?php echo $entry_marketed_by ?></td>

              <td><input type="text" name="marketed_by" value="<?php echo $marketed_by; ?>" /></td>

            </tr>
              <tr>

              <td><?php echo $entry_supplied_by ?></td>

              <td><input type="text" name="supplied_by" value="<?php echo $supplied_by; ?>" /></td>

            </tr>
            
            <tr>

              <td><?php echo $entery_estimated_delivery ?></td>

              <td><input type="text" class="date hasDatepicker" name="estimated_delivery" value="<?php echo $estimated_delivery; ?>" /></td>

            </tr>
            
              <tr>

              <td><?php echo $entery_remarks ?></td>

              <td><input type="text" name="remarks" value="<?php echo $remarks; ?>" /></td>

            </tr>
              <tr>

              <td><?php echo $entery_note ?></td>

              <td><input type="text" name="note" value="<?php echo $note; ?>" /></td>

            </tr>
             
            <tr>
            
               <tr>

              <td><?php echo $entry_origin ?></td>

              <td><input type="text" name="origin" value="<?php echo $origin; ?>" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_location; ?></td>

              <td><input type="text" name="location" value="<?php echo $location; ?>" /></td>

            </tr>

            <tr>

                <td><?php echo $entry_price; ?></td>

                <td><input type="text" name="price" value="<?php echo $price; ?>" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_tax_class; ?></td>

              <td><select name="tax_class_id">

                  <option value="0"><?php echo $text_none; ?></option>

                  <?php foreach ($tax_classes as $tax_class) { ?>

                  <?php if ($tax_class['tax_class_id'] == $tax_class_id) { ?>

                  <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>

                  <?php } else { ?>

                  <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>

                  <?php } ?>

                  <?php } ?>

                </select></td>

            </tr>

            <tr>

              <td><?php echo $entry_quantity; ?></td>

              <td><input type="text" name="quantity" value="20" size="2" readonly="readonly" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_minimum; ?></td>

              <td><input type="text" name="minimum" value="<?php echo $minimum; ?>" size="2" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_subtract; ?></td>

              <td><select name="subtract">

                  <?php if ($subtract) { ?>

                  <option value="0" selected="selected"><?php echo $text_no; ?></option>

                  <?php } else { ?>

                  <option value="0" selected="selected"><?php echo $text_no; ?></option>

                  <?php } ?>

                </select></td>

            </tr>

            <tr>

              <td><?php echo $entry_stock_status; ?></td>

              <td><select name="stock_status_id">

                  <?php foreach ($stock_statuses as $stock_status) { ?>

                  <?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>

                  <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>

                  <?php } else { ?>

                  <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>

                  <?php } ?>

                  <?php } ?>

                </select></td>

            </tr>

            <tr>

              <td><?php echo $entry_shipping; ?></td>

              <td><?php if ($shipping) { ?>

                <input type="radio" name="shipping" value="1" checked="checked" />

                <?php echo $text_yes; ?>

                <input type="radio" name="shipping" value="0" />

                <?php echo $text_no; ?>

                <?php } else { ?>

                <input type="radio" name="shipping" value="1" />

                <?php echo $text_yes; ?>

                <input type="radio" name="shipping" value="0" checked="checked" />

                <?php echo $text_no; ?>

                <?php } ?></td>

            </tr>

            <tr>

              <td><?php echo $entry_keyword; ?></td>

              <td><input type="text" name="keyword" value="<?php echo $keyword; ?>" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_image; ?></td>

              <td><div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" /><br />

                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />

                  <a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a></div></td>

            </tr>

            <tr>

              <td><?php echo $entry_date_available; ?></td>

              <td><input type="text" name="date_available" value="<?php echo $date_available; ?>" size="12" class="date" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_dimension; ?></td>

              <td><input type="text" name="length" value="<?php echo $length; ?>" size="4" />

                <input type="text" name="width" value="<?php echo $width; ?>" size="4" />

                <input type="text" name="height" value="<?php echo $height; ?>" size="4" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_length; ?></td>

              <td><select name="length_class_id">

                  <?php foreach ($length_classes as $length_class) { ?>

                  <?php if ($length_class['length_class_id'] == $length_class_id) { ?>

                  <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>

                  <?php } else { ?>

                  <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>

                  <?php } ?>

                  <?php } ?>

                </select></td>

            </tr>

            <tr>

              <td><?php echo $entry_weight; ?></td>

              <td><input type="text" name="weight" value="<?php echo $weight; ?>" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_weight_class; ?></td>

              <td><select name="weight_class_id">

                  <?php foreach ($weight_classes as $weight_class) { ?>

                  <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>

                  <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>

                  <?php } else { ?>

                  <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>

                  <?php } ?>

                  <?php } ?>

                </select></td>

            </tr>

            <tr>

              <td><?php echo $entry_status; ?></td>

              <td><select name="status">

                  <?php if ($status) { ?>

                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>

                  <option value="0"><?php echo $text_disabled; ?></option>

                  <?php } else { ?>

                  <option value="1"><?php echo $text_enabled; ?></option>

                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>

                  <?php } ?>

                </select></td>

            </tr>

            <tr>

              <td><?php echo $entry_sort_order; ?></td>

              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="2" /></td>

            </tr>

          </table>

        </div>

        <div id="tab-links">

          <table class="form">

            <tr>

              <td><?php echo $entry_manufacturer; ?></td>

              <td><input type="text" name="manufacturer" value="<?php echo $manufacturer ?>" /><input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" /></td>

            </tr>

            <tr>

              <td><?php echo $entry_category; ?></td>

              <td><input type="text" name="category" value="" /></td>

            </tr>

            <tr>

              <td>&nbsp;</td>

              <td><div id="product-category" class="scrollbox">

                  <?php $class = 'odd'; ?>

                  <?php foreach ($product_categories as $product_category) { ?>

                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                  <div id="product-category<?php echo $product_category['category_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_category['name']; ?><img src="view/image/delete.png" alt="" />

                    <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />

                  </div>

                  <?php } ?>

                </div></td>

            </tr> 

            <tr>

              <td><?php echo $entry_filter; ?></td>

              <td><input type="text" name="filter" value="" /></td>

            </tr>

            <tr>

              <td>&nbsp;</td>

              <td><div id="product-filter" class="scrollbox">

                  <?php $class = 'odd'; ?>

                  <?php foreach ($product_filters as $product_filter) { ?>

                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                  <div id="product-filter<?php echo $product_filter['filter_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_filter['name']; ?><img src="view/image/delete.png" alt="" />

                    <input type="hidden" name="product_filter[]" value="<?php echo $product_filter['filter_id']; ?>" />

                  </div>

                  <?php } ?>

                </div></td>

            </tr>                       

            <tr>

              <td><?php echo $entry_store; ?></td>

              <td><div class="scrollbox">

                  <?php $class = 'even'; ?>

                  <div class="<?php echo $class; ?>">

                    <?php if (in_array(0, $product_store)) { ?>

                    <input type="checkbox" name="product_store[]" value="0" checked="checked" />

                    <?php echo $text_default; ?>

                    <?php } else { ?>

                    <input type="checkbox" name="product_store[]" value="0" />

                    <?php echo $text_default; ?>

                    <?php } ?>

                  </div>

                  <?php foreach ($stores as $store) { ?>

                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                  <div class="<?php echo $class; ?>">

                    <?php if (in_array($store['store_id'], $product_store)) { ?>

                    <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />

                    <?php echo $store['name']; ?>

                    <?php } else { ?>

                    <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" />

                    <?php echo $store['name']; ?>

                    <?php } ?>

                  </div>

                  <?php } ?>

                </div></td>

            </tr>

            <tr>

              <td><?php echo $entry_download; ?></td>

              <td><input type="text" name="download" value="" /></td>

            </tr>			

            <tr>

              <td>&nbsp;</td>

              <td><div id="product-download" class="scrollbox">

                  <?php $class = 'odd'; ?>

                  <?php foreach ($product_downloads as $product_download) { ?>

                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                  <div id="product-download<?php echo $product_download['download_id']; ?>" class="<?php echo $class; ?>"> <?php echo $product_download['name']; ?><img src="view/image/delete.png" alt="" />

                    <input type="hidden" name="product_download[]" value="<?php echo $product_download['download_id']; ?>" />

                  </div>

                  <?php } ?>

                </div></td>

            </tr>

            <tr>

              <td><?php echo $entry_related; ?></td>

              <td><input type="text" name="related" value="" /></td>

            </tr>

            <tr>

              <td>&nbsp;</td>

              <td><div id="product-related" class="scrollbox">

                  <?php $class = 'odd'; ?>

                  <?php foreach ($product_related as $product_related) { ?>

                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                  <div id="product-related<?php echo $product_related['product_id']; ?>" class="<?php echo $class; ?>"> <?php echo $product_related['name']; ?><img src="view/image/delete.png" alt="" />

                    <input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />

                  </div>

                  <?php } ?>

                </div></td>

            </tr>

          </table>

        </div>

        <div id="tab-attribute">

          <table id="attribute" class="list">

            <thead>

              <tr>

                <td class="left"><?php echo $entry_attribute; ?></td>

                <td class="left"><?php echo $entry_text; ?></td>

                <td></td>

              </tr>

            </thead>

            <?php $attribute_row = 0; ?>

            <?php foreach ($product_attributes as $product_attribute) { ?>

            <tbody id="attribute-row<?php echo $attribute_row; ?>">

              <tr>

                <td class="left"><input type="text" name="product_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $product_attribute['name']; ?>" />

                  <input type="hidden" name="product_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $product_attribute['attribute_id']; ?>" /></td>

                <td class="left"><?php foreach ($languages as $language) { ?>

                  <textarea name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" cols="40" rows="5"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>

                  <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" /><br />

                  <?php } ?></td>

                <td class="left"><a onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>

              </tr>

            </tbody>

            <?php $attribute_row++; ?>

            <?php } ?>

            <tfoot>

              <tr>

                <td colspan="2"></td>

                <td class="left"><a onclick="addAttribute();" class="button"><?php echo $button_add_attribute; ?></a></td>

              </tr>

            </tfoot>

          </table>

        </div>

        <div id="tab-option">

          <div id="vtab-option" class="vtabs">

            <?php $option_row = 0; ?>

            <?php foreach ($product_options as $product_option) { ?>

            <a href="#tab-option-<?php echo $option_row; ?>" id="option-<?php echo $option_row; ?>"><?php echo $product_option['name']; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('#option-<?php echo $option_row; ?>').remove(); $('#tab-option-<?php echo $option_row; ?>').remove(); $('#vtabs a:first').trigger('click'); return false;" /></a>

            <?php $option_row++; ?>

            <?php } ?>

            <span id="option-add">

            <input name="option" value="" style="width: 130px;" />

            &nbsp;<img src="view/image/add.png" alt="<?php echo $button_add_option; ?>" title="<?php echo $button_add_option; ?>" /></span></div>

          <?php $option_row = 0; ?>

          <?php $option_value_row = 0; ?>

          <?php foreach ($product_options as $product_option) { ?>

          <div id="tab-option-<?php echo $option_row; ?>" class="vtabs-content">

            <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_id]" value="<?php echo $product_option['product_option_id']; ?>" />

            <input type="hidden" name="product_option[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />

            <input type="hidden" name="product_option[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />

            <input type="hidden" name="product_option[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />

            <table class="form">

              <tr>

                <td><?php echo $entry_required; ?></td>

                <td><select name="product_option[<?php echo $option_row; ?>][required]">

                    <?php if ($product_option['required']) { ?>

                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>

                    <?php } ?>

                  </select></td>

              </tr>

<?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
					       <input type="hidden" name="product_option[<?php echo $option_row; ?>][show_price_product]" value="<?php if ($product_option['show_price_product']) { echo $product_option['show_price_product'];}else{echo '1';}?>">
					
						 <input type="hidden" name="product_option[<?php echo $option_row; ?>][show_price_cart]" value="<?php if ($product_option['show_price_cart']) { echo $product_option['show_price_cart'];}else{echo '1';}?>">
					
					     <input type="hidden" name="product_option[<?php echo $option_row; ?>][show_final]" value="<?php if ($product_option['show_final']) { echo $product_option['show_final'];}else{echo '1';}?>">
					
					     <input type="hidden" name="product_option[<?php echo $option_row; ?>][flat_rate]" value="<?php if ($product_option['flat_rate']) { echo $product_option['flat_rate'];}else{echo '0';}?>">
					
					     <input type="hidden" name="product_option[<?php echo $option_row; ?>][table_style]" value="<?php if ($product_option['table_style']) { echo $product_option['table_style'];}else{echo 'h';}?>">
				
			            <input type="hidden" name="product_option[<?php echo $option_row; ?>][price_format]" value="<?php if ($product_option['price_format']) { echo $product_option['price_format'];}else{echo 'total';}?>">

					    <input type="hidden" name="product_option[<?php echo $option_row; ?>][qty_column]" value="<?php if ($product_option['qty_column']) { echo $product_option['qty_column'];}else{echo '0';}?>">

						<input type="hidden" name="product_option[<?php echo $option_row; ?>][qty_format]" value="<?php if ($product_option['qty_format']) { echo $product_option['qty_format'];}else{echo 'single';}?>">

					    <input type="hidden" name="product_option[<?php echo $option_row; ?>][stock_column]" value="<?php if ($product_option['stock_column']) { echo '0';}else{echo '0';}?>">
 						<input type="hidden" name="product_option[<?php echo $option_row; ?>][qty_cart]" value="<?php if ($product_option['qty_cart']) { echo $product_option['qty_cart'];}else{echo '1';}?>">

				<?php } ?>
              <?php if ($product_option['type'] == 'text') { ?>

              <tr>

                <td><?php echo $entry_option_value; ?></td>

                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" /></td>

              </tr>

              <?php } ?>

              <?php if ($product_option['type'] == 'textarea') { ?>

              <tr>

                <td><?php echo $entry_option_value; ?></td>

                <td><textarea name="product_option[<?php echo $option_row; ?>][option_value]" cols="40" rows="5"><?php echo $product_option['option_value']; ?></textarea></td>

              </tr>

              <?php } ?>

              <?php if ($product_option['type'] == 'file') { ?>

              <tr style="display: none;">

                <td><?php echo $entry_option_value; ?></td>

                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" /></td>

              </tr>

              <?php } ?>

              <?php if ($product_option['type'] == 'date') { ?>

              <tr>

                <td><?php echo $entry_option_value; ?></td>

                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="date" /></td>

              </tr>

              <?php } ?>

              <?php if ($product_option['type'] == 'datetime') { ?>

              <tr>

                <td><?php echo $entry_option_value; ?></td>

                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="datetime" /></td>

              </tr>

              <?php } ?>

              <?php if ($product_option['type'] == 'time') { ?>

              <tr>

                <td><?php echo $entry_option_value; ?></td>

                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="time" /></td>

              </tr>

              <?php } ?>

            </table>

            <?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>

            <table id="option-value<?php echo $option_row; ?>" class="list">

              <thead>

                <tr>

                  <td class="left"><?php echo $entry_option_value; ?></td>

                  <td class="right"><?php echo $entry_quantity; ?></td>
                   
                  <td class="right"><?php echo 'Total Issues' ?></td>

                  <td class="left"><?php echo $entry_subtract; ?></td>

                  <td class="right"><?php echo $entry_price; ?></td>

                  <td class="right"><?php echo $entry_option_points; ?></td>

                  <td class="right"><?php echo $entry_weight; ?></td>

                  <td></td>

                </tr>

              </thead>

              <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>

              <tbody id="option-value-row<?php echo $option_value_row; ?>">

                <tr>

                  <td class="left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]">

                      <?php if (isset($option_values[$product_option['option_id']])) { ?>

                      <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>

                      <?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>

                      <option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>

                      <?php } else { ?>

                      <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>

                      <?php } ?>

                      <?php } ?>

                      <?php } ?>

                    </select>

                    <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value="<?php echo $product_option_value['product_option_value_id']; ?>" /></td>

                  <td class="right"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="20" size="3" readonly="readonly" /></td>
                  
                   <td class="right"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][totalissues]" value="<?php echo $product_option_value['totalissues']; ?>" size="20" /></td>
                  
                  

                  <td class="left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]">

                      <?php if ($product_option_value['subtract']) { ?>

                      <option value="0" selected="selected"><?php echo $text_no; ?></option>

                      <?php } else { ?>

						<option value="0" selected="selected"><?php echo $text_no; ?></option>

                      <?php } ?>

                    </select></td>

                  <td class="right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]">
                      <?php if ($product_option_value['price_prefix'] == '=') { ?>

                      <option value="=" selected="selected">=</option>

                      <?php } else { ?>

                      <option value="="  >=</option>

                      <?php } ?>

                      <?php if ($product_option_value['price_prefix'] == '+') { ?>

                      <option value="+" selected="selected">+</option>

                      <?php } else { ?>

                      <option value="+">+</option>

                      <?php } ?>

                      <?php if ($product_option_value['price_prefix'] == '-') { ?>

                      <option value="-" selected="selected">-</option>

                      <?php } else { ?>

                      <option value="-">-</option>

                      <?php } ?>
                  

                    </select>

                    <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $product_option_value['price']; ?>"  size="5" id="option_datap<?php echo $option_value_row; ?>" /></td>

                  <td class="right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]">

                      <?php if ($product_option_value['points_prefix'] == '+') { ?>

                      <option value="+" selected="selected">+</option>

                      <?php } else { ?>

                      <option value="+">+</option>

                      <?php } ?>

                      <?php if ($product_option_value['points_prefix'] == '-') { ?>

                      <option value="-" selected="selected">-</option>

                      <?php } else { ?>

                      <option value="-">-</option>

                      <?php } ?>

                    </select>

                    <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $product_option_value['points']; ?>" size="5" /></td>

                  <td class="right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]">

                      <?php if ($product_option_value['weight_prefix'] == '+') { ?>

                      <option value="+" selected="selected">+</option>

                      <?php } else { ?>

                      <option value="+">+</option>

                      <?php } ?>

                      <?php if ($product_option_value['weight_prefix'] == '-') { ?>

                      <option value="-" selected="selected">-</option>

                      <?php } else { ?>

                      <option value="-">-</option>

                      <?php } ?>

                    </select>

                    <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" size="5" /></td>

                  <td class="left"><a onclick="$('#option-value-row<?php echo $option_value_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>

                </tr>

              </tbody>
<tr>
					<td colspan="7">
						<p><?php echo $tab_option . ' ' . $tab_discount; ?>:</p>
						<table class="list pod-list" id="pod<?php echo $option_value_row; ?>">
							<thead>
								<tr>
									<td class="left"><?php echo $entry_customer_group; ?></td>
									<td class="left nowrap"><?php echo $entry_quantity; ?><?php echo $this->language->get('entry_pod_quantity'); ?></td>
									<td class="left"><?php echo $this->language->get('entry_option_base_price'); ?></td>
									<td class="left"><?php echo $entry_price; ?></td>
									<td class="left"><?php echo $tab_special; ?>:</td>
									<td class="left"><?php echo $this->language->get('entry_option_base_points'); ?></td>
									<td class="left"><?php echo $entry_option_points; ?></td>
									<td class="left"><?php echo $entry_priority; ?></td>
									<td class="left"><?php echo $tab_special . " " . $entry_date_start; ?></td>
									<td class="left"><?php echo $tab_special . " " . $entry_date_end; ?></td>
									<td></td>
								</tr>
							</thead>
							<?php foreach($product_option_value['pods'] as $pod) { ?>
							<tbody id="pod-row<?php echo $pod_row; ?>">
								<tr>
									<input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][pod_id]" value="<?php echo $pod['pod_id']; ?>">
									<td class="left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][customer_group_id]">
											<?php foreach ($customer_groups as $customer_group) { ?>
											<option value="<?php echo $customer_group['customer_group_id']; ?>"<?php if($pod['customer_group_id'] == $customer_group['customer_group_id']) { ?> selected="selected"<?php } ?>><?php echo $customer_group['name']; ?></option>
											<?php } ?>
										</select></td>
									<td class="right"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][quantity]" value="1" size="2" readonly='readonly'></td>
									<td class="center"><input type="checkbox" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][option_base_price]" checked="checked"></td>
									<td class="right nowrap">
										<select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][price_prefix]">
											<option value="+"<?php if($pod['price_prefix'] == "+") { ?> selected="selected"<?php } ?>>+</option>
											<option value="-"<?php if($pod['price_prefix'] == "-") { ?> selected="selected"<?php } ?>>-</option>
											<option value="="<?php if($pod['price_prefix'] == "=") { ?> selected="selected"<?php } ?>>=</option>
											<option value="+%"<?php if($pod['price_prefix'] == "+%") { ?> selected="selected"<?php } ?>>+%</option>
											<option value="-%"<?php if($pod['price_prefix'] == "-%") { ?> selected="selected"<?php } ?>>-%</option>
										</select>
										<input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][price]" value="<?php echo $pod['price']; ?>" size="5"></td>
									<td class="right nowrap">
										<select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][special_prefix]">
											<option value="+"<?php if($pod['special_prefix'] == "+") { ?> selected="selected"<?php } ?>>+</option>
											<option value="-"<?php if($pod['special_prefix'] == "-") { ?> selected="selected"<?php } ?>>-</option>
											<option value="="<?php if($pod['special_prefix'] == "=") { ?> selected="selected"<?php } ?>>=</option>
											<option value="+%"<?php if($pod['special_prefix'] == "+%") { ?> selected="selected"<?php } ?>>+%</option>
											<option value="-%"<?php if($pod['special_prefix'] == "-%") { ?> selected="selected"<?php } ?>>-%</option>
										</select>
										<input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][special]" value="<?php echo $pod['special']; ?>" size="5"></td>
									<td class="center"><input type="checkbox" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][option_base_points]"<?php if(isset($pod['option_base_points']) && $pod['option_base_points']) { ?> checked="checked"<?php } ?>></td>
									<td class="right nowrap">
										<select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][points_prefix]">
											<option value="+"<?php if($pod['points_prefix'] == "+") { ?> selected="selected"<?php } ?>>+</option>
											<option value="-"<?php if($pod['points_prefix'] == "-") { ?> selected="selected"<?php } ?>>-</option>
											<option value="="<?php if($pod['points_prefix'] == "=") { ?> selected="selected"<?php } ?>>=</option>
											<option value="+%"<?php if($pod['points_prefix'] == "+%") { ?> selected="selected"<?php } ?>>+%</option>
											<option value="-%"<?php if($pod['points_prefix'] == "-%") { ?> selected="selected"<?php } ?>>-%</option>
										</select>
										<input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][points]" value="<?php echo $pod['points']; ?>" size="5"></td>
									<td class="right"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][priority]" value="<?php echo $pod['priority']; ?>" size="2"></td>
									<td class="left"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][date_start]" class="date" value="<?php echo $pod['date_start']; ?>" size="2"></td>
									<td class="left"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][pod][<?php echo $pod_row; ?>][date_end]" class="date" value="<?php echo $pod['date_end']; ?>" size="2"></td>
									<td class="left"><a onclick="$('#pod-row<?php echo $pod_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
								</tr>
								<?php $pod_row++; ?>
							</tbody>
							<?php } ?>
							<tbody class="tfoot">
								<tr>
									<td colspan="11" class="right"><a onclick="addOptionDiscount(<?php echo $option_row; ?>, <?php echo $option_value_row; ?>);" class="button"><span><?php echo $button_add_discount; ?></span></a></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
              <?php $option_value_row++; ?>

              <?php } ?>

              <tfoot>

                <tr>

                  <td colspan="6"></td>

                  <td class="left"><a onclick="addOptionValue('<?php echo $option_row; ?>');" class="button"><?php echo $button_add_option_value; ?></a></td>

                </tr>

              </tfoot>

            </table>

            <select id="option-values<?php echo $option_row; ?>" style="display: none;">

              <?php if (isset($option_values[$product_option['option_id']])) { ?>

              <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>

              <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>

              <?php } ?>

              <?php } ?>

            </select>

            <?php } ?>

          </div>

          <?php $option_row++; ?>

          <?php } ?>

        </div>

        <div id="tab-profile">

            <table class="list">

                <thead>

                    <tr>

                        <td class="left"><?php echo $entry_profile ?></td>

                        <td class="left"><?php echo $entry_customer_group ?></td>

                        <td class="left"></td>

                    </tr>

                </thead>

                <tbody>

                    <?php $profileCount = 0; ?>

                    <?php foreach ($product_profiles as $product_profile): ?>

                        <?php $profileCount++ ?>

                    

                        <tr id="profile-row<?php echo $profileCount ?>">

                            <td class="left">

                                <select name="product_profiles[<?php echo $profileCount ?>][profile_id]">

                                    <?php foreach ($profiles as $profile): ?>

                                        <?php if ($profile['profile_id'] == $product_profile['profile_id']): ?>

                                            <option value="<?php echo $profile['profile_id'] ?>" selected="selected"><?php echo $profile['name'] ?></option>

                                        <?php else: ?>

                                            <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>

                                        <?php endif; ?>

                                    <?php endforeach; ?>

                                </select>

                            </td>

                            <td class="left">

                                <select name="product_profiles[<?php echo $profileCount ?>][customer_group_id]">

                                    <?php foreach ($customer_groups as $customer_group): ?>

                                        <?php if ($customer_group['customer_group_id'] == $product_profile['customer_group_id']): ?>

                                            <option value="<?php echo $customer_group['customer_group_id'] ?>" selected="selected"><?php echo $customer_group['name'] ?></option>

                                        <?php else: ?>

                                            <option value="<?php echo $customer_group['customer_group_id'] ?>"><?php echo $customer_group['name'] ?></option>

                                        <?php endif; ?>

                                    <?php endforeach; ?>

                                </select>

                            </td>

                            <td class="left">

                                <a class="button" onclick="$('#profile-row<?php echo $profileCount ?>').remove()"><?php echo $button_remove ?></a>

                            </td>

                        </tr>

                    

                    <?php endforeach; ?>

                </tbody>

                <tfoot>

                    <tr>

                        <td colspan="2"></td>

                        <td class="left"><a onclick="addProfile()" class="button"><?php echo $button_add_profile ?></a></td>

                    </tr>

                </tfoot>

            </table>

        </div>

        <div id="tab-discount">

          <table id="discount" class="list">

            <thead>

              <tr>

                <td class="left"><?php echo $entry_customer_group; ?></td>

                <td class="right"><?php echo $entry_quantity; ?></td>

                <td class="right"><?php echo $entry_priority; ?></td>

                <td class="right"><?php echo $entry_price; ?></td>

                <td class="left"><?php echo $entry_date_start; ?></td>

                <td class="left"><?php echo $entry_date_end; ?></td>

                <td></td>

              </tr>

            </thead>

            <?php $discount_row = 0; ?>

            <?php foreach ($product_discounts as $product_discount) { ?>

            <tbody id="discount-row<?php echo $discount_row; ?>">

              <tr>

                <td class="left"><select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]">

                    <?php foreach ($customer_groups as $customer_group) { ?>

                    <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>

                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>

                    <?php } else { ?>

                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>

                    <?php } ?>

                    <?php } ?>

                  </select></td>

                <td class="right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" size="2" /></td>

                <td class="right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" size="2" /></td>

                <td class="right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" /></td>

                <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" class="date" /></td>

                <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" class="date" /></td>

                <td class="left"><a onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>

              </tr>

            </tbody>

            <?php $discount_row++; ?>

            <?php } ?>

            <tfoot>

              <tr>

                <td colspan="6"></td>

                <td class="left"><a onclick="addDiscount();" class="button"><?php echo $button_add_discount; ?></a></td>

              </tr>

            </tfoot>

          </table>

        </div>

        <div id="tab-special">

          <table id="special" class="list">

            <thead>

              <tr>

                <td class="left"><?php echo $entry_customer_group; ?></td>

                <td class="right"><?php echo $entry_priority; ?></td>

                <td class="right"><?php echo $entry_price; ?></td>

                <td class="left"><?php echo $entry_date_start; ?></td>

                <td class="left"><?php echo $entry_date_end; ?></td>

                <td></td>

              </tr>

            </thead>

            <?php $special_row = 0; ?>

            <?php foreach ($product_specials as $product_special) { ?>

            <tbody id="special-row<?php echo $special_row; ?>">

              <tr>

                <td class="left"><select name="product_special[<?php echo $special_row; ?>][customer_group_id]">

                    <?php foreach ($customer_groups as $customer_group) { ?>

                    <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>

                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>

                    <?php } else { ?>

                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>

                    <?php } ?>

                    <?php } ?>

                  </select></td>

                <td class="right"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" size="2" /></td>

                <td class="right"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" /></td>

                <td class="left"><input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" class="date" /></td>

                <td class="left"><input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" class="date" /></td>

                <td class="left"><a onclick="$('#special-row<?php echo $special_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>

              </tr>

            </tbody>

            <?php $special_row++; ?>

            <?php } ?>

            <tfoot>

              <tr>

                <td colspan="5"></td>

                <td class="left"><a onclick="addSpecial();" class="button"><?php echo $button_add_special; ?></a></td>

              </tr>

            </tfoot>

          </table>

        </div>

        <div id="tab-image">

          <table id="images" class="list">

            <thead>

              <tr>

                <td class="left"><?php echo $entry_image; ?></td>

                <td class="right"><?php echo $entry_sort_order; ?></td>

                <td></td>

              </tr>

            </thead>

            <?php $image_row = 0; ?>

            <?php foreach ($product_images as $product_image) { ?>

            <tbody id="image-row<?php echo $image_row; ?>">

              <tr>

                <td class="left"><div class="image"><img src="<?php echo $product_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" />

                    <input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="image<?php echo $image_row; ?>" />

                    <br />

                    <a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div></td>

                <td class="right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" size="2" /></td>

                <td class="left"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>

              </tr>

            </tbody>

            <?php $image_row++; ?>

            <?php } ?>

            <tfoot>

              <tr>

                <td colspan="2"></td>

                <td class="left"><a onclick="addImage();" class="button"><?php echo $button_add_image; ?></a></td>

              </tr>

            </tfoot>

          </table>

        </div>

        <div id="tab-reward">

          <table class="form">

            <tr>

              <td><?php echo $entry_points; ?></td>

              <td><input type="text" name="points" value="<?php echo $points; ?>" /></td>

            </tr>

          </table>

          <table class="list">

            <thead>

              <tr>

                <td class="left"><?php echo $entry_customer_group; ?></td>

                <td class="right"><?php echo $entry_reward; ?></td>

              </tr>

            </thead>

            <?php foreach ($customer_groups as $customer_group) { ?>

            <tbody>

              <tr>

                <td class="left"><?php echo $customer_group['name']; ?></td>

                <td class="right"><input type="text" name="product_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset($product_reward[$customer_group['customer_group_id']]) ? $product_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" /></td>

              </tr>

            </tbody>

            <?php } ?>

          </table>

        </div>

        <div id="tab-design">

          <table class="list">

            <thead>

              <tr>

                <td class="left"><?php echo $entry_store; ?></td>

                <td class="left"><?php echo $entry_layout; ?></td>

              </tr>

            </thead>

            <tbody>

              <tr>

                <td class="left"><?php echo $text_default; ?></td>

                <td class="left"><select name="product_layout[0][layout_id]">

                    <option value=""></option>

                    <?php foreach ($layouts as $layout) { ?>

                    <?php if (isset($product_layout[0]) && $product_layout[0] == $layout['layout_id']) { ?>

                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>

                    <?php } else { ?>

                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>

                    <?php } ?>

                    <?php } ?>

                  </select></td>

              </tr>

            </tbody>

            <?php foreach ($stores as $store) { ?>

            <tbody>

              <tr>

                <td class="left"><?php echo $store['name']; ?></td>

                <td class="left"><select name="product_layout[<?php echo $store['store_id']; ?>][layout_id]">

                    <option value=""></option>

                    <?php foreach ($layouts as $layout) { ?>

                    <?php if (isset($product_layout[$store['store_id']]) && $product_layout[$store['store_id']] == $layout['layout_id']) { ?>

                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>

                    <?php } else { ?>

                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>

                    <?php } ?>

                    <?php } ?>

                  </select></td>

              </tr>

            </tbody>

            <?php } ?>

          </table>

        </div>

      </form>

    </div>

  </div>

</div>

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 

<script type="text/javascript"><!--

<?php foreach ($languages as $language) { ?>

CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {

	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',

	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',

	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',

	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',

	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',

	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'

});

<?php } ?>

//--></script> 

<script type="text/javascript"><!--

$.widget('custom.catcomplete', $.ui.autocomplete, {

	_renderMenu: function(ul, items) {

		var self = this, currentCategory = '';

		

		$.each(items, function(index, item) {

			if (item.category != currentCategory) {

				ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');

				

				currentCategory = item.category;

			}

			

			self._renderItem(ul, item);

		});

	}

});



// Manufacturer

$('input[name=\'manufacturer\']').autocomplete({

	delay: 500,

	source: function(request, response) {

		$.ajax({

			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),

			dataType: 'json',

			success: function(json) {		

				response($.map(json, function(item) {

					return {

						label: item.name,

						value: item.manufacturer_id

					}

				}));

			}

		});

	}, 

	select: function(event, ui) {

		$('input[name=\'manufacturer\']').attr('value', ui.item.label);

		$('input[name=\'manufacturer_id\']').attr('value', ui.item.value);

	

		return false;

	},

	focus: function(event, ui) {

      return false;

   }

});



// Category

$('input[name=\'category\']').autocomplete({

	delay: 500,

	source: function(request, response) {

		$.ajax({

			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),

			dataType: 'json',

			success: function(json) {		

				response($.map(json, function(item) {

					return {

						label: item.name,

						value: item.category_id

					}

				}));

			}

		});

	}, 

	select: function(event, ui) {

		$('#product-category' + ui.item.value).remove();

		

		$('#product-category').append('<div id="product-category' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_category[]" value="' + ui.item.value + '" /></div>');



		$('#product-category div:odd').attr('class', 'odd');

		$('#product-category div:even').attr('class', 'even');

				

		return false;

	},

	focus: function(event, ui) {

      return false;

   }

});



$('#product-category div img').live('click', function() {

	$(this).parent().remove();

	

	$('#product-category div:odd').attr('class', 'odd');

	$('#product-category div:even').attr('class', 'even');	

});



// Filter

$('input[name=\'filter\']').autocomplete({

	delay: 500,

	source: function(request, response) {

		$.ajax({

			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),

			dataType: 'json',

			success: function(json) {		

				response($.map(json, function(item) {

					return {

						label: item.name,

						value: item.filter_id

					}

				}));

			}

		});

	}, 

	select: function(event, ui) {

		$('#product-filter' + ui.item.value).remove();

		

		$('#product-filter').append('<div id="product-filter' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_filter[]" value="' + ui.item.value + '" /></div>');



		$('#product-filter div:odd').attr('class', 'odd');

		$('#product-filter div:even').attr('class', 'even');

				

		return false;

	},

	focus: function(event, ui) {

      return false;

   }

});



$('#product-filter div img').live('click', function() {

	$(this).parent().remove();

	

	$('#product-filter div:odd').attr('class', 'odd');

	$('#product-filter div:even').attr('class', 'even');	

});



// Downloads

$('input[name=\'download\']').autocomplete({

	delay: 500,

	source: function(request, response) {

		$.ajax({

			url: 'index.php?route=catalog/download/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),

			dataType: 'json',

			success: function(json) {		

				response($.map(json, function(item) {

					return {

						label: item.name,

						value: item.download_id

					}

				}));

			}

		});

	}, 

	select: function(event, ui) {

		$('#product-download' + ui.item.value).remove();

		

		$('#product-download').append('<div id="product-download' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_download[]" value="' + ui.item.value + '" /></div>');



		$('#product-download div:odd').attr('class', 'odd');

		$('#product-download div:even').attr('class', 'even');

				

		return false;

	},

	focus: function(event, ui) {

      return false;

   }

});



$('#product-download div img').live('click', function() {

	$(this).parent().remove();

	

	$('#product-download div:odd').attr('class', 'odd');

	$('#product-download div:even').attr('class', 'even');	

});



// Related

$('input[name=\'related\']').autocomplete({

	delay: 500,

	source: function(request, response) {

		$.ajax({

			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),

			dataType: 'json',

			success: function(json) {		

				response($.map(json, function(item) {

					return {

						label: item.name,

						value: item.product_id

					}

				}));

			}

		});

	}, 

	select: function(event, ui) {

		$('#product-related' + ui.item.value).remove();

		

		$('#product-related').append('<div id="product-related' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_related[]" value="' + ui.item.value + '" /></div>');



		$('#product-related div:odd').attr('class', 'odd');

		$('#product-related div:even').attr('class', 'even');

				

		return false;

	},

	focus: function(event, ui) {

      return false;

   }

});



$('#product-related div img').live('click', function() {

	$(this).parent().remove();

	

	$('#product-related div:odd').attr('class', 'odd');

	$('#product-related div:even').attr('class', 'even');	

});

//--></script> 

<script type="text/javascript"><!--

var attribute_row = <?php echo $attribute_row; ?>;



function addAttribute() {

	html  = '<tbody id="attribute-row' + attribute_row + '">';

    html += '  <tr>';

	html += '    <td class="left"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';

	html += '    <td class="left">';

	<?php foreach ($languages as $language) { ?>

	html += '<textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" cols="40" rows="5"></textarea><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" /><br />';

    <?php } ?>

	html += '    </td>';

	html += '    <td class="left"><a onclick="$(\'#attribute-row' + attribute_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';

    html += '  </tr>';	

    html += '</tbody>';

	

	$('#attribute tfoot').before(html);

	

	attributeautocomplete(attribute_row);

	

	attribute_row++;

}



function attributeautocomplete(attribute_row) {

	$('input[name=\'product_attribute[' + attribute_row + '][name]\']').catcomplete({

		delay: 500,

		source: function(request, response) {

			$.ajax({

				url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),

				dataType: 'json',

				success: function(json) {	

					response($.map(json, function(item) {

						return {

							category: item.attribute_group,

							label: item.name,

							value: item.attribute_id

						}

					}));

				}

			});

		}, 

		select: function(event, ui) {

			$('input[name=\'product_attribute[' + attribute_row + '][name]\']').attr('value', ui.item.label);

			$('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').attr('value', ui.item.value);

			

			return false;

		},

		focus: function(event, ui) {

      		return false;

   		}

	});

}



$('#attribute tbody').each(function(index, element) {

	attributeautocomplete(index);

});

//--></script> 

<script type="text/javascript"><!--	

var option_row = <?php echo $option_row; ?>;



$('input[name=\'option\']').catcomplete({

	delay: 500,

	source: function(request, response) {

		$.ajax({

			url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),

			dataType: 'json',

			success: function(json) {

				response($.map(json, function(item) {

					return {

						category: item.category,

						label: item.name,

						value: item.option_id,

						type: item.type,

						option_value: item.option_value

					}

				}));

			}

		});

	}, 

	select: function(event, ui) {

		html  = '<div id="tab-option-' + option_row + '" class="vtabs-content">';

		html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';

		html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + ui.item.label + '" />';

		html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + ui.item.value + '" />';

		html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + ui.item.type + '" />';

		html += '	<table class="form">';

		html += '	  <tr>';

		html += '		<td><?php echo $entry_required; ?></td>';

		html += '       <td><select name="product_option[' + option_row + '][required]">';

		html += '	      <option value="1"><?php echo $text_yes; ?></option>';

		html += '	      <option value="0"><?php echo $text_no; ?></option>';

		html += '	    </select></td>';

		html += '     </tr>';

		

if (ui.item.type == 'select' || ui.item.type == 'radio' || ui.item.type == 'checkbox' || ui.item.type == 'image') {
				
				
				       html += '  <input type="hidden" name="product_option[' + option_row + '][show_price_product]" value="1">';
					
					  html += '   <input type="hidden" name="product_option[' + option_row + '][show_price_cart]" value="1">';
					
					   html += '   <input type="hidden" name="product_option[' + option_row + '][show_final]" value="1">';
					
					   html += '   <input type="hidden" name="product_option[' + option_row + '][flat_rate]" value="0">';
					
					    html += '  <input type="hidden" name="product_option[' + option_row + '][table_style]" value="h">';
			           
					   html += '  <input type="hidden" name="product_option[' + option_row + '][price_format]" value="total">';

					    html += ' <input type="hidden" name="product_option[' + option_row + '][qty_column]" value="0">';

						html += ' <input type="hidden" name="product_option[' + option_row + '][qty_format]" value="single">';

					    html += ' <input type="hidden" name="product_option[' + option_row + '][stock_column]" value="0">';
						
 						html += ' <input type="hidden" name="product_option[' + option_row + '][qty_cart]" value="1">';
				
			}
		if (ui.item.type == 'text') {

			html += '     <tr>';

			html += '       <td><?php echo $entry_option_value; ?></td>';

			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" /></td>';

			html += '     </tr>';

		}

		

		if (ui.item.type == 'textarea') {

			html += '     <tr>';

			html += '       <td><?php echo $entry_option_value; ?></td>';

			html += '       <td><textarea name="product_option[' + option_row + '][option_value]" cols="40" rows="5"></textarea></td>';

			html += '     </tr>';						

		}

		 

		if (ui.item.type == 'file') {

			html += '     <tr style="display: none;">';

			html += '       <td><?php echo $entry_option_value; ?></td>';

			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" /></td>';

			html += '     </tr>';			

		}

						

		if (ui.item.type == 'date') {

			html += '     <tr>';

			html += '       <td><?php echo $entry_option_value; ?></td>';

			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="date" /></td>';

			html += '     </tr>';			

		}

		

		if (ui.item.type == 'datetime') {

			html += '     <tr>';

			html += '       <td><?php echo $entry_option_value; ?></td>';

			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="datetime" /></td>';

			html += '     </tr>';			

		}

		

		if (ui.item.type == 'time') {

			html += '     <tr>';

			html += '       <td><?php echo $entry_option_value; ?></td>';

			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="time" /></td>';

			html += '     </tr>';			

		}

		

		html += '  </table>';

			

		if (ui.item.type == 'select' || ui.item.type == 'radio' || ui.item.type == 'checkbox' || ui.item.type == 'image') {

			html += '  <table id="option-value' + option_row + '" class="list">';

			html += '  	 <thead>'; 

			html += '      <tr>';

			html += '        <td class="left"><?php echo $entry_option_value; ?></td>';

			html += '        <td class="right"><?php echo $entry_quantity; ?></td>';
			html += '        <td class="right"><?php echo "Total Issues " ?></td>';

			html += '        <td class="left"><?php echo $entry_subtract; ?></td>';

			html += '        <td class="right"><?php echo $entry_price; ?></td>';

			html += '        <td class="right"><?php echo $entry_option_points; ?></td>';

			html += '        <td class="right"><?php echo $entry_weight; ?></td>';

			html += '        <td></td>';

			html += '      </tr>';

			html += '  	 </thead>';

			html += '    <tfoot>';

			html += '      <tr>';

			html += '        <td colspan="6"></td>';

			html += '        <td class="left"><a onclick="addOptionValue(' + option_row + ');" class="button"><?php echo $button_add_option_value; ?></a></td>';

			html += '      </tr>';

			html += '    </tfoot>';

			html += '  </table>';

            html += '  <select id="option-values' + option_row + '" style="display: none;">';

			

            for (i = 0; i < ui.item.option_value.length; i++) {

				html += '  <option value="' + ui.item.option_value[i]['option_value_id'] + '">' + ui.item.option_value[i]['name'] + '</option>';

            }



            html += '  </select>';			

			html += '</div>';	

		}

		

		$('#tab-option').append(html);

		

		$('#option-add').before('<a href="#tab-option-' + option_row + '" id="option-' + option_row + '">' + ui.item.label + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'#option-' + option_row + '\').remove(); $(\'#tab-option-' + option_row + '\').remove(); $(\'#vtab-option a:first\').trigger(\'click\'); return false;" /></a>');

		

		$('#vtab-option a').tabs();

		

		$('#option-' + option_row).trigger('click');		

		

		$('.date').datepicker({dateFormat: 'yy-mm-dd'});

		$('.datetime').datetimepicker({

			dateFormat: 'yy-mm-dd',

			timeFormat: 'h:m'

		});	

			

		$('.time').timepicker({timeFormat: 'h:m'});	

				

		option_row++;

		

		return false;

	},

	focus: function(event, ui) {

      return false;

   }

});

//--></script> 

<script type="text/javascript"><!--		

var option_value_row = <?php echo $option_value_row; ?>;



function addOptionValue(option_row) {	

	html  = '<tbody id="option-value-row' + option_value_row + '">';

	html += '  <tr>';

	html += '    <td class="left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" >';

	html += $('#option-values' + option_row).html();

	html += '    </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';

	html += '    <td class="right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" size="3" /></td>';
	html += '    <td class="right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][totalissues]" value="" size="20" /></td>';
 

	html += '    <td class="left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]">';

    html += '      <option value="0"  selected="selected"><?php echo $text_no; ?></option>';

	html += '    </select></td>';

	html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" >';

	html += '      <option value="+">+</option>';

	html += '      <option value="-">-</option>';
	html += '      <option value="=" selected="selected" >=</option>';

	html += '    </select>';

	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" size="5" id="option_datap'+option_value_row+'" /></td>';

	html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]">';

	html += '      <option value="+">+</option>';

	html += '      <option value="-">-</option>';

	html += '    </select>';

	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" size="5" /></td>';	

	html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]">';

	html += '      <option value="+">+</option>';

	html += '      <option value="-">-</option>';

	html += '    </select>';

	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" size="5" /></td>';

	html += '    <td class="left"><a onclick="$(\'#option-value-row' + option_value_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';

	html += '  </tr>';

	html += '</tbody>';

	

	$('#option-value' + option_row + ' tfoot').before(html);

				html =  '  <tr>';
				html += '    <td colspan="7">';
				html += '      <p><?php echo $tab_option . ' ' . $tab_discount; ?>:</p>';
				html += '      <table class="list pod-list" id="pod' + option_value_row + '">';
				html += '        <thead>';
				html += '          <tr>';
				html += '            <td class="left"><?php echo $entry_customer_group; ?></td>';
				html += '            <td class="left nowrap"><?php echo $entry_quantity; ?><?php echo addslashes($this->language->get('entry_pod_quantity')); ?>';
				html += '            <td class="left"><?php echo addslashes($this->language->get('entry_option_base_price')); ?></td>';
				html += '            <td class="left"><?php echo $entry_price; ?></td>';
				html += '            <td class="left"><?php echo $tab_special; ?>:</td>';
				html += '            <td class="left"><?php echo addslashes($this->language->get('entry_option_base_points')); ?></td>';
				html += '            <td class="left"><?php echo $entry_option_points; ?></td>';
				html += '            <td class="left"><?php echo $entry_priority; ?></td>';
				html += '            <td class="left"><?php echo $tab_special . " " . $entry_date_start; ?></td>';
				html += '            <td class="left"><?php echo $tab_special . " " . $entry_date_end; ?></td>';
				html += '            <td></td>';
				html += '          </tr>';
				html += '        </thead>';
				html += '        <tbody class="tfoot">';
				html += '          <tr>';
				html += '            <td colspan="11" class="right"> <span style=" color:#F00; "> Enter this field (mandatory) to maintain the layout --> <span> <a onclick="addOptionDiscount(' + option_row + ',' + option_value_row +');" class="button"><?php echo $button_add_discount; ?></span></a></td>';
				html += '          </tr>';
				html += '        </tbody>';
				html += '       </table>';
				html += '    </td>';
				html += '  </tr>';

				$('#option-value-row' + option_value_row).append(html);



	option_value_row++;

}

//--></script> 

<script type="text/javascript"><!--

var discount_row = <?php echo $discount_row; ?>;



var pod_row = <?php echo $pod_row; ?>;
				function addOptionDiscount(opt_row, ov_row) {
				     var valop = 'option_datap'+ov_row;
				     var opvalue =   	document.getElementById(valop).value;
					
					html  = '<tbody id="pod-row' + pod_row + '">';
					html += '  <tr>';
					html += '    <td class="left"><select name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][customer_group_id]">';
					<?php foreach ($customer_groups as $customer_group) { ?>
					html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
					<?php } ?>
					html += '    </select></td>';		
					html += '    <td class="right"><input type="text" name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][quantity]" value="1" siz e="2"></td>';
					html += '    <td class="center"><input type="checkbox" name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][option_base_price]" checked="checked" ></td>';
					html += '    <td class="right nowrap">';
					html += '        <select name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][price_prefix]">';
					html += '            <option value="+">+</option>';
					html += '            <option value="-">-</option>';
					html += '            <option value="="  selected="selected">=</option>';
					html += '            <option value="+%">+%</option>';
					html += '            <option value="-%">-%</option>';
					html += '        </select>';
					html += '        <input type="text" name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][price]" value="' + opvalue + '"  readonly="readonly" size="5"></td>';
					html += '    <td class="right nowrap">';
					html += '        <select name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][special_prefix]">';
					html += '            <option value="+">+</option>';
					html += '            <option value="-" selected="selected">-</option>';
					html += '            <option value="=">=</option>';
					html += '            <option value="+%">+%</option>';
					html += '            <option value="-%"  selected="selected">-%</option>';
					html += '        </select>';
					html += '        <input type="text" name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][special]" value="0" size="5" > </td>';
					html += '    <td class="center"><input type="checkbox" name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][option_base_points]"></td>';
					html += '    <td class="right nowrap">';
					html += '        <select name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][points_prefix]">';
					html += '            <option value="+">+</option>';
					html += '            <option value="-">-</option>';
					html += '            <option value="=">=</option>';
					html += '            <option value="+%">+%</option>';
					html += '            <option value="-%">-%</option>';
					html += '        </select>';
					html += '        <input type="text" name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][points]" value="0" size="5"></td>';
					html += '    <td class="right"><input type="text" name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][priority]" value="1" size="2"></td>';
					html += '    <td class="left"><input type="text" name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][date_start]" class="date" value="<?php $end=date('(Y-m-d'); ?>" size="2"></td>';
					html += '    <td class="left"><input type="text" name="product_option[' + opt_row + '][product_option_value][' + ov_row + '][pod][' + pod_row + '][date_end]" class="date" value="<?php $end=date('(Y + 5)-m-d');?>" size="2"></td>';
					html += '    <td class="left"><a onclick="$(\'#pod-row' + pod_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
					html += '  </tr>';
					html += '</tbody>';

					$('#pod' + ov_row + ' .tfoot').before(html);

					$('#pod-row' + pod_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});

					pod_row++;
				}
function addDiscount() {

	html  = '<tbody id="discount-row' + discount_row + '">';

	html += '  <tr>'; 

    html += '    <td class="left"><select name="product_discount[' + discount_row + '][customer_group_id]">';

    <?php foreach ($customer_groups as $customer_group) { ?>

    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';

    <?php } ?>

    html += '    </select></td>';		

    html += '    <td class="right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" size="2" /></td>';

    html += '    <td class="right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" size="2" /></td>';

	html += '    <td class="right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" /></td>';

    html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" class="date" /></td>';

	html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" class="date" /></td>';

	html += '    <td class="left"><a onclick="$(\'#discount-row' + discount_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';

	html += '  </tr>';	

    html += '</tbody>';

	

	$('#discount tfoot').before(html);

		

	$('#discount-row' + discount_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});

	

	discount_row++;

}

//--></script> 

<script type="text/javascript"><!--

var special_row = <?php echo $special_row; ?>;



function addSpecial() {

	html  = '<tbody id="special-row' + special_row + '">';

	html += '  <tr>'; 

    html += '    <td class="left"><select name="product_special[' + special_row + '][customer_group_id]">';

    <?php foreach ($customer_groups as $customer_group) { ?>

    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';

    <?php } ?>

    html += '    </select></td>';		

    html += '    <td class="right"><input type="text" name="product_special[' + special_row + '][priority]" value="" size="2" /></td>';

	html += '    <td class="right"><input type="text" name="product_special[' + special_row + '][price]" value="" /></td>';

    html += '    <td class="left"><input type="text" name="product_special[' + special_row + '][date_start]" value="" class="date" /></td>';

	html += '    <td class="left"><input type="text" name="product_special[' + special_row + '][date_end]" value="" class="date" /></td>';

	html += '    <td class="left"><a onclick="$(\'#special-row' + special_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';

	html += '  </tr>';

    html += '</tbody>';

	

	$('#special tfoot').before(html);

 

	$('#special-row' + special_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});

	

	special_row++;

}

//--></script> 

<script type="text/javascript"><!--

function image_upload(field, thumb) {

	$('#dialog').remove();

	

	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

	

	$('#dialog').dialog({

		title: '<?php echo $text_image_manager; ?>',

		close: function (event, ui) {

			if ($('#' + field).attr('value')) {

				$.ajax({

					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),

					dataType: 'text',

					success: function(text) {

						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');

					}

				});

			}

		},	

		bgiframe: false,

		width: 800,

		height: 400,

		resizable: false,

		modal: false

	});

};

//--></script> 

<script type="text/javascript"><!--

var image_row = <?php echo $image_row; ?>;



function addImage() {

    html  = '<tbody id="image-row' + image_row + '">';

	html += '  <tr>';

	html += '    <td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';

	html += '    <td class="right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" size="2" /></td>';

	html += '    <td class="left"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';

	html += '  </tr>';

	html += '</tbody>';

	

	$('#images tfoot').before(html);

	

	image_row++;

}

//--></script> 

<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 

<script type="text/javascript"><!--

$('.date').datepicker({dateFormat: 'yy-mm-dd'});

$('.datetime').datetimepicker({

	dateFormat: 'yy-mm-dd',

	timeFormat: 'h:m'

});

$('.time').timepicker({timeFormat: 'h:m'});

//--></script> 

<script type="text/javascript"><!--

$('#tabs a').tabs(); 

$('#languages a').tabs(); 

$('#vtab-option a').tabs();



var profileCount = <?php echo $profileCount ?>;



function addProfile() {

    profileCount++;

    

    var html = '';

    html += '<tr id="profile-row' + profileCount + '">';

    html += '  <td class="left">';

    html += '    <select name="product_profiles[' + profileCount + '][profile_id]">';

    <?php foreach ($profiles as $profile): ?>

    html += '      <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>';

    <?php endforeach; ?>

    html += '    </select>';

    html += '  </td>';

    html += '  <td class="left">';

    html += '    <select name="product_profiles[' + profileCount + '][customer_group_id]">';

    <?php foreach ($customer_groups as $customer_group): ?>

    html += '      <option value="<?php echo $customer_group['customer_group_id'] ?>"><?php echo $customer_group['name'] ?></option>';

    <?php endforeach; ?>

    html += '    <select>';

    html += '  </td>';

    html += '  <td class="left">';

    html += '    <a class="button" onclick="$(\'#profile-row' + profileCount + '\').remove()"><?php echo $button_remove ?></a>';

    html += '  </td>';

    html += '</tr>';

    

    $('#tab-profile table tbody').append(html);

}



<?php if (isset($this->request->get['product_id'])) { ?>

    function openbayLinkStatus(){

        var product_id = '<?php echo $this->request->get['product_id']; ?>';

        $.ajax({

            type: 'GET',

            url: 'index.php?route=extension/openbay/linkStatus&token=<?php echo $token; ?>&product_id='+product_id,

            dataType: 'html',

            success: function(data) {

                //add the button to nav

                $('<a href="#tab-openbay"><?php echo $tab_marketplace_links ?></a>').hide().appendTo("#tabs").fadeIn(1000);

                $('#tab-general').before(data);

                $('#tabs a').tabs();

            },

            failure: function(){



            },

            error: function() {



            }

        });

    }



    $(document).ready(function(){

        openbayLinkStatus();

    });

<?php } ?>



//--></script>



<?php echo $footer; ?>
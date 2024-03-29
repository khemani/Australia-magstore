<?php echo $header; ?>


<div class="container">
<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
<div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
	<?php $column_left  = trim($column_left);
	$column_right  = trim($column_right); ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-18'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-24'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
 
  <div class="product-info" style="margin-bottom:0px;">
  <div class="row">
    <?php if ($thumb || $images) { ?>
    <div class="left col-md-9 col-xs-24 imgthumb not-animated" data-animate="fadeInUp" data-delay="300" style="margin-top:3px;margin-bottom:40px;">
      <?php if ($thumb) { ?>
      <div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="swipebox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
      <?php } ?>
    
      <?php if ($images) { ?>
      
      <div class="image-additional" ><ul id="boss-image-additional">
        <?php foreach ($images as $image) { ?>
        <li><a rel="vdrelp" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="swipebox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
        <?php } ?>
		</ul>
		<a id="prev_image_additional" class="prev nav_thumb" href="javascript:void(0)" title="prev">Prev</a>
		<a id="next_image_additional" class="next nav_thumb" href="javascript:void(0)" title="next">Next</a>
      </div>
      <?php } ?>
    </div>
    <?php } ?>
    <div class="col-md-15 col-xs-24 not-animated" data-animate="fadeInUp" data-delay="300">

			
				<span xmlns:v="http://rdf.data-vocabulary.org/#">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<span typeof="v:Breadcrumb"><a rel="v:url" property="v:title" href="<?php echo $breadcrumb['href']; ?>" alt="<?php echo $breadcrumb['text']; ?>"></a></span>
				<?php } ?>				
				</span>	
			
				<span itemscope itemtype="http://schema.org/Product">
				<meta itemprop="url" content="<?php echo $breadcrumb['href']; ?>" >
				<meta itemprop="name" content="<?php echo $heading_title; ?>" >
				<meta itemprop="model" content="<?php echo $model; ?>" >
				<meta itemprop="manufacturer" content="<?php echo $manufacturer; ?>" >
				
				<?php if ($thumb) { ?>
				<meta itemprop="image" content="<?php echo $thumb; ?>" >
				<?php } ?>
				
				<?php if ($images) { foreach ($images as $image) {?>
				<meta itemprop="image" content="<?php echo $image['thumb']; ?>" >
				<?php } } ?>
				
				<span itemprop="offers" itemscope itemtype="http://schema.org/Offer">
				<meta itemprop="price" content="<?php echo ($special ? $special : $price); ?>" />
				<meta itemprop="priceCurrency" content="<?php echo $this->currency->getCode(); ?>" />
				<link itemprop="availability" href="http://schema.org/<?php echo (($quantity > 0) ? "InStock" : "OutOfStock") ?>" />
				</span>
				
				<span itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
				<meta itemprop="reviewCount" content="<?php echo $review_no; ?>">
				<meta itemprop="ratingValue" content="<?php echo $rating; ?>">
				</span></span>
            
			
      <h1><?php echo $heading_title; ?></h1>
	   <div class="review">
        <div class="review_img"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /></div>&nbsp;&nbsp;<div class="review_text"><a onclick="$('a[href=\'#tab-review\']').trigger('click');goToByScroll('tab-review');"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');goToByScroll('review-title');"><?php echo $text_write; ?></a></div>
        
      </div>
      <div class="description">
      
      
                
         <?php if ($periodicity) { ?>
        <span><strong><?php echo $text_periodicity; ?></strong></span><?php echo $periodicity; ?><br />
        <?php } ?>
     
        <?php if ($issues_per_year) { ?>
        <span><strong><?php echo $text_issues_per_year; ?></strong></span> <?php echo $issues_per_year; ?><br />
        <?php } ?>
        
           <?php if ($issn_print) { ?>
        <span><strong><?php echo 'ISSN Print :'; ?></strong></span> <?php echo $issn_print; ?><br />
        <?php } ?>
        
           <?php if ($iisn_online) { ?>
        <span><strong><?php echo 'ISSN Online :' ?></strong></span> <?php echo $iisn_online; ?><br />
        <?php } ?>
          
          <?php if ($location) { ?>
        <span><strong><?php echo 'Origin :' ?></strong></span> <?php echo $location; ?><br />
        <?php } ?>
        
         <?php if ($mlanguage) { ?>
        <span><strong><?php echo 'Language :' ?></strong></span> <?php echo $mlanguage; ?><br />
        <?php } ?>
        
        <?php if ($manufacturer) { ?>
        <span><strong><?php echo $text_manufacturer; ?></strong></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        
        <?php if ($marketed_by) { ?>
        <span><strong><?php echo 'Marketed By :'; ?></strong></span> <?php echo $marketed_by; ?><br />
        <?php } ?>
        
        <?php if ($supplied_by) { ?>
        <span><strong><?php echo 'Supplied By :'; ?></strong></span> <?php echo $supplied_by; ?><br/>
        <?php } ?>
        
         <?php if ($origin) { ?>
        <span><strong><?php echo $text_origin; ?></strong></span><?php echo $origin; ?><br />
        <?php } ?>
        
        <?php if ($estimated_delivery) { ?>
        <span><strong><?php echo 'Estimated Delivery :'; ?></strong></span> <?php echo $estimated_delivery; ?><br />
        <?php } ?>
        
         <?php if ($remarks) { ?>
        <span><strong><?php echo 'Remarks :'; ?></strong></span> <?php echo $remarks; ?><br />
        <?php } ?>
        
        <?php if ($note) { ?>
           <span><strong><?php echo 'Note :'; ?></strong></span> <?php echo $note; ?><br />
        <?php } ?>
        
       
        
        
        <!--<span><?php echo $text_model; ?></span> <?php echo $model; ?><br />-->
       <!-- <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />-->
        <!--<?php if ($reward) { ?>
        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        <span><?php echo $text_stock; ?></span><b class="stock"><?php echo $stock; ?></b>-->
	  </div>
     
      <?php if ($profiles): ?>
      <div class="profiles options">
          <h2><?php echo $text_payment_profile ?><span class="required"> *</span></h2>
          
		  <select class="profiles_sl"name="profile_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($profiles as $profile): ?>
              <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
              <?php endforeach; ?>
          </select>
		  
          <span id="profile-description"></span>
      </div>
      <?php endif; ?>
      <?php if ($options) { ?>
      <div class="options">
        <h2><?php // echo $text_option; ?></h2>
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
         
		  <select class="form-control" name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
<?php if($this->myocpod->showPod($option['product_option_id']) && $option['type'] != 'select') {
					echo $this->getChild('myoc/pod', array('product_option_id' => $option['product_option_id']));
					$option['option_value'] = array();
				} ?>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
		  
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
		<div class="boss_check option">
		<div class="box-check">
        <div id="option-<?php echo $option['product_option_id']; ?>" >
          <p><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></p>
<?php if($this->myocpod->showPod($option['product_option_id']) && $option['type'] != 'select') {
					echo $this->getChild('myoc/pod', array('product_option_id' => $option['product_option_id']));
					$option['option_value'] = array();
				} ?>
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
		</div>
		</div>
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
		<div class="boss_check option">
		<div class="box-check">
        <div id="option-<?php echo $option['product_option_id']; ?>">
          <span style=" font-size: 18px; font-weight:bold; color: hsl(0, 0%, 31%); "><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></span>
<?php if($this->myocpod->showPod($option['product_option_id']) && $option['type'] != 'select') {
					echo $this->getChild('myoc/pod', array('product_option_id' => $option['product_option_id']));
					$option['option_value'] = array();
				} ?>
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        </div>
		</div>
       
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <table class="option-image">
<?php if($this->myocpod->showPod($option['product_option_id']) && $option['type'] != 'select') {
					echo $this->getChild('myoc/pod', array('product_option_id' => $option['product_option_id']));
					$option['option_value'] = array();
				} ?>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <tr>
              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label></td>
            </tr>
            <?php } ?>
          </table>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <input type="text" class="text form-control" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <textarea class="form-control" name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option button_opt">
          <div class="title_text" style="margin-bottom:6px;"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <span class="button"><input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="btn btn-primary"></span>
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <input type="text" class="text datetime_box form-control" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <input type="text" class="text form-control" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <input type="text" class="text datetime_box form-control" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
        </div>
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
	  
    <div class="cart">
 
  <?php if( !isset($options) || empty($options)) { ?> 

	<?php if ($price) { ?>
		<div class="price_info">
        <?php if (!$special) { ?>
        <span class="price"><?php echo $price; ?></span>
        <?php } else { ?>
        <span class="price-new"><?php echo $special; ?></span><span class="price-old"><?php echo $price; ?></span> 
        <?php } ?>
        <?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
        <?php } ?>
        <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span>
        <?php } ?>
        <?php if ($discounts) { ?>
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
        </div>
        <?php } ?>
      </div>	  
	 <?php } ?>    
      
      <?php } ?>
      <?php if ($review_status) { ?>
     
	   <div class="quantily_info" style="margin-top:10px;">
			<table><tr><td style="width:206px !important;"><div class="title_text"><span style="margin-bottom:8px;display:block; font-size:18px;"><?php echo $text_qty; ?></span></div></td>
            <td><div class="select_number">                
				<input type="text" class="text form-control" name="quantity" size="2" value="<?php echo $minimum; ?>" />
                <button onclick="changeQty(1); return false;" class="increase">+</button>
                <button onclick="changeQty(0); return false;" class="decrease">-</button>
            </div></td></tr></table>
            <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
			<?php if ($minimum >1) { ?>
			<div class="minimum"><?php echo $text_minimum; ?></div>			
		<?php } ?>
        </div>			
      <?php } ?>	  
       <input type="button"  size="10"  id="button-cart" class="btn btn-cart" title="<?php echo $button_cart; ?>"  style="background:url(/image/data/brands/subsc.png) no-repeat;  border:none; min-height: 60px;    min-width: 130px;  " />
		<!--<div class="action">			
			<div class="compare"><a class="action-button" onclick="boss_addToCompare('<?php echo $product_id; ?>');" title="<?php echo $button_compare; ?>"><i class="fa fa-plus"></i><?php echo $button_compare; ?></a></div>
			<div class="wishlist"><a class="action-button" onclick="boss_addToWishList('<?php echo $product_id; ?>');" title="<?php echo $button_wishlist; ?>"><i class="fa fa-plus"></i><?php echo $button_wishlist; ?></a></div>
		</div>-->
       
		<div class="share"><!-- AddThis Button BEGIN -->
          <div class="addthis_default_style" style="float:left;"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
          <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> <table style="float:right; width:250px;"><tbody><tr><td style="width:100px;"><img src="/image/cache/data/brands/picture19-100x100.jpg"></td><td style="width:350px;" ><p align="justify">Your subscription will start with the next available issue. Kindly expect delivery in the next 4-6 weeks.</p></td></tr></tbody></table> 
          <!-- AddThis Button END --> 
        </div>
      </div>
        <div id="tabs" class="htabs not-animated" data-animate="fadeInUp" data-delay="300">
	<ul>
		<li><a href="#tab-description"><?php echo $tab_description; ?></a></li>
		<?php if ($attribute_groups) { ?><li>
			<a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
		</li><?php } ?>
		<?php if ($review_status) { ?><li>
			<a href="#tab-review"><?php echo $tab_review; ?></a>
		</li><?php } ?>
	</ul>
  </div>
   <h2 class="ta-header"><span><?php echo $tab_description; ?></span></h2>
  <div id="tab-description" class="tab-content not-animated" data-animate="fadeInUp" data-delay="300"><?php echo $description; ?></div>
  <?php if ($attribute_groups) { ?>
  <h2 class="ta-header"><span><?php echo $tab_attribute; ?></span></h2>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>
  <?php if ($review_status) { ?>
  <h2 class="ta-header"><span><?php echo $tab_review; ?></span></h2>
  <div id="tab-review" class="tab-content not-animated" data-animate="fadeInUp" data-delay="300">
    <div id="review"></div>
    <h2 id="review-title"><?php echo $text_write; ?></h2>
    <b><?php echo $entry_name; ?></b><br />
    <input class="form-control"type="text" name="name" value="" />
    
    <b><?php echo $entry_review; ?></b>
    <textarea class="form-control" name="text" cols="40" rows="8" ></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
    <br />
    <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp;<span><?php echo $entry_good; ?></span><br />
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input class="form-control captcha_text"type="text" name="captcha" value="" />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    
    <div class="buttons">
      <div class="left"><br/><a id="button-review" class="btn"><?php echo $button_continue; ?></a></div>
    </div>
  </div>
  <?php } ?>
  
  <?php if ($tags) { ?>
  <div class="tags not-animated" data-animate="fadeInUp" data-delay="300"><b><?php echo $text_tags; ?></b>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
    </div>
    
    
    
	</div>
  </div>

  
  <?php if ($products) { ?>
  <div id="tab-related" class="not-animated" data-animate="fadeInUp" data-delay="300">
   <h2 class="box-title"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</h2>
   <div class="box-content">
  <div class="list_carousel responsive" >
    <ul id="product_related" class="box-product"><?php foreach ($products as $product) { ?><li>
      <div class="relt_product">
	  <?php if ($product['thumb']) { ?>
        <div class="image"><a class="cs_img" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
		  <div class="caption">
		  <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>		  
		<?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
			<?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
		<?php } ?>
		 </div>
       <div class="cart"><a onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-cart"><?php echo $button_cart; ?></a></div>
	   <div class="compare"><a class="action-button" title="<?php echo $button_compare; ?>" onclick="boss_addToCompare('<?php echo  $product['product_id'];  ?>');"><i class="fa fa-plus"></i><?php echo $button_compare; ?></a></div>
		<div class="wishlist"><a class="action-button" title="<?php echo $button_wishlist; ?>" onclick="boss_addToWishList('<?php echo  $product['product_id']; ?>');"><i class="fa fa-plus"></i><?php echo $button_wishlist; ?></a></div>
       
		</div>
		</li><?php } ?></ul>
        <div class="clearfix"></div>
        <a id="prev_related" class="prev nav_thumb" href="javascript:void(0)" title="prev">Prev</a>
        <a id="next_related" class="next nav_thumb" href="javascript:void(0)" title="next">Next</a>
    </div>
    </div>
  </div>
  <?php } ?>
<script type="text/javascript"><!--
				$(document).ready(function() {
					$('select[name^="option"]').change(function(){
						if($(this).data('poid') != undefined) {
							$('*[data-podpoid="' + $(this).data('poid') + '"]').hide();
							if($(this).val() != "") {
								$('*[data-podsel="' + $(this).data('poid') + '"]').hide();
								$('*[data-podpovid="' + $(this).val() + '"]').show();
								<?php if($this->myocpod->isQtyCart($product_id)) { ?>
								if($("#podqty" + $(this).val()).length) {
									$(':input[name="quantity"]').val($("#podqty" + $(this).val()).val());
								}
								<?php } ?>
							} else {
								$('*[data-podsel="' + $(this).data('poid') + '"]').show();
							}
						}
					}).change();
					<?php if($this->myocpod->isQtyCart($product_id)) { ?>
					$(':input[name^="quantitypod"]').bind('input change keyup', function() {
						//console.log($(':input[type="hidden"]:not(:disabled)').val());
						$(':input[name="quantity"]').val($(this).val());
						$('input[name="option[' + $(this).data('cart-poid') + ']"]').attr("disabled", "disabled");
						$("#option-value-" + $(this).data('cart-povid')).attr("disabled", false);
					});
					<?php } ?>
				});
				//--></script>
  <?php echo $content_bottom; ?></div>
</div>
</div>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.carouFredSel-6.2.0-packed.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
	jQuery(function($) {
		$(".swipebox").swipebox();
	});
});

//--></script> 
<script type="text/javascript"><!--
function changeQty(increase) {
    var qty = parseInt($('.select_number').find("input").val());
    if ( !isNaN(qty) ) {
        qty = increase ? qty+1 : (qty > <?php echo $minimum; ?> ? qty-1 : <?php echo $minimum; ?>);
        $('.select_number').find("input").val(qty);
    }
}
$(window).load(function(){
    $('#boss-image-additional').carouFredSel({
        auto: false,
        responsive: true,
        width: '100%',
        prev: '#prev_image_additional',
        next: '#next_image_additional',
        swipe: {
        onTouch : true
        },
        items: {
            width: 100,
            height: 100,
            visible: {
            min: 1,
            max:4
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1000   //  The duration of the transition.
        }
    });
    $('#product_related').carouFredSel({
        auto: false,
        responsive: true,
        width: '100%',
        prev: '#prev_related',
        next: '#next_related',
        swipe: {
        onTouch : true
        },
        items: {
            width: 200,
            height: 'auto',
            visible: {
            min: 1,
            max: 5
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1000   //  The duration of the transition.
        }
    });
});

function goToByScroll(id){
    $('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');
    $('h2.ta-header').removeClass('selected');
    $('#tab-review').prev().addClass('selected');
}

$(document).ready(function() {
    product_resize();
});

$(window).resize(function() {
    product_resize();
});

function product_resize()   {
    if(getWidthBrowser() < 767){
        $('#tabs').hide();
        $('h2.ta-header').show();
    } else {
        $('h2.ta-header').hide();
        $('#tabs').show();
        var list = $('#tabs a');
        list.each(function( index ) {
            if($(this).hasClass('selected')){
                $(this).click();
            }
        });
    }
}

$('h2.ta-header').first().addClass('selected');
$('h2.ta-header').click(function() {
    if($(this).next().css('display') == 'none'){
        $(this).next().show();
        $(this).addClass('selected');
    }else{
        $(this).next().hide();
        $(this).removeClass('selected');
    }   
    return false;
}).next().hide(); 
//--></script>
<script type="text/javascript"><!--

$('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']);
			}	
		}
	});
});
    
$('#button-cart').bind('click', function() {
<?php if($this->myocpod->isQtyCart($product_id)) { ?>
				});
				$('.btn-podcart').click(function(e) {
					e.preventDefault();
					var product_option_id = $(this).data('cart-poid');
					var product_option_value_id = $(this).data('cart-povid');
					var quantity = $('#podqty' + product_option_value_id).val();
					
					$(':input[name="quantity"]').val(quantity);
					$('input[name="option[' + product_option_id + ']"]').attr("disabled", "disabled");
					$("#option-value-" + product_option_value_id).attr("disabled", false);
				<?php } ?>
	$.ajax({
		url: 'index.php?route=bossthemes/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\']:not(:disabled), .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
<?php if($this->myocpod->isQtyCart($product_id)) { ?>
				beforeSend: function(xhr, setting) {
					if(parseInt(quantity) <= 0 || isNaN(parseInt(quantity))) {
						$('.error').remove();
						$('#option-' + product_option_id).after('<span class="error"><?php echo $this->language->get('error_quantity'); ?></span>');
						return false;
					}
				},
				<?php } ?>
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
			} 
			
			if (json['success']) {
				addProductNotice(json['title'], json['thumb'], json['success'], 'success');
					
				$('#cart-total').html(json['total']);
			}	
		}
	});
});

function addProductNotice(title, thumb, text, type) {
	$.jGrowl.defaults.closer = true;
	var tpl = thumb + '<h3>'+text+'</h3>';
	$.jGrowl(tpl, {		
		sticky: true,
		speed: 'slow',
		life: 	4000,
		header: title
	});
}
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 
<?php echo $footer; ?>
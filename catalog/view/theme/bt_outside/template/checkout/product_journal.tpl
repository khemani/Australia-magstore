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
      <h1><?php echo $heading_title; ?></h1>
	   <div class="review">
        <div class="review_img"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /></div>&nbsp;&nbsp;<div class="review_text"><a onclick="$('a[href=\'#tab-review\']').trigger('click');goToByScroll('tab-review');"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');goToByScroll('review-title');"><?php echo $text_write; ?></a></div>
        
      </div>
      <div class="description">
      
         <?php if ($periodicity) { ?>
        <span><strong><?php echo $text_periodicity; ?></strong></span><?php echo $periodicity; ?><br />
        <?php } ?>

           <?php if ($iisn_online) { ?>
        <span><strong><?php echo 'ISSN Online :' ?></strong></span> <?php echo $iisn_online; ?><br />
        <?php } ?>
        
        <?php if ($manufacturer) { ?>
        <span><strong><?php echo $text_manufacturer; ?></strong></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        
         <?php if ($origin) { ?>
        <span><strong><?php echo $text_origin; ?></strong></span><?php echo $origin; ?><br />
        <?php } ?>
 
        
        
        <?php if ($note) { ?>
           <span><strong><?php echo 'Note :'; ?></strong></span> <?php echo $note; ?><br />
        <?php } ?>
         <div style="position:relative; float:left; margin-left:10px;">
                  <div style="min-width:135px; float:left "></div>
                  <div style=" float:right" id="message"  ></div>
              </div>
        
         <div style=" width:100%; float:left;  margin-bottom:20px; "   >
              <form  action=""   method="post" name="getaquote">
              <div style="position:relative; float:left; margin-left:10px;">
                   <div style="min-width:135px; float:left "> <label for="name" >Name:</label></div>
                  <div style=" float:right"><input type="text" name="name" id="name" /> </div>
             </div>
                <div style="position:relative; float:left; margin-left:10px;">
                   <div style="min-width:135px; float:left "><label for="designation" >Designation:</label>  </div>
             	   <div style=" float:right" ><input type="text" name="designation" id="designation" /></div>
                 </div>
				
               <div style="position:relative; float:left; margin-left:10px;">
                  <div style="min-width:135px; float:left "> <label for="department" >Department:</label></div>
                 <div style=" float:right">  <input type="text" name="department" id="department" /> </div>
               </div>
            
              <div style="position:relative; float:left; margin-left:10px;">
                 <div style="min-width:135px; float:left "><label for="organization" >Organization:</label></div>
                 <div style=" float:right"> <input type="text" name="organization" id="organization" /></div>
                </div>
                
              <div style="position:relative; float:left; margin-left:10px;">
               <div style="min-width:135px; float:left "> <label for="address" >Address:</label></div>
                 <div style=" float:right"><input type="text" name="address" id="address" /></div>
              </div>
                
                <div style="position:relative; float:left; margin-left:10px;">
                 <div style="min-width:135px; float:left "> <label for="city" >City:</label></div>
                 <div style=" float:right"><input type="text" name="city" id="city" /></div>
                </div>
                
               <div style="position:relative; float:left; margin-left:10px;">
                <div style="min-width:135px; float:left "> <label for="pincode" >Pincode:</label></div>
                <div style=" float:right"> <input type="text" name="pincode" id="pincode" /></div>
                </div>
               
              <div style="position:relative; float:left; margin-left:10px;">
                  <div style="min-width:135px; float:left "><label for="state" >State:</label></div>
                 <div style=" float:right"><input type="text" name="state" id="state" /></div>
                </div>
                
               <div style="position:relative; float:left; margin-left:10px;">
                     <div style="min-width:135px; float:left "><label for="telephone" >Telephone:</label></div>
                     <div style=" float:right"><input type="text" name="telephone" id="telephone" /></div>
                </div> 
                
              <div style="position:relative; float:left; margin-left:10px;">
                     <div style="min-width:135px; float:left "><label for="designation" >Designation:</label></div>
                     <div style=" float:right"><input type="text" name="fax" id="fax" /></div>
                </div>
            <div style="position:relative; float:left; margin-left:10px;">
                     <div style="min-width:135px; float:left "><label for="email" >Email:</label></div>
                     <div style=" float:right"><input type="text" name="email" id="email" /></div>
                </div>
           <div style="position:relative; float:left; margin-left:10px;">
                 <div style="min-width:135px; float:left "><label for="website" >Website:</label></div>
                 <div style=" float:right"><input type="text" name="website" id="website" /></div>
              </div>
           <div style="position:relative; float:left; margin-left:10px;">
                  <div style="min-width:135px; float:left "><label for="mobile" >Mobile:</label></div>
                  <div style=" float:right"><input type="text" name="mobile" id="mobile" /></div>
              </div>
              
               <div style="position:relative; float:left; margin-left:10px;">
                  <div style="min-width:135px; float:left " id="waitcaot"></div>
                  <div style=" float:right"><button  name="button-getaquote" id="button-getaquote" style="border:none !important; margin:0px !important; padding:0px !important;"><img src="/image/data/getquote.jpg"></button></div>
              </div>
              </form>
        
        
        
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

/*$('select[name="profile_id"], input[name="quantity"]').change(function(){
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
});*/
    

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

<script type="text/javascript">
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



$('#button-getaquote').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/getaquote ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&designation=' + encodeURIComponent($('input[name=\'designation\']').val()) + '&department=' + encodeURIComponent($('input[name=\'department\']').val()) + '&organization=' + encodeURIComponent($('input[name=\'organization\']').val())+'&address=' + encodeURIComponent($('input[name=\'address\']').val())+'&city=' + encodeURIComponent($('input[name=\'city\']').val())+'&pincode=' + encodeURIComponent($('input[name=\'pincode\']').val())+'&state=' + encodeURIComponent($('input[name=\'state\']').val())+'&telephone=' + encodeURIComponent($('input[name=\'telephone\']').val())+'&designation=' + encodeURIComponent($('input[name=\'designation\']').val())+'&email=' + encodeURIComponent($('input[name=\'email\']').val())+'&website=' + encodeURIComponent($('input[name=\'website\']').val())+'&mobile=' + encodeURIComponent($('input[name=\'mobile\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#waitcaot').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-getaquote').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#message').html('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#message').html('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('input[name=\'designation\']').val('');
				$('input[name=\'department\']').val('');
				$('input[name=\'organization\']').val('');
					$('input[name=\'address\']').val('');
				$('input[name=\'city\']').val('');
				$('input[name=\'pincode\']').val('');
				$('input[name=\'state\']').val('');
				$('input[name=\'telephone\']').val('');
				$('input[name=\'designation\']').val('');
				$('input[name=\'email\']').val('');
				$('input[name=\'website\']').val('');
				$('input[name=\'mobile\']').val('');
			
				
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
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
                    <div class="left col-md-9 col-xs-24  not-animated" data-animate="fadeInUp" data-delay="300" style="margin-top:3px;margin-bottom:40px;">
                        <?php if ($thumb) { ?>

                        <div><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="swipebox"><img src="<?php echo $thumb; ?>" title="ppt" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
                        <?php } ?>

                        <?php if ($images) { ?>

                        <div ><ul >
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
                            <?php if ($description) { ?>
                            <?php echo '<div class="product_limit_desc">'.$this->limit_words($description,20,'<a href="'.$_SERVER{'REQUEST_URI'}.'#cart_check"> ... Read more >></a>').'</div>'; ?><br />
                            <?php } ?>

                            <?php if ($periodicity) { ?>
                            <span><strong><?php echo $text_periodicity; ?></strong></span><?php echo $periodicity; ?><br />
                            <?php } ?>


                            <?php if ($iisn_online) { ?>
                            <span><strong><?php echo 'ISSN Online :' ?></strong></span> <?php echo $iisn_online; ?><br />
                            <?php } ?>

                            <?php if ($issn_print) { ?>
                            <span><strong><?php echo 'ISSN Print :' ?></strong></span> <?php echo $issn_print; ?><br />
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

                            <div  style=" width:100%;margin-bottom: 0px; margin-top: 10px;  margin-bottom: 26px;" >
                                <div id="message">&nbsp; </div>
                            </div>
                            <div style=" width:100%; float:left;  margin-bottom:0px; margin-top:0px; "   >
                                <div class="review_text journals_note">
                                    <label style="font-size:16px;color: dodgerblue;"> Note:- </label>
                                    <a>To subscribe to this Journal, please fill up the form below and press 'Get Quote' button, and send it to Customer Service. 
                                        Quotation will be sent to you in less than 24  hours, for an annual subscription. 
                                        In the message box, you can mention the subscription year, as per your requirement, however, if you wish to order back issues / volumes, or a single issue, please mention, accordingly.
                                    </a>
                                </div> 

                                <form  action=""   method="post" name="getaquote">
                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "> <label for="name" >Name:</label> <span class="required">*</span></div>
                                        <div style=" float:right"><input type="text" name="name" id="name"  style="width:250px;" />  <span class="error" id="error_name" style=" font-size:12px !important; width:200px !important; float:right; vertical-align:central; padding-top:10px; margin-left:5px;"></span> </div>
                                    </div>
                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "><label for="designation" >Designation:</label>  </div>
                                        <div style=" float:right" ><input type="text" name="designation" id="designation"  style="width:250px;"  /> </div>
                                    </div>

                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "> <label for="department" >Department:</label></div>
                                        <div style=" float:right">  <input type="text" name="department" id="department"  style="width:250px;" /> </div>
                                    </div>

                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "><label for="organization" >Organization:</label> <span class="required">*</span></div>
                                        <div style=" float:right"> <input type="text" name="organization" id="organization"  style="width:250px;" />  <span class="error" id="error_organization" style=" font-size:12px !important; width:200px !important; float:right; vertical-align:central; padding-top:10px; margin-left:5px;"></span></div>
                                    </div>

                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "> <label for="address" >Address:</label><span class="required">*</span></div>
                                        <div style=" float:right"><input type="text" name="address" id="address"  style="width:250px;" /> <span class="error" id="error_address" style=" font-size:12px !important; width:200px !important; float:right; vertical-align:central; padding-top:10px; margin-left:5px;"></span></div>
                                    </div>

                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "> <label for="pincode" >Pincode:</label> <span class="required">*</span></div>
                                        <div style=" float:right"> <input type="text" name="pincode" id="pincode"  style="width:250px;" /> <span class="error" id="error_pincode" style=" font-size:12px !important; width:200px !important; float:right; vertical-align:central; padding-top:10px; margin-left:5px;"></span></div>
                                    </div>

                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "><label for="country" >Country:</label> <span class="required">*</span></div>
                                        <span class="error" id="error_country" style=" font-size:10px !important; width:200px !important; float:right; vertical-align:central; padding-top:10px;  margin-left:5px;"></span>
                                        <div style=" float:right;"><select class="form-control" name="country_id" style="width:250px;"><span class="error" id="error_organization" style=" font-size:12px !important; width:200px !important; float:right; vertical-align:central; padding-top:10px; margin-left:5px;"></span> 

                                                <option value=""><?php echo $text_select; ?></option>

                                                <?php foreach ($countries as $country) { ?>

                                                <?php if ($country['country_id'] == 99 ) { ?>

                                                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>

                                                <?php } else { ?>

                                                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>

                                                <?php } ?>

                                                <?php } ?>

                                            </select>

                                        </div>


                                    </div>


                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "><label for="state" >State:</label> <span class="required">*</span></div>
                                        <span class="error" id="error_state" style=" font-size:12px !important; width:200px !important; float:right; vertical-align:central; padding-top:10px; margin-left:5px; "> </span>
                                        <div style=" float:right;" >
                                            <select class="form-control" name="zone_id" id="zone_id" style="width:250px;">

                                            </select>

                                        </div>

                                    </div>

                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "> <label for="city" >City:</label> <span class="required">*</span></div>
                                        <div style=" float:right"><input type="text" name="city" id="city"  style="width:250px;" /> <span class="error" id="error_city" style=" font-size:12px !important; width:200px !important; float:right; vertical-align:central; padding-top:10px;  margin-left:5px;"></span></div>
                                    </div>


                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "><label for="telephone" >Telephone:</label></div>
                                        <div style=" float:right"><input type="text" name="telephone" id="telephone"  style="width:250px;" /></div>
                                    </div> 

                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "><label for="email" >Email:</label> <span class="required">*</span></div>
                                        <div style=" float:right"><input type="text" name="email1" id="email1"  style="width:250px;" /> <span class="error" id="error_email" style=" font-size:12px !important; width:200px !important; float:right; vertical-align:central; padding-top:10px;  margin-left:5px;"></span> </div>
                                    </div>
                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "><label for="website" >Website:</label></div>
                                        <div style=" float:right"><input type="text" name="website" id="website"  style="width:250px;" /></div>
                                    </div>
                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "><label for="mobile" >Mobile:</label> <span class="required">*</span></div>
                                        <div style=" float:right"><input type="text" name="mobile" id="mobile"  style="width:250px;" /> <span class="error" id="error_mobile" style=" font-size:12px !important; width:200px !important; float:right; vertical-align:central; padding-top:10px;  margin-left:5px;"></span></div>
                                    </div>

                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; float:left "><label for="mobile" >Message:</label></div>
                                        <div style=" float:right"><textarea name="readermessage" id="readermessage"  style="width:250px;" ></textarea> </div>
                                    </div>

                                    <div style="position:relative; float:left; margin-left:10px;">
                                        <div style="min-width:135px; min-height:104px; float:left " ></div>
                                        <div style=" float:right; min-height:83px; "><a  name="button-getaquote" id="button-getaquote"  style="border:none !important; margin:0px !important; padding:0px !important;"><img src="/image/data/getquote.jpg"></a></div>
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
$.ajax({
url: 'index.php?route=bossthemes/cart/add',
type: 'post',
data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
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




$('#button-getaquote').bind('click', function() {
$.ajax({
url: 'index.php?route=product/product/getaquote',
type: 'post',
dataType: 'json',
data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&designation=' + encodeURIComponent($('input[name=\'designation\']').val()) + '&department=' + encodeURIComponent($('input[name=\'department\']').val()) + '&organization=' + encodeURIComponent($('input[name=\'organization\']').val())+'&address=' + encodeURIComponent($('input[name=\'address\']').val())+'&city=' + encodeURIComponent($('input[name=\'city\']').val())+'&pincode=' + encodeURIComponent($('input[name=\'pincode\']').val())+'&country=' + encodeURIComponent($('select[name=\'country_id\']').val())+'&state=' + encodeURIComponent($('select[name=\'zone_id\']').val())+'&telephone=' + encodeURIComponent($('input[name=\'telephone\']').val())+'&designation=' + encodeURIComponent($('input[name=\'designation\']').val())+'&email1='+ encodeURIComponent($('input[name=\'email1\']').val())+'&website=' + encodeURIComponent($('input[name=\'website\']').val())+'&mobile=' + encodeURIComponent($('input[name=\'mobile\']').val())+'&readermessage=' +$('#readermessage').val(),
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
$('input[name=\'email1\']').val('');
$('input[name=\'website\']').val('');
$('input[name=\'mobile\']').val('');
$('input[name=\'readermessage\']').val('');
}
else
                        {
if(data['error'].firstname)
                                {
$('#error_name').html(data['error'].firstname);
}
else
                                {
$('#error_name').html('');	
}
				
				
if(data['error'].designation)
                                {
$('#error_organization').html(data['error'].designation);
}
else
                                {
$('#error_organization').html('');	
}
				
if(data['error'].address)
                                {
$('#error_address').html(data['error'].address);
}
else
                                {
$('#error_address').html('');	
}
				
				
if(data['error'].city)
                                {
$('#error_city').html(data['error'].city);
}
else
                                {
$('#error_city').html('');	
}
				
				
if(data['error'].pincode)
                                {
$('#error_pincode').html(data['error'].pincode);
}
else
                                {
$('#error_pincode').html('');	
}
				
				
if(data['error'].state)
                                {
$('#error_state').html(data['error'].state);
}
else
                                {
$('#error_state').html('');	
}
if(data['error'].email)
                                {
$('#error_email').html(data['error'].email);
}
else
                                {
$('#error_email').html('');	
}
				
				
if(data['error'].mobile)
                                {
$('#error_mobile').html(data['error'].mobile);
}
else
                                {
$('#error_mobile').html('');	
}
				
				
				
				
				
				
				
				
				
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

<script type="text/javascript"><!--

$('select[name=\'country_id\']').bind('change', function() {

$.ajax({

url: 'index.php?route=account/register/country&country_id=' + this.value,

dataType: 'json',

beforeSend: function() {

$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');

},

complete: function() {

$('.wait').remove();

},			

success: function(json) {

if (json['postcode_required'] == '1') {

$('#postcode-required').show();

} else {

$('#postcode-required').hide();

}

			

html = '<option value=""><?php echo $text_select; ?></option>';

			

if (json['zone'] != '') {

for (i = 0; i < json['zone'].length; i++) {

html += '<option value="' + json['zone'][i]['zone_id'] + '"';

	    			

if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {

html += ' selected="selected"';

}

	

html += '>' + json['zone'][i]['name'] + '</option>';

}

} else {

html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';

}

			

$('select[name=\'zone_id\']').html(html);

},

error: function(xhr, ajaxOptions, thrownError) {

alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);

}

});

});



$('select[name=\'country_id\']').trigger('change');

//--></script> 

<?php echo $footer; ?>
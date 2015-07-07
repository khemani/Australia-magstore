<?php echo $header; ?><div class="container">
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
  <h1 class="article-title-boss"><?php echo $heading_title; ?></h1> 
  <div class="boss_article-item boss_article-detail">
    <div class="article-title">
		<div class="date-post">
		<small class="time-stamp">
            <?php $date = new DateTime($date_modified);?>
            <?php echo $date->format('l, M j, Y');?>
        </small>
        <span class="separator">|</span>
        <span class="post-by"> Post by <span><?php echo $author; ?></span></span>
        <span class="separator">|</span>
		<span class="comment-count"><span><?php echo $comments; ?></span> comment(s)</span>
		</div>
        <p><?php echo $title;?></p>
        
    </div>
            
            <div class="article-content">
                <?php echo $content;?>
            </div>
            <div class="boss_article-action">
                    <?php if ($tags) { ?>
                      <div class="tags"><span><?php echo $text_tags; ?>: </span>
                      <ul>
                        <?php for ($i = 0; $i < count($tags); $i++) { ?>
                        <?php if ($i < (count($tags) - 1)) { ?>
                        <li class="item"><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></li>
                        <?php } else { ?>
                        <li class="item"><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></li>
                        <?php } ?>
                        <?php } ?>
                      </ul>
                      </div>
                    <?php } ?>
                    <div class="article-share">
                            
                    <!-- Share This Post -->
                        <a href="http://www.facebook.com/sharer.php?u=<?php echo $href; ?>&title=<?php echo $name; ?>" target="_blank">
                                <img border="0" src="http://3.bp.blogspot.com/_vLeiVavkV_M/SnleIlLdGwI/AAAAAAAABd8/RfHnWIGGMEY/s200/facebook.png" alt="Post item information on Facebook" title="Post item information on Facebook" />
                        </a>

                        <a title="Add To Del.icio.us" target="_blank" href="http://del.icio.us/article?url=<?php echo $href; ?>&amp;title=<?php echo $name; ?>">
                                <img border="0" src="http://2.bp.blogspot.com/_vLeiVavkV_M/Snld35mPSDI/AAAAAAAABds/ccrOpOmP9Zk/s200/delicious.png" alt="Add To Del.icio.us" title="Add To Del.icio.us" />
                        </a>

                        <a title="Stumble This" target="_blank" href="http://www.stumbleupon.com/refer.php?url=<?php echo $href; ?>&amp;title=<?php echo $name; ?>">
                                <img border="0" src="http://2.bp.blogspot.com/_vLeiVavkV_M/SnleiulEMVI/AAAAAAAABeU/kO09nNTlQeo/s200/stumbleupon.png" alt="Stumble This" title="Stumble This" />
                        </a>

                        <a title="Digg This" target="_blank" href="http://digg.com/submit?phase=2&amp;url=<?php echo $href; ?>&amp;title=<?php echo $name; ?>">
                                <img border="0" src="http://3.bp.blogspot.com/_vLeiVavkV_M/Snld_x-wXoI/AAAAAAAABd0/cTsGU_Y-zQ8/s200/digg.png" alt="Digg This" title="Digg This" />
                        </a>

                        <a title="Add To Reddit" target="_blank" href="http://reddit.com/submit?url=<?php echo $href; ?>&amp;title=<?php echo $name; ?>">
                                <img border="0" src="http://3.bp.blogspot.com/_vLeiVavkV_M/SnleX1tMMtI/AAAAAAAABeM/gQSYdrmSc3k/s200/reddit.png" alt="Add To Reddit" title="Add To Reddit">
                        </a>

                        <a title="Add To Yahoo" target="_blank" href="http://myweb2.search.yahoo.com/myresults/bookmarklet?t=<?php echo $href; ?>&amp;title=<?php echo $name; ?>">
                                <img border="0" src="http://1.bp.blogspot.com/_vLeiVavkV_M/SnlexsGX2QI/AAAAAAAABes/ai6zvzZKCgw/s200/yahoo.png" alt="Add To Yahoo" title="Add To Yahoo">
                        </a>
                    <!-- End Share This Post-->
                    </div>
                </div>
            <div class="article-related">
                <h3 class="form-title"><?php echo $article_related; ?></h3>
                 <ul>
                   <?php foreach ($articles as $article) { ?> 
                       <li><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></li>
                   <?php } ?> 
                 </ul>
            </div>
			
			<?php if (!empty($products)) { ?>
			  <div id="product-related">
				<h2 class="box-title"><?php echo $text_product_related; ?> (<?php echo count($products); ?>)</h2>
				<div class="box-content">
				  <div class="list_carousel responsive" >
					<ul id="product_related" class="box-product"><?php foreach ($products as $product) { ?><li>
					  <div class="relt_product">
					  <?php if ($product['thumb']) { ?>
						<div class="image"><a class="cs_img" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /><b>&nbsp;</b></a></div>
						<?php } ?>
						 <div class="caption">
						<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
						<?php if ($product['price']) { ?>
						<div class="price">
						  <?php if (!$product['special']) { ?>
						  <?php echo $product['price']; ?>
						  <?php } else { ?>
						  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
						  <?php } ?>
						</div>
						<?php if ($product['rating']) { ?>
						<div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
						<?php } ?>
						</div>
						<div class="cart"><a onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-cart"><?php echo $button_cart; ?></a></div>
						<?php } ?></div></li><?php } ?></ul>
						<div class="clearfix"></div>
						<a id="prev_related" class="prev nav_thumb" href="javascript:void(0)" title="prev">Prev</a>
						<a id="next_related" class="next nav_thumb" href="javascript:void(0)" title="next">Next</a>
					</div>
					</div>
			  </div>
			  <?php } ?>
			
			
                
                <?php if ($allow_comment!=0) {?>
                    <?php if ($comment_status==1||$allow_comment==1) {?>
            <div class="comments">
                
				<div id="article-comments">
                   </div> 
                <div class="form-comment-container">
                    <span id="new">
                    	<h3><?php echo $text_comment; ?> </h3>
                    </span>       
                    <div id="0_comment_box" class="form-comment">
                    	  <?php if(!$login){?>
                    		  <div class="field" id="username">
                    			  <label class="required" for="name"><?php echo $text_username; ?><em>*</em></label>
                    			  <div class="input-box">
                    				  <input type="text" class="input-text required-entry form-control" value="" title="Name" id="name" name="username">
                    			  </div>
                    		  </div>
                    
                    		  <div class="field" class="email_blog">
                    			  <label class="required" for="email"><?php echo $text_email; ?><em>*</em></label>
                    			  <div class="input-box">
                    				  <input type="text" class="input-text required-entry validate-email form-control" value="" title="Email" id="email" name="email_blog">
                    			  </div>
                    		  </div>
                    	  <?php } else{?>
                                <input type="hidden" class="input-text required-entry" value="<?php echo $username; ?>" title="Name" id="name" name="username">
                                <input type="hidden" class="input-text required-entry validate-email" value="<?php echo $email; ?>" title="Email" id="email" name="email_blog">
                          <?php } ?>
                    	  <div class="input-box">
                    		  <label class="required" for="comment"><?php echo $entry_comment; ?><em>*</em></label>
                    		  <textarea rows="2" cols="10" class="required-entry input-text form-control" style="height:110px" title="Comment" id="comment" name="comment_content"></textarea>
                    	  </div>
                    	  
                    	  <?php if($capcha){?>
                          <div class="captcha">
                    	  
                           <input type="text" class="form-control captcha_text" name="captcha" value="" />
						    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
                    	   <label class="required-1 " for="recaptcha"><?php echo $text_required?><em>*</em></label>
                    	  </div>
                          <?php }?>
              	          <div>
                            <div class="left"><br/><a id="button-comment" class="btn"><span><?php echo $button_continue; ?></span></a></div>
                          </div>
                    	  </div>
            	   </div>
                   
             </div>
             <?php } } ?>        
        </div>
  <?php echo $content_bottom; ?></div></div></div>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.carouFredSel-6.2.0-packed.js"></script>  
<script type="text/javascript"><!--
$('#article-comments .pagination a').live('click', function() {
	$('#article-comments').fadeOut('slow');
		
	$('#article-comments').load(this.href);
	
	$('#article-comments').fadeIn('slow');
	
	return false;
});			

$('#article-comments').load('index.php?route=bossblog/article/comment&blog_article_id=<?php echo $blog_article_id; ?>');

$('#button-comment').bind('click', function() {
	$.ajax({
		url: 'index.php?route=bossblog/article/write&blog_article_id=<?php echo $blog_article_id; ?>&need_approval=<?php echo $need_approval; ?>&approval_status=<?php echo $approval_status; ?>',
		type: 'post',
		dataType: 'json',
		data: 'username=' + encodeURIComponent($('input[name=\'username\']').val()) + '&comment_content=' + encodeURIComponent($('textarea[name=\'comment_content\']').val()) + '&email=' + encodeURIComponent($('input[name=\'email_blog\']').val()) + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-comment').attr('disabled', true);
			$('#new').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-comment').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#new').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#new').after('<div class="success">' + data['success'] + '</div>');
				$('#article-comments').load('index.php?route=bossblog/article/comment&blog_article_id=<?php echo $blog_article_id; ?>');				
				$('input[name=\'username\']').val('');
				$('textarea[name=\'comment_content\']').val('');
				$('input[name=\'email_blog\']').val('');
                $('input[name=\'captcha\']').val('');
			}
		}
	});
});
$(window).load(function(){
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
            width: 150,
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
//--></script> 
<?php echo $footer; ?>
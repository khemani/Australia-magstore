<?php if($status){ ?>
<div id="boss_zoom">
<div class="bosszoomtoolbox" >
	<?php if ($thumb) { ?>
	<div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" id='zoom1' rel=""><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>
		<br>
		Hover | <a rel="vdrel" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="swipebox">Large</a>
	</div>
	<?php } ?>
	<?php if ($images) { ?>
	<div class="image-additional"><ul id="boss-image-additional">
        <?php foreach ($images as $image) { ?>
			<li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>' "><img src="<?php echo $image['addition']; ?>"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
		<?php } ?>
	</ul>
		<a id="prev_image_additional" class="prev nav_thumb" href="javascript:void(0)" title="prev">Prev</a>
		<a id="next_image_additional" class="next nav_thumb" href="javascript:void(0)" title="next">Next</a>
	</div>
	<?php foreach ($images as $image) { ?>
		<?php if($image['popup']!=$popup){ ?>
		<a rel="vdrel" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="swipebox"></a>
	<?php } }?>
	<?php } ?>
</div>
</div>
<script type="text/javascript"><!--

$(document).ready(function() {
	if(getWidthBrowser() > 767){
		$(".bosszoomtoolbox").css('display', 'block');
		if (jQuery("#boss_zoom").html()){
			jQuery(".product-info .imgthumb").html(jQuery("#boss_zoom").html());
			jQuery("#boss_zoom").remove();
			$.fn.CloudZoom.defaults = {
				adjustX: <?php echo $adjustX; ?>,
				adjustY: <?php echo $adjustY; ?>,
				tint: '<?php echo $tint; ?>',
				tintOpacity: <?php echo $tintOpacity; ?>,
				softFocus: <?php echo $softfocus; ?>,
				lensOpacity: <?php echo $lensOpacity; ?>,
				zoomWidth: '<?php if($zoom_area_width){ echo $zoom_area_width; }else{ echo 'auto';} ?>',
				zoomHeight: '<?php if($zoom_area_heigth){ echo $zoom_area_heigth; }else{ echo 'auto';} ?>',
				position: '<?php echo $position_zoom_area; ?>',
				showTitle: <?php echo $title_image; ?>,
				titleOpacity: <?php echo $title_opacity; ?>,
				smoothMove: '<?php echo $smoothMove; ?>'
			}; 
		}
	}else{
		$(".bosszoomtoolbox").css('display', 'none');
	}
});
//--></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/cloud-zoom/cloud-zoom.1.0.3.js"></script>
<?php } ?>
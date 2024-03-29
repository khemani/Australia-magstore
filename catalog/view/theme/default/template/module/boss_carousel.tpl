<div id="carousel<?php echo $module; ?>" class="homecarousel not-animated" data-animate="fadeInUp" data-delay="100" >
	<section class="box-content">
		<ul id="boss_carousel<?php echo $module; ?>" class="carousel-content">
		<?php foreach ($banners as $banner) { ?>
			<li><a href="<?php echo $banner['link']; ?>"><img class="img-responsive" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></li>
		<?php } ?>
		</ul>
		<a id="carousel_next<?php echo $module; ?>" class="prev nav_thumb" href="javascript:void(0)" title="prev">Prev</a>
		<a id="carousel_prev<?php echo $module; ?>" class="next nav_thumb" href="javascript:void(0)" title="next">Next</a>
	</section>
</div>
<script type="text/javascript"><!--
$(window).load(function(){
    $('#boss_carousel<?php echo $module; ?>').carouFredSel({
        auto: false,
        responsive: true,
        width: '100%',
        prev: '#carousel_next<?php echo $module; ?>',
        next: '#carousel_prev<?php echo $module; ?>',
        swipe: {
        onTouch : true
        },
        items: {
            width: 180,
            height: 'auto',
            visible: {
            min: 1,
            max: 7
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1000   //  The duration of the transition.
        }
    });
});
//--></script>
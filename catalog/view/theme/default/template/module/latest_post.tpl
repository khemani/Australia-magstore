<div class="staticblock-footer not-animated" data-animate="fadeInUp" data-delay="100">
<div class="heading">
<!--<h3>Magazines-INDIA BLOG</h3>-->

<img src="/image/data/mi-bloghead.jpg" />
<!--<p>Quisque justo turpis, sodales sit amet consectetur - <a href="#">Go to Blog</a></p>-->
</div>

<div class="static_column">
<?php foreach ($articles as $article) { ?>

<div class="column-1 col-lg-8 col-md-8 col-sm-8 col-xs-24">
<div class="image"><a href="#" title="bosstheme static block"><img src="<?php echo $article['thumb']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>

<div class="name"><a> <?php echo substr( $article['name'],0,50); ?> </a></div>

<div class="description">
<p><?php  echo substr($article['title'],0,200); ?></p>
</div>

<p class="readmore"><a href="<?php echo $article['href']; ?>" title="Read more">Read more</a></p>
</div>

  <?php } ?>





</div>
</div>

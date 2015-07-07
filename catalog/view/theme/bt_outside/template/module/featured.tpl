<div class="box box-featured not-animated" data-animate="fadeInUp" data-delay="300">

  <div class="box-heading"><span><?php echo $heading_title; ?></span></div>

  <div class="box-content">

    <div class="box-product">

      <?php foreach ($products as $product) { ?>

      <div>

        <?php if ($product['thumb']) { ?>

        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>

        <?php } ?>

		<div class="prod-detail">

		<div class="caption">

        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        
        <div class="name"><?php echo $product['issues_per_year']; ?> &nbsp;Issues per year</div>

        <?php if ($product['rating']) { ?>

        <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>

        <?php } ?>

		</div>

 <?php if ($product['product_type'] != 2) { ?>  
        <?php if ($product['price']) { ?>


        <div class="price">

          <?php if (!$product['special']) { ?>

          <?php echo $product['price']; ?>

          <?php } else { ?>

          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>

          <?php } ?>

        </div>

        <?php } ?>
    <?php } ?>
		<div class="cart">
        
        <a class="" href="<?php echo $product['href']; ?>" data-id="49">
			<input class="btn btn-cart1 button btn-podcart " type="button" value="" data-cart-poid="227" data-cart-povid="18" style=" padding: 31px 65px; background:url(/image/data/brands/subsc.png) no-repeat ; border:none;">
		</a>
        <!--<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-cart" />-->
        
        
        </div>

      </div>

	  </div>

      <?php } ?>

    </div>

  </div>

</div>


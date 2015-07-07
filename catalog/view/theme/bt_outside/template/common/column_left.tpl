<?php if ($modules) { ?>

<div id="column-left" class="col-sm-6 hidden-xs">

  <?php foreach ($modules as $module) { ?>

  <?php echo $module; ?>

  <?php } ?>
  
  
  <?php if( isset( $thumb ) &&  $thumb!='' ) { ?>
  
  <div class="box box_alphabet not-animated" data-animate="fadeInLeft" data-delay="100">

  <div class="box-heading"><span><?php echo 'Image' ?></span></div>

  <div class="box-content">

    <div class="boss-alphabet">

      <img src="<?php  echo $thumb ?>" />

	</div>

  </div>

</div>
<?php
}
?>
</div>

<?php } ?> 


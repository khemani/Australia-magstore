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
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($orders) { ?>
  <?php foreach ($orders as $order) { ?>
  <div class="order-list">
    <div class="order-id"><b><?php echo $text_order_id; ?></b> #<?php echo $order['order_id']; ?></div>
    <div class="order-status"><b><?php echo $text_status; ?></b> <?php echo $order['status']; ?></div>
    <div class="order-content">
      <div><b><?php echo $text_date_added; ?></b> <?php echo $order['date_added']; ?><br />
        <b><?php echo $text_products; ?></b> <?php echo $order['products']; ?></div>
      <div><b><?php echo $text_customer; ?></b> <?php echo $order['name']; ?><br />
        <b><?php echo $text_total; ?></b> <?php echo $order['total']; ?></div>
      <div class="order-info"><a href="<?php echo $order['href']; ?>"><img src="catalog/view/theme/default/image/info.png" alt="<?php echo $button_view; ?>" title="<?php echo $button_view; ?>" /></a>&nbsp;&nbsp;<a href="<?php echo $order['reorder']; ?>"><img src="catalog/view/theme/default/image/reorder.png" alt="<?php echo $button_reorder; ?>" title="<?php echo $button_reorder; ?>" /></a></div>
    </div>
  </div>
  <?php } ?>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php } ?>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="btn"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div></div></div>
<?php echo $footer; ?>
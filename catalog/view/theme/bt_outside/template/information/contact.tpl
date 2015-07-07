<?php echo $header; ?><div class="container">

  <ul class="breadcrumb">

    <?php foreach ($breadcrumbs as $breadcrumb) { ?>

    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>

    <?php } ?>

  </ul>

  <div class="row"><!--<?php echo $column_left; ?><?php echo $column_right; ?>

	<?php $column_left  = trim($column_left);

	$column_right  = trim($column_right); ?>

    <?php if ($column_left && $column_right) { ?>

    <?php $class = 'col-sm-12'; ?>

    <?php } elseif ($column_left || $column_right) { ?>

    <?php $class = 'col-sm-18'; ?>

    <?php } else { ?>

    <?php $class = 'col-sm-24'; ?>

    <?php } ?>-->

    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

  <h1><?php echo $heading_title; ?></h1>

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

  <!--  <h2><?php echo $text_location; ?></h2>-->

    <div class="contact-info">

      <div class="content"><div class="col-lg-12 col-md-12 col-sm-24 col-xs-24" style="margin-bottom:15px; font-size:14px;"><!--<b><?php echo $text_address; ?></b><br />-->
<img src="/image/data/contactus/0.jpg" style="height:100px; width:auto;" /><br /><br />
        <strong><?php echo $store; ?></strong><br />
        

        <?php echo $address; ?><br />
        <strong>Telephone:</strong> +91-124-663-7654; Fax: +91-124-663-7778 <br />
            <strong>Customer Service:</strong> +91 7042887650 | 9718826071 | 9582784438 | 8882070241<br />
<strong>eMail: </strong>info@Magazines-AMERICA.com<br /><br />

        <strong>For Subscriptions Orders:</strong> Subscribe@Magazines-AMERICA.com<br />
        <strong>For Advertising in Magazines:</strong> Advertise@Magazines-AMERICA.com<br />
        <strong>For Corporates & Libraries Orders:</strong> CustomerService@Magazines-AMERICA.com<br />
        <br />
        <img src="/image/data/contactus/1.png" style="height:70px; width:80px; padding-right:10px;" /> <strong>www.Magazines-AMERICA.com</strong><br />
        <img src="/image/data/contactus/2.png" style="height:45px; width:50px; margin:0 30px 10px 0;"/>  <strong>www.Facebook.com/Magazines-AMERICA</strong><br />
        <img src="/image/data/contactus/3.png" style="height:45px; width:50px; margin:0 30px 10px 0;"/> <strong>www.Twitter.com/Magazines-AMERICA</strong><br />
        <img src="/image/data/contactus/4.jpg" style="height:70px; width:80px; padding-right:10px;"/> <strong>subscribe@Magazines-AMERICA.com</strong><br />
       <img src="/image/data/contactus/5.jpg" style="height:70px; width:80px; padding-right:10px;"/>  <strong>+91-124-663-7654</strong><br />
        <img src="/image/data/contactus/6.jpg" style="height:70px; width:80px; padding-right:10px;"/><strong>+91-124-663-7778</strong><br />
        <img src="/image/data/contactus/7.jpg" style="height:70px; width:80px; padding-right:10px;"/><strong>+91 - 7042887650 | 9718826071 | 9582784438 | 8882070241</strong></div>

      <div class="col-lg-12 col-md-12 col-sm-24 col-xs-24" style="margin-bottom:15px;">

           <h2>Enquire Now:</h2>

    <div class="content">

    <span><?php echo $entry_name; ?></span><br />

    <input type="text" class="form-control" name="name" value="<?php echo $name; ?>" />

   

    <?php if ($error_name) { ?>

    <span class="error"><?php echo $error_name; ?></span>

    <?php } ?>

    

    <span><?php echo $entry_email; ?></span><br />

    <input type="text" class="form-control" name="email" value="<?php echo $email; ?>" />

    

    <?php if ($error_email) { ?>

    <span class="error"><?php echo $error_email; ?></span>

    <?php } ?>

    

    <span><?php echo $entry_enquiry; ?></span><br />

    <textarea class="form-control" name="enquiry" cols="40" rows="10"><?php echo $enquiry; ?></textarea>

    

    <?php if ($error_enquiry) { ?>

    <span class="error"><?php echo $error_enquiry; ?></span>

    <?php } ?>

    <br />

    <span><?php echo $entry_captcha; ?></span><br />

    <input type="text" class="form-control" name="captcha" value="<?php echo $captcha; ?>" />

    <br />

    <img src="index.php?route=information/contact/captcha" alt="" />

    <?php if ($error_captcha) { ?>

    <span class="error"><?php echo $error_captcha; ?></span>

    <?php } ?>

    </div>
    <br/>

    <div class="buttons">

      <div class="left"><input type="submit" value="" class="btn btncontact" /></div><style>.btncontact{ background-image:url(/image/data/contactus.jpg);padding: 26px 77px; border:none !important;}
      .btn:hover {background-image:url(/image/data/contactus.jpg);padding: 26px 77px;  border:none !important;}</style>

    </div>

  </form>   

      </div>



    </div>

    </div>



	

  <?php echo $content_bottom; ?></div></div></div>

<?php echo $footer; ?>
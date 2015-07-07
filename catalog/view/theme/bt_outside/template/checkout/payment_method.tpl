<?php if ($error_warning) { ?>

<div class="warning"><?php echo $error_warning; ?></div>

<?php } ?>



<?php if ($payment_methods) { ?>

<!--<p><?php echo $text_payment_method; ?></p>
-->
<script>
$(document).ready(function() {
    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});

</script>
<style>
.glyphicon{ font-size:24px;}
</style>

  <div class="row">
   <input type="hidden" name="payment_method" id="payment_method" value="" />
        <div class="col-lg-22 col-md-12 col-sm-8 col-xs-9 bhoechie-tab-container" style="margin-bottom:25px;">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 bhoechie-tab-menu" >
              <div class="list-group">
           <?php foreach ($payment_methods as $payment_method) { ?>
               <?php if ($payment_method['code'] == $code || !$code) { ?>
                <?php $code = $payment_method['code']; ?>
        
                     <a href="#" emethod='payment_method' evalmet='<?php echo $payment_method['code']; ?>' class="list-group-item  text-center button-payment-method">
                      <i style="font-size:20px;" class="<?php echo $payment_method['code']!='cod'? 'fa fa-credit-card' : 'glyphicon-credit-card'  ?>"></i><br/><?php echo $payment_method['title']; ?>
                    </a>
        
                <?php } else { ?>

        			 <a href="#" evalue='payment_method' evalmet='<?php echo $payment_method['code']; ?>' class="list-group-item  text-center button-payment-method">
                          <i style="font-size:20px;" class="<?php echo $payment_method['code']=='cod'? 'fa fa-credit-card' : 'glyphicon-credit-card'  ?>"></i><br/><?php echo $payment_method['title']; ?>
                     </a>

      			  <?php } ?>

       				 <!--//<label for="<?php echo $payment_method['code']; ?>"></label>-->
    
   			 <?php } ?>
             
</div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 bhoechie-tab">
                <!-- online payment section -->
                <div class="bhoechie-tab-content active">
                    <center>
                    <div id="payu" >
                   				 <span><br /><br />Please select a payment option to proceed. You can choose any option as shown on the left</span>
                    </div>    
                    </center>
                </div>
                <!-- cod section -->
                <div class="bhoechie-tab-content">
                    <center>
                     <div id="cod">
                     
                     </div>
                    </center>
                </div>
                <!-- cod search -->
            </div>
        </div>
</table>

<br />


<?php } ?>





<!--<b><?php echo $text_comments; ?></b>

<br/>

<textarea name="comment" rows="8" cols="60"><?php echo $comment; ?></textarea>

<br />

<br />-->





<?php if ($text_agree) { ?>

<div class="buttons">

    <div class="left">

		<?php echo $text_agree; ?>
    </div>

</div>

<?php }  ?>







<script type="text/javascript">

<!--

    $('.colorbox').colorbox({

       width: 640,

       height: 480

   });

//-->

</script> 
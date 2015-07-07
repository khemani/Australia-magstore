<div class="buttons">

  <div class="center" style="min-height:196px;">
  <p>COD Charges of Rs.49.00 will be applicable</p>
  <p>on all orders of below Rs.499.00</p> 
  <table align="center">
  <tr>
  <!--<td><label><?php echo $entry_captcha; ?></label></td>-->
   <td colspan=""><img src="index.php?route=payment/cod/captcha" alt="" class="img-responsive img-captcha" /></td>
  <td><input type="text" name="captcha" value="<?php echo $captcha; ?>" class="form-control" placeholder="<- Enter this text here"/></td>
  </tr>
  <tr>
  <td colspan="2" id="captchaerror"></td>
  </tr>
  <tr>
   </tr>
    <tr>
  <td colspan="2"> </td>
   </tr>
   <div style="bottom:0px; right:15px; text-align:right; vertical-align:bottom; position:absolute; bottom:15px; ">
   <input type="button" value="<?php echo 'Order Now'; ?>" id="button-confirm" class="button btn btn-theme-default"  />
   </div>
  </div>
      

</div>

<script type="text/javascript"><!--

$('#button-confirm').bind('click', function() {
   

	$.ajax({ 
		url: 'index.php?route=payment/cod/confirm',
		type: 'post',
		data: $('#payment-method :input'),
		dataType: 'json',
		
		beforeSend: function() {
			$('#button-confirm').attr('disabled', true);
			$('#button-confirm').after('<span class="wait">&nbsp;<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-confirm').attr('disabled', false);
			$('.wait').remove();
		},				
		success: function(json) {
			$('.warning, .error').remove();
			
			 if (json['message']['success']=='No') {
					$('#captchaerror').html('<span class="error">' + json['error']['captcha'] + '</span>');
				}
				else if(json['message']['success']=='Yes')
				{
				   location = '<?php echo $continue; ?>';	
				}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}

		/*success: function() {

			location = '<?php echo $continue; ?>';

		}	*/	

	});

});


</script> 


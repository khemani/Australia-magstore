
  <form action="<?php echo $action ?>" method="post" id="payu_form" name="payu_form" onsubmit="javascript: return validate()" >
           <div class="col-lg-6 col-md-3 col-sm-3 col-xs-6 bhoechie-tab-menu" style="margin-bottom:10px;" align="left">
                        <input type="radio" name="enforce_paymethod" value="netbanking"? /> Net Banking 
                         </div>
                         <div class="col-lg-6 col-md-3 col-sm-3 col-xs-6 bhoechie-tab-menu" style="margin-bottom:10px;" align="left">
                       <input type="radio" name="enforce_paymethod" value="creditcard"? /> Credit Card 
                        </div>
                        <div class="col-lg-6 col-md-3 col-sm-3 col-xs-6 bhoechie-tab-menu" style="margin-bottom:10px;" align="left">
                        <input type="radio" name="enforce_paymethod" value="debitcard" ? /> Debit Card 
                        </div>
                         <div class="col-lg-6 col-md-3 col-sm-3 col-xs-6 bhoechie-tab-menu" style="margin-bottom:10px;" align="left">
                        <input type="radio" name="enforce_paymethod" value="cashcard"? /> Cash Card 
                        </div>
                       
		<input type="hidden" name="key" value="<?php echo $key; ?>" />
		<input type="hidden" name="txnid" value="<?php echo $txnid; ?>" />
		<input type="hidden" name="amount" value="<?php echo $amount; ?>" />
		<input type="hidden" name="productinfo" value="<?php echo $productinfo; ?>" />
		<input type="hidden" name="firstname" value="<?php echo $firstname; ?>" />
		<input type="hidden" name="Lastname" value="<?php echo $Lastname; ?>" />
		<input type="hidden" name="Zipcode" value="<?php echo $Zipcode; ?>" />
		<input type="hidden" name="email" value="<?php echo $email; ?>" />
		<input type="hidden" name="phone" value="<?php echo $phone; ?>" />
		<input type="hidden" name="surl" value="<?php echo $surl; ?>" />
		<input type="hidden" name="Furl" value="<?php echo $Furl; ?>" />
		<input type="hidden" name="curl" value="<?php echo $curl; ?>" />
		<input type="hidden" name="Hash" value="<?php echo $Hash;?>" />
<!--		<input type="hidden" name="Pg" value="<?php echo $Pg; ?>" />
-->		<input type="hidden" name="address1" value="<?php echo $address1; ?>" />
        <input type="hidden" name="address2" value="<?php echo $address2; ?>" />
        <input type="hidden" name="city" value="<?php echo $city; ?>" />
        <input type="hidden" name="country" value="<?php echo $country; ?>" />
        <input type="hidden" name="state" value="<?php echo $state; ?>" />
	
		<div class="buttons" >
    <div class="right"><a onclick="$('#payu_form').submit();" class="button"><span class="button btn btn-theme-default"><?php echo 'Pay Now'  ?></span></a></div>
  </div>
	</form>	
  <script>
   function validate()
   {
	   if($('input[name=enforce_paymethod]:checked').length<=0)
      {
         alert("payment Method Required ");
		 return false;
      }
	   
   }
  
  </script>  
	
	
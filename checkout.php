<?php
	ob_start();
	session_start();
	require_once 'config/connect.php';
	if(!isset($_SESSION['customer']) & empty($_SESSION['customer'])){
		header('location: login.php');
	}
include 'inc/header.php'; 
include 'inc/nav.php'; 
$uid = $_SESSION['customerid'];
$cart = $_SESSION['cart'];
$ship = $_POST['shipping'];
$shippingcost = 0;
if ($ship == "UPS") { $shippingcost = 5; $total = $total + $shippingcost;}

if(isset($_POST) & !empty($_POST)){
	if($_POST['agree'] == true){
		$country = filter_var($_POST['country'], FILTER_SANITIZE_STRING);
		$fname = filter_var($_POST['fname'], FILTER_SANITIZE_STRING);
		$lname = filter_var($_POST['lname'], FILTER_SANITIZE_STRING);
		$company = filter_var($_POST['company'], FILTER_SANITIZE_STRING);
		$address1 = filter_var($_POST['address1'], FILTER_SANITIZE_STRING);
		$address2 = filter_var($_POST['address2'], FILTER_SANITIZE_STRING);
		$city = filter_var($_POST['city'], FILTER_SANITIZE_STRING);
		$state = filter_var($_POST['state'], FILTER_SANITIZE_STRING);
		$phone = filter_var($_POST['phone'], FILTER_SANITIZE_NUMBER_INT);
		$payment = filter_var($_POST['payment'], FILTER_SANITIZE_STRING);
		$shipping = filter_var($_POST['shipping'], FILTER_SANITIZE_STRING);
		$zip = filter_var($_POST['zipcode'], FILTER_SANITIZE_NUMBER_INT);
        $fbalance= $_POST['fbalance'];
		$sql = "SELECT * FROM usersmeta WHERE uid=$uid";
		$res = mysqli_query($connection, $sql);
		$r = mysqli_fetch_assoc($res);
		$count = mysqli_num_rows($res);
		if($count == 1){
			//update data in usersmeta table
			$usql = "UPDATE usersmeta SET balance='$fbalance' WHERE uid=$uid";
			$ures = mysqli_query($connection, $usql) or die(mysqli_error($connection));
			if($ures){

				$total = 0;
				foreach ($cart as $key => $value) {
					//echo $key . " : " . $value['quantity'] ."<br>";
					$ordsql = "SELECT * FROM products WHERE id=$key";
					$ordres = mysqli_query($connection, $ordsql);
					$ordr = mysqli_fetch_assoc($ordres);

					$total = $total + ($ordr['price']*$value['quantity']) + $shippingcost;
				}

				echo $iosql = "INSERT INTO orders (uid, totalprice, orderstatus, shipping, paymentmode) VALUES ('$uid', '$total', 'Order Placed','$shipping', '$payment')";
				$iores = mysqli_query($connection, $iosql) or die(mysqli_error($connection));
				if($iores){
					//echo "Order inserted, insert order items <br>";
					$orderid = mysqli_insert_id($connection);
					foreach ($cart as $key => $value) {
						//echo $key . " : " . $value['quantity'] ."<br>";
						$ordsql = "SELECT * FROM products WHERE id=$key";
						$ordres = mysqli_query($connection, $ordsql);
						$ordr = mysqli_fetch_assoc($ordres);

						$pid = $ordr['id'];
						$productprice = $ordr['price'];
						$quantity = $value['quantity'];


						$orditmsql = "INSERT INTO orderitems (pid, orderid, productprice, pquantity) VALUES ('$pid', '$orderid', '$productprice', '$quantity')";
						$orditmres = mysqli_query($connection, $orditmsql) or die(mysqli_error($connection));
						//if($orditmres){
							//echo "Order Item inserted redirect to my account page <br>";
						//}
					}
				}
				unset($_SESSION['cart']);
				header("location: my-account.php");
			}
		}else{
			//insert data in usersmeta table
			$isql = "INSERT INTO usersmeta (country, firstname, lastname, address1, address2, city, state, zip, company, mobile, balance, uid) VALUES ('$country', '$fname', '$lname', '$address1', '$address2', '$city', '$state', '$zip', '$company', '$phone', '$fbalance', '$uid')";
			$ires = mysqli_query($connection, $isql) or die(mysqli_error($connection));
			if($ires){

				$total = 0;
				foreach ($cart as $key => $value) {
					//echo $key . " : " . $value['quantity'] ."<br>";
					$ordsql = "SELECT * FROM products WHERE id=$key";
					$ordres = mysqli_query($connection, $ordsql);
					$ordr = mysqli_fetch_assoc($ordres);

					$total = $total + ($ordr['price']*$value['quantity']) + $shippingcost;
				}

				echo $iosql = "INSERT INTO orders (uid, totalprice, orderstatus, shipping, paymentmode) VALUES ('$uid', '$total', 'Order Placed', '$shipping', $payment')";
				$iores = mysqli_query($connection, $iosql) or die(mysqli_error($connection));
				if($iores){
					//echo "Order inserted, insert order items <br>";
					$orderid = mysqli_insert_id($connection);
					foreach ($cart as $key => $value) {
						//echo $key . " : " . $value['quantity'] ."<br>";
						$ordsql = "SELECT * FROM products WHERE id=$key";
						$ordres = mysqli_query($connection, $ordsql);
						$ordr = mysqli_fetch_assoc($ordres);

						$pid = $ordr['id'];
						$productprice = $ordr['price'];
						$quantity = $value['quantity'];


						$orditmsql = "INSERT INTO orderitems (pid, orderid, productprice, pquantity) VALUES ('$pid', '$orderid', '$productprice', '$quantity')";
						$orditmres = mysqli_query($connection, $orditmsql) or die(mysqli_error($connection));
						//if($orditmres){
							//echo "Order Item inserted redirect to my account page <br>";
						//}
					}
				}
				unset($_SESSION['cart']);
				header("location: my-account.php");
			}

		}
	}

}

$sql = "SELECT * FROM usersmeta WHERE uid=$uid";
$res = mysqli_query($connection, $sql);
$r = mysqli_fetch_assoc($res);
?>

	
	<!-- SHOP CONTENT -->
	<section id="content">
		<div class="content-blog">
					<div class="page_header text-center">
						<h2>Shop - Checkout</h2>
						<p>Get the best kit for smooth shave</p>
					</div>
<form method="post">
<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
				    <h2>Your Balance: $ <?php echo $r['balance']; ?></h2>
				    <?php
				    /*
					<div class="billing-details">
						<h3 class="uppercase">Billing Details</h3>
						<div class="space30"></div>
							<label class="">Country </label>
							<select name="country" class="form-control">
								<option value="">Select Country</option>
								<option value="AX">Aland Islands</option>
								<option value="AF">Afghanistan</option>
								<option value="AL">Albania</option>
								<option value="DZ">Algeria</option>
								<option value="AD">Andorra</option>
								<option value="AO">Angola</option>
								<option value="AI">Anguilla</option>
								<option value="AQ">Antarctica</option>
								<option value="AG">Antigua and Barbuda</option>
								<option value="AR">Argentina</option>
								<option value="AM">Armenia</option>
								<option value="AW">Aruba</option>
								<option value="AU">Australia</option>
								<option value="AT">Austria</option>
								<option value="AZ">Azerbaijan</option>
								<option value="BS">Bahamas</option>
								<option value="BH">Bahrain</option>
								<option value="BD">Bangladesh</option>
								<option value="BB">Barbados</option>
							</select>
							<div class="clearfix space20"></div>
							<div class="row">
								<div class="col-md-6">
									<label>First Name </label>
									<input name="fname" class="form-control" placeholder="" value="<?php if(!empty($r['firstname'])){ echo $r['firstname']; } elseif(isset($fname)){ echo $fname; } ?>" type="text">
								</div>
								<div class="col-md-6">
									<label>Last Name </label>
									<input name="lname" class="form-control" placeholder="" value="<?php if(!empty($r['lastname'])){ echo $r['lastname']; }elseif(isset($lname)){ echo $lname; } ?>" type="text">
								</div>
							</div>
							<div class="clearfix space20"></div>
							<label>Company Name</label>
							<input name="company" class="form-control" placeholder="" value="<?php if(!empty($r['company'])){ echo $r['company']; }elseif(isset($company)){ echo $company; } ?>" type="text">
							<div class="clearfix space20"></div>
							<label>Address </label>
							<input name="address1" class="form-control" placeholder="Street address" value="<?php if(!empty($r['address1'])){ echo $r['address1']; } elseif(isset($address1)){ echo $address1; } ?>" type="text">
							<div class="clearfix space20"></div>
							<input name="address2" class="form-control" placeholder="Apartment, suite, unit etc. (optional)" value="<?php if(!empty($r['address2'])){ echo $r['address2']; }elseif(isset($address2)){ echo $address2; } ?>" type="text">
							<div class="clearfix space20"></div>
							<div class="row">
								<div class="col-md-4">
									<label>City </label>
									<input name="city" class="form-control" placeholder="City" value="<?php if(!empty($r['city'])){ echo $r['city']; }elseif(isset($city)){ echo $city; } ?>" type="text">
								</div>
								<div class="col-md-4">
									<label>State</label>
									<input name="state" class="form-control" value="<?php if(!empty($r['state'])){ echo $r['state']; }elseif(isset($state)){ echo $state; } ?>" placeholder="State" type="text">
								</div>
								<div class="col-md-4">
									<label>Postcode </label>
									<input name="zipcode" class="form-control" placeholder="Postcode / Zip" value="<?php if(!empty($r['zip'])){ echo $r['zip']; }elseif(isset($zip)){ echo $zip; } ?>" type="text">
								</div>
							</div>
							<div class="clearfix space20"></div>
							<label>Phone </label>
							<input name="phone" class="form-control" id="billing_phone" placeholder="" value="<?php if(!empty($r['mobile'])){ echo $r['mobile']; }elseif(isset($phone)){ echo $phone; } ?>" type="text">
						
					</div>
					*/
					?>
				</div>
				
			</div>
			
			<div class="space30"></div>
			<h4 class="heading">Your order</h4>
			
			<table class="table table-bordered extra-padding">
				<tbody>
					<tr>
						<th>Cart Subtotal</th>
						<td><span class="amount">$ <?php echo $total-$shippingcost; ?></span></td>
					</tr>
					<tr>
						<th>Shipping and Handling</th>
						<td>
						    <form method="post">
						    <select name="shipping" required onchange="this.form.submit()">
						        <option value="">Please Select Shipping Option</option>
						        <option value="Free" <?php if ($ship == "Free") { echo "selected";}?> >Free Shipping</option>
						        <option value="UPS" <?php if ($ship == "UPS") { echo "selected";}?> >UPS</option>
						    </select>
						    <?php echo ' '.$shippingcost. ' $'; ?>
						    </form>
						</td>
					</tr>
					<tr>
						<th>Order Total</th>
						<td><strong><span class="amount">$ <?php echo $total ?></span></strong> </td>
					</tr>
				</tbody>
			</table>
			
			<div class="clearfix space30"></div>
			<h4 class="heading">Remaning Balance: $ 
					<?php
					$fbalance = $r['balance'] - $total;
					echo $fbalance;
					?></h4>
					<input type="hidden" name="fbalance" value="<?php echo $fbalance; ?>">
			<div class="clearfix space20"></div>
			<input type="hidden" name="payment" value="bln">
			<?php
			/*
			<div class="payment-method">
				<div class="row">
						<div class="col-md-4">
							<input name="payment" id="radio1" class="css-checkbox" type="radio" value="cod"><span>Cash On Delivery</span>
							<div class="space20"></div>
							<p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won't be shipped until the funds have cleared in our account.</p>
						</div>
						<div class="col-md-4">
							<input name="payment" id="radio2" class="css-checkbox" type="radio"><span value="cheque">Cheque Payment</span>
							<div class="space20"></div>
							<p>Please send your cheque to BLVCK Fashion House, Oatland Rood, UK, LS71JR</p>
						</div>
						<div class="col-md-4">
							<input name="payment" id="radio3" class="css-checkbox" type="radio"><span value="paypal">Paypal</span>
							<div class="space20"></div>
							<p>Pay via PayPal; you can pay with your credit card if you don't have a PayPal account</p>
						</div>
					
				</div>
			*/
			?>
				<div class="space30"></div>
				
					<input name="agree" id="checkboxG2" class="css-checkbox" type="checkbox" value="true"><span>I've read and accept the <a href="#">terms &amp; conditions</a></span>
				
				<div class="space30"></div>
				<?php
				if ($fbalance >=0) {
				echo '<input type="submit" class="button btn-lg" value="Pay Now">';
				}
				else
				{
				    echo "<h4>You don't have enough balance</h4>";
				}
				?>
			</div>
		</div>		
</form>		
		</div>
	</section>
	 
<?php include 'inc/footer.php' ?>

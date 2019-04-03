<?php 
include("includes/header.php");
include("includes/form_handlers/settings_handler.php");
?>

<div class="wrapper" style="top:25px;margin-left:0px">
	<div class="main_column column">


		<h4>Let's switch it up. Make your profile yours! 💪</h4>
		<hr>
		<img src="assets/images/settings/settingsone.gif"/>
		<hr>
		<br>
		<?php
		echo "<img src='" . $user['profile_pic'] ."' class='small_profile_pic'>";
		?>
		<br>

		<a href="upload.php" style="font-size:12px; font-weight:bold;">Upload new picture</a> <br><br><br>
		
		<?php
		$user_data_query = mysqli_query($con, "SELECT first_name, last_name, email FROM users WHERE username='$userLoggedIn'");
		$row = mysqli_fetch_array($user_data_query);

		$first_name = $row['first_name'];
		$last_name = $row['last_name'];
		$email = $row['email'];
		?>

		<form action="settings.php" method="POST">
			<p style="font-size:13px;font-weight:bold;display:inline-block;">First Name:</p> <input type="text" name="first_name" value="<?php echo $first_name; ?>" id="settings_input" style="margin-left:5px;padding-left:5px;border:2px solid #A9A9A9;font-size:12px"><br>
			<p style="font-size:13px;font-weight:bold;display:inline-block;">Last Name:</p> <input type="text" name="last_name" value="<?php echo $last_name; ?>" id="settings_input" style="margin-left:5px;padding-left:5px;border:2px solid #A9A9A9;font-size:12px"><br>
			<p style="font-size:13px;font-weight:bold;display:inline-block;">Email:</p> <input type="text" name="email" value="<?php echo $email; ?>" id="settings_input" style="margin-left:5px;padding-left:5px;border:2px solid #A9A9A9;font-size:12px"><br>

			<?php echo $message; ?>

			<input type="submit" name="update_details" id="save_details" value="Update Details" class="info settings_submit" style="font-size:12px;font-weight:bold;background-color:#DCDCDC;color:  #808080;border-radius:5px;margin-top:5px;"><br>
		</form>
		<hr>
		<h5>Change Password</h5>
		<form action="settings.php" method="POST">
			Old Password: <input type="password" name="old_password" id="settings_input" style="margin-left:5px;padding-left:5px;border:2px solid #A9A9A9;font-size:12px"><br>
			New Password: <input type="password" name="new_password_1" id="settings_input" style="margin-left:5px;padding-left:5px;border:2px solid #A9A9A9;font-size:12px"><br>
			New Password Again: <input type="password" name="new_password_2" id="settings_input" style="margin-left:5px;padding-left:5px;border:2px solid #A9A9A9;font-size:12px"><br>

			<?php echo $password_message; ?>

			<input type="submit" name="update_password" id="save_details" value="Update Password" class="info settings_submit" style="font-size:12px;font-weight:bold;background-color:#DCDCDC;color:  #808080;border-radius:5px;margin-top:5px;"><br>
		</form>

		<h4>Close Account</h4>
		<form action="settings.php" method="POST">
			<input type="submit" name="close_account" id="close_account" value="Close Account" class="danger settings_submit" style="font-size:12px;font-weight:bold;background-color:#DCDCDC;color:  #808080;border-radius:5px;margin-top:5px;">
		</form>


	</div>

	<div class="user_details column">
		<a href="<?php echo $userLoggedIn; ?>">  <img src="<?php echo $user['profile_pic']; ?>"style="width:100%;height:20%;margin-bottom:20px"> </a>

		<div style="font-size:14px; font-weight:bold;line-height:28px;margin-right:5px;padding-bottom:10px">
			<a href="<?php echo $userLoggedIn; ?>" style="border-bottom:2px solid #C0C0C0; display:inline-block;">
			<?php 
			echo "👑 " . $user['first_name'] . " " . $user['last_name'];

			 ?>
			</a>
			<br>
			<p style="font-size:12px; font-weight:bold; line-height:18px;padding-top:15px;"><?php echo "✏️ " . "Stories: " . $user['num_posts']. "<br>"; 
			echo "💖 " . "Hearts: " . $user['num_likes'];?></p>

	<hr>

	</div>







	</div>

</div>
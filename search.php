<?php

include("includes/header.php");

if(isset($_GET['q'])) {
	$query = $_GET['q'];
}
else {
	$query = "";
}

if(isset($_GET['type'])) {
	$type = $_GET['type'];
}
else {
	$type = "name";
}
?>

<div class="wrapper" style="top:25px;margin-left:0px;">
	<div class="main_column column" id="main_column">

		<?php 
		if($query == ""){
			echo "<script type='text/javascript'>alert('Please submit something in the search!');
			window.location.href='index.php';</script>";
		}
		else {



			//If query contains an underscore, assume user is searching for usernames
			if($type == "username") 
				$usersReturnedQuery = mysqli_query($con, "SELECT * FROM users WHERE username LIKE '$query%' AND user_closed='no' LIMIT 8");
			//If there are two words, assume they are first and last names respectively
			else {

				$names = explode(" ", $query);

				if(count($names) == 3)
					$usersReturnedQuery = mysqli_query($con, "SELECT * FROM users WHERE (first_name LIKE '$names[0]%' AND last_name LIKE '$names[2]%') AND user_closed='no'");
				//If query has one word only, search first names or last names 
				else if(count($names) == 2)
					$usersReturnedQuery = mysqli_query($con, "SELECT * FROM users WHERE (first_name LIKE '$names[0]%' AND last_name LIKE '$names[1]%') AND user_closed='no'");
				else 
					$usersReturnedQuery = mysqli_query($con, "SELECT * FROM users WHERE (first_name LIKE '$names[0]%' OR last_name LIKE '$names[0]%') AND user_closed='no'");
			}

			//Check if results were found 
			if(mysqli_num_rows($usersReturnedQuery) == 0){

				echo "<img src='assets/images/icons/sad.gif' style='margin-bottom:20px'/>" . "<br>" . "We can't find anyone with a " . $type . " like: " .$query;
				echo "<p id='grey'>Try searching for another person!</p>";
			}else 
				echo mysqli_num_rows($usersReturnedQuery) . " results found: <br> <br>";


			while($row = mysqli_fetch_array($usersReturnedQuery)) {
				$user_obj = new User($con, $user['username']);

				$button = "";
				$mutual_friends = "";

				if($user['username'] != $row['username']) {

					//Generate button depending on friendship status 
					if($user_obj->isFriend($row['username']))
						$button = "<input type='submit' name='" . $row['username'] . "' class='danger' value='Remove Friend'>";
					else if($user_obj->didReceiveRequest($row['username']))
						$button = "<input type='submit' name='" . $row['username'] . "' class='warning' value='Respond to request'>";
					else if($user_obj->didSendRequest($row['username']))
						$button = "<input type='submit' class='default' value='Request Sent'>";
					else 
						$button = "<input type='submit' name='" . $row['username'] . "' class='success' value='Add Friend'>";

					$mutual_friends = $user_obj->getMutualFriends($row['username']) . " friends in common";


					//Button forms
					if(isset($_POST[$row['username']])) {

						if($user_obj->isFriend($row['username'])) {
							$user_obj->removeFriend($row['username']);
							header("Location: http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]");
						}
						else if($user_obj->didReceiveRequest($row['username'])) {
							header("Location: requests.php");
						}
						else if($user_obj->didSendRequest($row['username'])) {

						}
						else {
							$user_obj->sendRequest($row['username']);
							header("Location: http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]");
						}

					}



				}

				echo "<div class='search_result'>
						<div class='searchPageFriendButtons'>
							<form action='' method='POST'>
								" . $button . "
								<br>
							</form>
						</div>


						<div class='result_profile_pic'>
							<a href='" . $row['username'] ."'><img src='". $row['profile_pic'] ."' style='height: 100px;'></a>
						</div>

							<a href='" . $row['username'] ."'> " . $row['first_name'] . " " . $row['last_name'] . "
							<p id='grey'> " . $row['username'] ."</p>
							</a>
							<br>
							" . $mutual_friends ."<br>

					</div>
					<hr id='search_hr'>";

			} //End while
		}


		?>



	</div>


	<div class="user_details column">

		<h4>What's Poppin' 🌎</h4>

		<div class="trends">
			<?php 
			$query = mysqli_query($con, "SELECT * FROM trends ORDER BY hits DESC LIMIT 9");

			foreach ($query as $row) {
				
				$word = $row['title'];
				$word_dot = strlen($word) >= 20 ? "..." : "";

				$trimmed_word = str_split($word, 14);
				$trimmed_word = $trimmed_word[0];

				echo "<div style'padding: 1px'>";
				echo $trimmed_word . $word_dot;
				echo "<br></div><br>";


			}

			?>
		</div>


	</div>


	<div class="user_details column">
	
		<div>
				<h4>The Skinny</h4>

				<p style="line-height:17pt">Subscribe to our newsletter, the Skinny, for everything you need to know about what happened this week around the world. Every Monday and Friday at 6am EST.</p>
		</div>
	</div>


</div>

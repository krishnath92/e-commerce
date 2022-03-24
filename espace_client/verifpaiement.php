<?php
/* FORMULAIRE D'INSCRIPTION */
session_start();


if(isset($_POST["ok"])){



    if ($_SESSION["cle"] == $_POST['cle']){

        unset($_SESSION["info"]);
        unset($_SESSION["cle"]);
        header('location: commande.php');
        exit();
    }

    else {
        header('location: verifpaiement.php?error=1&message=La clé est fausse.');
    }

}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Stunning outfit Shop</title>
	<!--meta name="viewport" content="width=device-width"-->
	<link rel="stylesheet" type="text/css" href="../design/formulaires.css">
	<link rel="stylesheet" type="text/css" href="../design/footerFormulaires.css">
	<link rel="icon" type="image/pngn" href="../img/favicon.png">
</head>
<body>

	<header>
      	<div id="brand">
         	<a href= "accueilCommun.php?accueil=1" ><img src="../img/logo.png" alt="LOGO" /></a>
      	</div>
   	</header>

	<section>
		<div id="login-body">
			<h1>Verification</h1>


			<?php if(isset($_GET['error'])){

				if(isset($_GET['message'])) {

					echo'<div class="alert error">'.htmlspecialchars($_GET['message']).'</div>';

				}

			}  ?>

			<form method="post" action="verifpaiement.php" >


				<!--code verif -->
				<div class = "input">
					<label for="zip" class="form-label">Rentrez votre clé</label>
					<input type="text" name="cle" placeholder="Votre clé" required />
				</div>

				<button type="submit" name = "ok" class>Valider</button>
			</form>

		</div>
	</section>

	<?php include('../src/boutiqueFooter.php'); ?>
	<script src ="../js/script.js"> </script>
</body>
</html>
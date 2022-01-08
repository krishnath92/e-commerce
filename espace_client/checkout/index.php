<?php 
session_start();
//include('../../src/log.php');

if(!empty($_POST['email']) ){

  require('../../src/connect.php');

  // VARIABLES
  $email 				= htmlspecialchars($_POST['email']);

  // ADRESSE EMAIL VALIDE
  if(!filter_var($email, FILTER_VALIDATE_EMAIL)){

    header('location: index.php?error=1&message=Votre adresse email est invalide.');
    exit();

  }

  // EMAIL DEJA UTILISEE
  $req = $db->prepare("SELECT count(*) as numberEmail FROM membres WHERE email = ?");
  $req->execute(array($email));

  while($email_verification = $req->fetch()){

    if($email_verification['numberEmail'] != 0){
      $mdpRecup = $db->query('SELECT password FROM membres WHERE email = ? ');
      echo"Vous êtes déjà membre";
      echo $mdpRecup;
      exit();

    }
    else {
      echo"Vous n'êtes presque membre";
      if(!empty($_POST['password']) && !empty($_POST['password_two']) ){
        // VARIABLES
        $password 			= htmlspecialchars($_POST['password']);
        $password_two		= htmlspecialchars($_POST['password_two']);

        // PASSWORD = PASSWORD TWO
        if($password != $password_two){
          header('location: index.php?error=1&message=Vos mots de passe ne sont pas identiques.');
          exit();

        }
        // HASH
        $secret = sha1($email).time();
        $secret = sha1($secret).time();

        // CHIFFRAGE DU MOT DE PASSE
        $password = "aq1".sha1($password."123")."25";

        // ENVOI
        $req = $db->prepare("INSERT INTO membres(email, password, secret) VALUES(?,?,?)");
        $req->execute(array($email, $password, $secret));

        if(!empty($_POST['prenom']) && !empty($_POST['nom']) && !empty($_POST['birthDate'])
         && !empty($_POST['adresse1']) && !empty($_POST['pays']) && !empty($_POST['ville'])  
          && !empty($_POST['codePostal']) ){
          $prenom = $_POST['prenom'];
          $nom = $_POST['nom'];
          $date_N = $_POST['birthDate'];
          $addresse1= $_POST['adresse1'];
          $pays = $_POST['pays'];
          $ville = $_POST['ville'];
          $codePostal = $_POST['codePostal'];

            // ENVOI
          $req = $db->prepare("INSERT INTO membres(prenom, nom, date_naissance, adresse, pays, ville, code_postal) VALUES(?,?,?, ?,?,?, ?)");
          $req->execute(array($prenom, $nom, $date_N, $addresse1, $pays, $ville, $codePostal));
          
          exit();
        }
        
      }
    }

  }
  if (!empty($_POST['adresse2']) ) {
    $addresse2 = $_POST['adresse2'];
    $req = $db->prepare("INSERT INTO membres(adresse2) VALUES(?)");
    $req->execute(array($addresse2));
  }
  
  echo"inscription réussie";
  header('location: index.php?success=1');

  
}
?>

<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.87.0">
    <title>Panier</title>

    <link rel="icon" type="image/png" href="../../img/favicon.png">
    <link href="../../design/boutiqueFooter.css" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="../../src/bootstrap-5.1.0-examples/assets/dist/css/bootstrap.min.css" rel="stylesheet">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
    
<div class="container">
  <main>
    <!--Entête-->
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="../../img/logo.png" alt="" width="72" height="57">
      <h2>Formulaire de paiement </h2>
      <!--p class="lead">
        Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.
      </p-->
    </div>
    
    <div class="row g-5">
      <!-- Colonne de droite - Le Panier d'articles-->
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">Votre panier</span>
          <span class="badge bg-primary rounded-pill">3</span>
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Premier article</h6>
              <small class="text-muted">Description succincte</small>
            </div>
            <span class="text-muted">$12</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Deuxième article</h6>
              <small class="text-muted">Description succincte</small>
            </div>
            <span class="text-muted">$8</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Troisième article</h6>
              <small class="text-muted">Description succincte</small>
            </div>
            <span class="text-muted">$5</span>
          </li>
          <li class="list-group-item d-flex justify-content-between bg-light">
            <div class="text-success">
              <h6 class="my-0">Code promo</h6>
              <small>EXAMPLECODE</small>
            </div>
            <span class="text-success">−$5</span>
          </li>
          <li class="list-group-item d-flex justify-content-between">
            <span>Total (USD)</span>
            <strong>$20</strong>
          </li>
        </ul>

        <form class="card p-2">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Code promo">
            <button type="submit" class="btn btn-secondary">Appliquer</button>
          </div>
        </form>
      </div>

      <!-- Colonne de gauche - Les champs-->
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">Adresse de facturation</h4>
        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <!--Prénom-->
            <div class="col-sm-6">
              <label for="firstName" class="form-label">Prénom</label>
              <input name="prenom" type="text" class="form-control" id="firstName" placeholder="" value="" required>
              <div class="invalid-feedback">
                Un prénom valide est requis.
              </div>
            </div>
            <!--Nom-->
            <div class="col-sm-6">
              <label for="lastName" class="form-label">Nom de famille</label>
              <input name="nom" type="text" class="form-control" id="lastName" placeholder="" value="" required>
              <div class="invalid-feedback">
              Un nom de famille valide est requis.
              </div>
            </div>

            <!--div class="col-12">
              <label for="username" class="form-label">Username <span class="text-muted">(Optional)</span></label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input type="text" class="form-control" id="username" placeholder="Username" required>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div-->

            <!--Email-->
            <div class="col-12">
              <label for="email" class="form-label">Email </label>
              <input name="email" type="email" class="form-control" id="email" placeholder="you@example.com">
              <div class="invalid-feedback">
                Veuillez saisir une adresse électronique valide pour recevoir les mises à jour des expéditions.
              </div>
            </div>

            <!--Mot de passe-->
            <div class="col-12">
              <label for="email" class="form-label">Mot de passe <span class="text-muted">Si vous n'avez pas de compte</span></label>
              <input id="password" name="password" type="password" class="form-control" placeholder="8 caractères minimum">
              <input type="checkbox" onclick = "Afficher3()"> Afficher<br/><br/>
              <div class="invalid-feedback">
                Test
              </div>
            </div>
            <!--Mot de passe 2-->
            <div class="col-12">
              <label for="email" class="form-label">Confirmation mot de passe </label>
              <input id="password_two" name="password_two" type="password" class="form-control" placeholder="Retapez votre mot de passe">
              <input type="checkbox" onclick = "Afficher4()"> Afficher<br/><br/>
              <div class="invalid-feedback">
                Vos mots de passe ne sont pas identiques.
              </div>
            </div>

            <!--Date naissance-->
            <div class="col-12">
              <label for="email" class="form-label">Date de naissance </label>
              <input name="birthDate" type="date" class="form-control" placeholder="Date de naissance">
              <div class="invalid-feedback">
                Format incorrect.
              </div>
            </div>
            <!--Adresse Principale-->
            <div class="col-12">
              <label for="address" class="form-label">Addresse</label>
              <input name="adresse1" type="text" class="form-control" id="address" placeholder="1234 Main St" required>
              <div class="invalid-feedback">
              Veuillez saisir votre adresse de livraison.
              </div>
            </div>
            <!--deuxième adresse -->
            <div class="col-12">
              <label for="address" class="form-label">Addresse 2 <span class="text-muted">(Optionel)</span></label>
              <input name ="adresse2" type="text" class="form-control" id="address2" placeholder="Apartment or suite">
            </div>

            <!--Pays -->
            <div class="col-md-5">
              <label for="country" class="form-label">Pays</label>
              <select name="pays" class="form-select" id="country" required>
                <option value="">Choisir...</option>
                <option>France</option>
                <option>Angleterre</option>
                <option>Espagne</option>
                <option>Etats-Unis</option>
              </select>
              <div class="invalid-feedback">
                Veuillez sélectionner un pays valide.
              </div>
            </div>
            <!--Ville -->
            <div class="col-md-4">
              <label for="state" class="form-label">Ville</label>
              <select name="ville" class="form-select" id="state" required>
                <option value="">Choisir...</option>
                <option>Rueil-Malmaison</option>
                <option>Nanterre</option>
                <option>Vélizy</option>
                <option>Puteaux</option>
              </select>
              <div class="invalid-feedback">
                Please provide a valid state.
              </div>
            </div>
            <!--Code postal -->
            <div class="col-md-3">
              <label for="zip" class="form-label">Code postal</label>
              <input name="codePostal" type="text" class="form-control" id="zip" placeholder="" required>
              <div class="invalid-feedback">
              Code postal obligatoire.
              </div>
            </div>
          </div>

          <hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">L'adresse de livraison est la même que l'adresse de facturation.</label>
          </div>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info" checked>
            <label class="form-check-label" for="save-info">Enregistrer cette information pour la prochaine fois</label>
          </div>

          <hr class="my-4">

          <h4 class="mb-3">Paiement</h4>
          
          <!--Choix de la carte-->
          <div class="my-3">
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
              <label class="form-check-label" for="credit">Carte de crédit</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="debit">Carte de débit</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="paypal">PayPal</label>
            </div>
          </div>

          <!--la carte-->
          <div class="row gy-3">
            <!--Nom de la carte-->
            <div class="col-md-6">
              <label for="cc-name" class="form-label">Nom de la carte</label>
              <input type="text" class="form-control" id="cc-name" placeholder="" required>
              <small class="text-muted">Nom complet tel qu'il figure sur la carte</small>
              <div class="invalid-feedback">
                Le nom sur la carte est exigé
              </div>
            </div>
            <!--Numéro de carte de crédit-->
            <div class="col-md-6">
              <label for="cc-number" class="form-label">Numéro de carte de crédit</label>
              <input type="text" class="form-control" id="cc-number" placeholder="" required>
              <div class="invalid-feedback">
                Le numéro de carte de crédit est exigé.
              </div>
            </div>
            <!--Expiration-->
            <div class="col-md-3">
              <label for="cc-expiration" class="form-label">Expiration</label>
              <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
              <div class="invalid-feedback">
                Date d'expiration requise
              </div>
            </div>
            <!--Code sécurité CVV-->
            <div class="col-md-3">
              <label for="cc-cvv" class="form-label">CVV</label>
              <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
              <div class="invalid-feedback">
                Code de sécurité exigé
              </div>
            </div>
          </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">Poursuivre le paiement</button>
        </form>
      </div>
    </div>
  </main>

  <!--footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2021 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer-->

</div>

<!-- Bouton RETOUR EN HAUT DE PAGE -->
<div id="scroll_to_top">
    <a href="#top"><img src="../../img/to_top.png" title="Retourner en haut" /></a>
  </div>

       <!-- CONTACT -->
    <section >
      <?php require("../../src/boutiqueFooter.php"); ?>
    </section>


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

      <script src="form-validation.js"></script>
      <script src="../../js/script.js"></script>

      
  </body>
</html>

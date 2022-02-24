<?php 
session_start();
require('../src/connect.php');
$serveur="localhost";
$login="root";
$mdp="";
$bd = "projet-ecommerce-v12";
$tables = "membres";

$total = $_POST['total'];



if(isset($_SESSION["user"])){

    foreach ($_POST as $k => $v) $$k = $v;
    $requser = $db->prepare("SELECT * FROM membres WHERE email = ?");
    $requser->execute(array($_SESSION['user']));
    $user = $requser->fetch();

    $idclient = $user["id_client"];

}

foreach($_SESSION["shopping_cart"] as $keys => $values){
    $ref = $values['item_ref'];
    $quantite = $values['item_quantite'];

    $reqfacture = "INSERT INTO `factures` (`id_facture`, `id_client`, `prix_total`, `reference`, `quantite`) VALUES (NULL, '$idclient', '$total', '$ref', '$quantite')";
    $connexion=mysqli_connect($serveur,$login,$mdp)
    or die("Connexion impossible au serveur $serveur pour $login");

    $conn = mysqli_select_db($connexion,$bd)
    or die("Impossible d'accéder à la base de données");

    mysqli_query($connexion,$reqfacture);
}


$requete3 ="SELECT `email` FROM `membres` WHERE id_client = '$idclient'";
$resultat3 = mysqli_query($connexion,$requete3);
$result3 = implode(mysqli_fetch_row($resultat3));

if((mysqli_num_rows($resultat3)!=0)){ //Si le login existe
	 $to      = 'receveurprojet92@gmail.com';
     $subject = 'Recapitulatif de commande';
     $message = 'Bonjour ! Vous avez commander : '.$qty.' '.$name.' pour un total de '.$total.'€. Veuillez rentrer en contact avec le mail :'.$result3;
     $headers = 'From: petronijevicalekss@gmail.com' . "\r\n" .
     'Reply-To: webmaster@example.com' . "\r\n" .
     'X-Mailer: PHP/' . phpversion();
     mail($to, $subject, $message, $headers);
     unset($_SESSION["shopping_cart"]);
     header("Location:../espace_commun/accueilCommun.php?accueil=1");
}
?>
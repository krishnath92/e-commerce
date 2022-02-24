<?php

use Dompdf\Dompdf;
use Dompdf\Options;
require("../src/connect.php");

ob_start();
require_once "PDFContent.php";
$html = ob_get_contents();
ob_end_clean();
die($html);

if(isset($_SESSION["user"])){

    foreach ($_POST as $k => $v) $k = $v;
    $requser = $db->prepare("SELECT * FROM membres WHERE email = ?");
    $requser->execute(array($_SESSION['user']));
    $user = $requser->fetch();

    $email = $user["email"];
    $civil = $user["civilite"];
    $nom = $user["nom"];
    
  
}




require_once "../src/dompdf/autoload.inc.php" ;







$dompdf = new Dompdf();
$dompdf->loadHtml($html);
$dompdf->setPaper("A4","portrait");


$nom = "Récapitulatif de commande";
$dompdf->render();
$dompdf->stream($nom);















?>
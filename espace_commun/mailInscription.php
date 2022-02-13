<?php

$receiver = "receveurprojet92@gmail.com";
$subject = "test d'envoie";
$body = "Je t'envoie un mail fdp";
$sender = "From:testpourprojet92@gmail.com";

if (mail($receiver,$subject,$body,$sender)){
    echo "Email sent to $receiver";
}else{
    echo "failed";
}

?>
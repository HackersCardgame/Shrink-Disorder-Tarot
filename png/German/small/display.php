<html>
  <head>
    <meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="./small-style.css" target="_blank">


  </head>
  <body bgcolor="#FFF">

<?php

   $files = glob("*.*");

  for ($i=0; $i<count($files); $i++)

{

$image = $files[$i];
$supported_file = array(
    'gif',
    'jpg',
    'jpeg',
    'png',
    'svg'
);

$ext = strtolower(pathinfo($image, PATHINFO_EXTENSION));
if (in_array($ext, $supported_file)) {
//    print $image ."<br />";

//    echo '<a href="./'.$image .'" target=_blank><img style="margin:5px" width=250 src="'.$image .'" ></a>';
 echo '<iframe frameBorder="0" text-align=center height=330 width=230 src="./display2.php?front='.$image .'&back=back.png"></iframe> ';



} else {
    continue;
 }

}

?>
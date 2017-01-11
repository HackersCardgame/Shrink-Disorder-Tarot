



<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  
  <!-- disable zooming -->
  <meta name="viewport" content="initial-scale=1.0, user-scalable=0" />
  
  <title>cards</title>
  
  <link rel="stylesheet" href="./css/style.css" media="screen" />

    <style media="screen">
    .container {
      width: 200px;
      height: 260px;
      position: relative;
      margin: 0 auto 40px;
      border: 1px solid #CCC;
      -webkit-perspective: 800px;
         -moz-perspective: 800px;
           -o-perspective: 800px;
              perspective: 800px;
    }

    #card {
      width: 100%;
      height: 100%;
      position: absolute;
      -webkit-transition: -webkit-transform 1s;
         -moz-transition: -moz-transform 1s;
           -o-transition: -o-transform 1s;
              transition: transform 1s;
      -webkit-transform-style: preserve-3d;
         -moz-transform-style: preserve-3d;
           -o-transform-style: preserve-3d;
              transform-style: preserve-3d;
    }

    #card.flipped {
      -webkit-transform: rotateY( 180deg );
         -moz-transform: rotateY( 180deg );
           -o-transform: rotateY( 180deg );
              transform: rotateY( 180deg );
    }

    #card figure {
      display: block;
      height: 100%;
      width: 100%;
      line-height: 260px;
      color: white;
      text-align: center;
      font-weight: bold;
      font-size: 140px;
      position: absolute;
      -webkit-backface-visibility: hidden;
         -moz-backface-visibility: hidden;
           -o-backface-visibility: hidden;
              backface-visibility: hidden;
    }

    #card .front {
      background: white;
    }

    #card .back {
      background: white;
      -webkit-transform: rotateY( 180deg );
         -moz-transform: rotateY( 180deg );
           -o-transform: rotateY( 180deg );
              transform: rotateY( 180deg );
    }
  </style>

</head>
<body  bgcolor="#FFF">
  <section class="container">
    <div id="card">
      <figure id="flip" class="front"><img src="<?php echo $_GET["back"] ?>" width=200></figure>
      <figure id="flip" class="back"><img src="<?php echo $_GET["front"] ?>" width=200></figure>
    </div>
  </section>
  <script src="./js/utils.js"></script><script src="./js/flip-card.js"></script>
<script>
var myVar = setInterval(function(){ myTimer() }, <?php echo(rand(7000,30000)); ?>);

function myTimer() {
  document.getElementById('flip').click();
}
</script>

</body>
</html>

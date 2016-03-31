<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Your Chinese Stamper</title>

<!-- Bootstrap core CSS -->
<link href="stylesheets/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="stylesheets/main.css" rel="stylesheet">
<link href="font-awesome.min.css" rel="stylesheet">
<link href="animate-custom.css" rel="stylesheet">
<link href='https://fonts.useso.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.useso.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="libs/modernizr.custom.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body data-spy="scroll" data-offset="0" data-target="#navbar-main">
<div id="navbar-main">
  <!-- Fixed navbar -->
  <div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <a class="navbar-brand" href="#home">Your Chinese Stamper</a> </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
                          	<li><a class="smoothScroll">xiezihan</a></li>

          <li> <a href="stamperup.html" class="smoothScroll"> Stamper Up</a></li>
          <li> <a href="customed.html" class="smoothScroll"> Customed</a></li>
          <li> <a href="login.html" class="smoothScroll"> Login</a></li>
        </ul>
      </div>
      <!--/.nav-collapse -->
    </div>
  </div>
</div>

<!-- ==== HEADERWRAP ==== -->
<div id="headerwrap">
  <header class="clearfix">
    <h1 style="color: #212123">Want a Chinese stamper?</h1>
    <p style="color: #212123"><br>
      Do you want a Chinese stamper with your own Chinese name on it?</p>
    	<a href="#Stamper Up!!!" class="smoothScroll btn btn-lg">Stamper Up!!!</a> </header>
    	<a href="#Custom One by Designers" class="smoothScroll btn btn-lg">Custom One by Designers</a> </header>
    	
</div>

	`<div class="col-md-4 sap">
				<h3>Universities</h3>
				<div class="cur-right" id="peoples">
						
		</div>
	</div>
<!-- /headerwrap -->



<!-- container -->

<div id="footerwrap" style="background-color:#f6efe9">
  <div class="container">
    <div class="col-md-4 amet-sed " style="background-color:#f6efe9">
				<h4>Connect Information</h4>
				<p><a href="#">${contact}</a></p>
				<p>						
					<#if contact=="Contact Information">
						This is my contact information
					<#elseif contact=="Information">
						This is contact information
					<#else>
						No information
					</#if>
				<p>		
				
				<button id="get-info-btn">Show contact information</button>
				<ul class="social-in" id="my-info" style="list-style:none;">
				</ul>
				</div>
				<div style="background-color:#f6efe9">
					<ul id="list_info">
					<#list lst as item>
						<li><a>${item}</a></li>
					</#list>
				</ul>
				</div>
				<div id="tellUs">
					<input type="text" name="info" />
					<button>add</button>
				</div>
    <div class="row">
      <div class="col-md-7"> <span class="copyright" style="margin-left:30px">Copyright &copy; Zihan Xie (zix8@pitt.edu)</span> </div>
      <div class="col-md-5">
        <ul class="list-inline social-buttons">
          <li><a href="#"><i class="fa fa-twitter"></i></a> </li>
          <li><a href="#"><i class="fa fa-facebook"></i></a> </li>
          <li><a href="#"><i class="fa fa-google-plus"></i></a> </li>
          <li><a href="#"><i class="fa fa-linkedin"></i></a> </li>
        </ul>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="https://gsgd.co.uk/sandbox/jquery/easing/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/smoothscroll.js"></script>
<script type="text/javascript" src="libs/jquery-func.js"></script>
 <script>
  
  	function getMyInfo() {
  		var $btn = $("#get-info-btn");
  		$btn.click(function(){
  			$.get("/api/my_info", function( data ) {
			  console.log(data);
			  var dataJson = JSON.parse(data);
			  var $container = $('#my-info')
			  for (var key in dataJson) {
			  	var $li = $('<li>');
			  	$li.html(dataJson[key]);
			  	$container.append($li);
			  }
			  $btn.hide();
			  
			});
  		})
  	}
  	
  	function addMusicInfo() {
  		var $container = $('#tellUs');
  		var $btn = $container.find('button');
  		var $input = $container.find('input');

  		$btn.click(function(){
	  		$.post( "/api/add_tell_us", { info: $input.val()})
			  .done(function( data ) {
			    data = JSON.parse(data);
			    $('#list_info').append('<li><a>'+ data.info +'</a></li>')
			  });
	  			
	  		})
  	}
  	
  	function getPeoplesInfo() {
  		var $container = $('#peoples');
  		console.log('get');
  		$.get( "/api/peoples", function( xml ) {
  	      var $xml = $(xml);
  	      var $peoples = $xml.find('people');
		  $.each( $peoples, function() {
			console.log(this);
		  	var $product = $('<div class="product">');
		  	var $a = $('<a href="#" class="fashion">');
		  	$product.append($a);
		  	
		  	var $grid = $('<div class="grid-product">');
		  	var $p = $('<p>'+ $(this).find('name').html() +'</p>');
		  	$grid.append($p);
		  	$product.append($grid);
		  	$product.append($('<div class="clearfix">'));
		  	
		  	
		  	
		  	$container.append($product);
		  });

		});
  	}
  	
  	getMyInfo();
  	addMusicInfo();
  	getPeoplesInfo();
  </script>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<%
session.invalidate();
%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EasyCourier - Home</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">EasyCourier</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="about.html">About</a>
                    </li>
                    <li>
                        <a href="services.html">Services</a>
                    </li>
                    <li>
                        <a href="contact.html">Contact</a>
                    </li>
					 <li>
                        <a href="<%=request.getContextPath()%>/resource/login/loginPage">Sign Up / Login</a>
                    </li>
                   
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

	<div class="container-fluid" style="background-color:#337ab7">
		<div class="col-lg-12 text-center" style="padding:40px;padding-bottom:20px">
			<img src="img\banner.png" alt="banner" />
		</div>
	
	</div>
    

    <!-- Page Content -->
    <div class="container-fluid" style="background-color:#337ab7">

        <!-- Marketing Icons Section -->
        <div class="row" style="padding:0 17%;">
            
            <div class="col-md-4 ">
                <div class="panel panel-green text-center">
                   
                    <div class="panel-body">
                        <i class="fa fa-fw fa-file-text" style='font-size:72px'></i>
                    </div>
					<div class="panel-footer">
                        <h4> Submit Request</h4>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-yellow text-center">
                   
                    <div class="panel-body">
                        <i class="fa fa-fw fa-archive" style='font-size:72px'></i>
                    </div>
					<div class="panel-footer">
                        <h4> Parcel Pickup </h4>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-red text-center">
                   
                    <div class="panel-body">
                        <i class="fa fa-fw fa-truck" style='font-size:72px'></i>
                    </div>
					<div class="panel-footer">
                        <h4> Initiate Delivery</h4>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
	</div>
        
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body>

</html>

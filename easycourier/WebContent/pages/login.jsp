<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=request.getContextPath()%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
            <h3 class="panel-title" style="color:green;font-weight:bold;">${successMessage}</h3>
            <h3 class="panel-title" style="color:red;font-weight:bold;">${errorMessage}</h3>
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" id="loginForm" action="auth" method="post">
                            <fieldset>
                            	<div class="form-group">
                                    <select class="form-control" id="userTypeDropdown" name="userType">
	                                    <option value="customer">Customer</option>
	                                    <option value="admin">Admin</option>
	                                    <option value="agent">Courier Agent</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" id="email" name="email" type="email" value="" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" id="password" name="password" type="password" value="">
                                </div>
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="#" id="loginBtn" class="btn btn-lg btn-success btn-block">Login</a>
                                <br/>
                                <a href="registerPage">Click here to register</a> 
                                <br/>
                                <a style="display:none" href="customer_registration.jsp">Forgot password</a>
                                
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>s

    <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=request.getContextPath()%>/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/dist/js/sb-admin-2.js"></script>
    
    <script>
    $(document).ready(function() {
        $('#loginBtn').click(function(){
        	var userType=$("#userTypeDropdown").val();
        	var email=$("#email").val();
        	var password=$("#password").val();
        	
        	if(userType!="" && email!="" && password!=""){
        		$("#loginForm").submit();
        	}else{
        		alert("Please select all required fields");
        	}
        	/* 
        	
        	if(userType=="customer")
        		$(this).attr("href","booking.jsp");
        	else if(userType=="admin")
        		$(this).attr("href","courierrequests.jsp");
        	else if(userType=="agent")
        		$(this).attr("href","agentcourierrequests.jsp");
        	else
        		alert("Please select user type");
        	 */
        	 
        });
    });
    </script>

</body>

</html>

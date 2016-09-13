<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EasyCourier - Customer Registration</title>

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
                 <h3 class="panel-title" style="color:red;font-weight:bold;">${errorMessage}</h3>
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please enter following details to complete registration</h3>
                    </div>
                    <div class="panel-body">
                        <form:form role="form" method="post" modelAttribute="customer" action="registerUser">
                            <fieldset>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Enter First Name" path="firstName" name="firstName" type="text" />
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Enter Last Name" path="lastName" name="lastName" type="text" />
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Enter Email Id" path="emailId" name="emailId" type="email" />
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Enter Phone Number" path="phoneNo" name="phoneNo" type="text"/>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Enter Pin" path="pincode" name="pincode" type="text" />
                                </div>
                                <div class="form-group">
                                    <form:password class="form-control" placeholder="Choose Password" path="password" name="password" />
                                </div>
                                <div class="form-group">
                                    <form:password class="form-control" placeholder="Confirm Password" path="confirmpassword" name="password" value=""/>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Enter Address" path="address" name="address" type="text" />
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" name="submit"  value="Register" class="btn btn-lg btn-success btn-block"/>
                            </fieldset>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=request.getContextPath()%>/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/dist/js/sb-admin-2.js"></script>

</body>

</html>

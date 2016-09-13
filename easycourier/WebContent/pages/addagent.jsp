<%@page import="java.util.*,com.easycourier.domain.Employee" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
Employee employee=(Employee)session.getAttribute("userObject");
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EasyCourier - Courier Pickup Requests</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=request.getContextPath()%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="<%=request.getContextPath()%>/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="<%=request.getContextPath()%>/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

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

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">EasyCourier - Admin Portal</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
					<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <span>Welcome <b><%=employee.getFirstName() %></b></span>
                    </a>
                    <!-- /.dropdown-user -->
                </li>
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       
                        <li>
                            <a href="/easycourier/resource/admin/allPickupRequests"><i class="fa fa-calendar fa-fw"></i> Courier Pickup Requests</a>
                        </li>
                        <li>
                            <a href="/easycourier/resource/admin/addAgentPage"><i class="fa fa-user-plus fa-fw"></i> Register Courier Agent</a>
                        </li>
                        <li>
                            <a href="/easycourier/resource/admin/viewAgentPage"><i class="fa fa-book fa-fw"></i> View Courier Agents</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-user fa-fw"></i> Your Profile</a>
                        </li>
                        <li>
                        	<a href="<%=request.getContextPath()%>/index.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
           <br/>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                     <div class="panel panel-default">
                        <div class="panel-heading">
                            Add New Courier Agent
                        </div>
                        <div class="panel-body">
                        	<div class="row"> 
                        			<%
                        			  String successMsg=(String)request.getAttribute("successMessage");
                        			  String errorMsg=(String)request.getAttribute("errorMessage");
                        			%>
                        			
                        			<%if(successMsg!=null){ %>
	                        			<div class="alert alert-success">
										  <strong>Success!</strong> <%=successMsg %>.
										</div>
									<%} %>
									
									<%if(errorMsg!=null){ %>
										<div class="alert alert-danger">
										  <strong>Failed!</strong> <%=errorMsg %>.
										</div>
									<%} %>
									
									
									
                        		</div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <form:form role="form" method="post" modelAttribute="employee" action="registerAgent">
                                    	<div class="form-group">
                                            <label>Agent First Name</label>
                                            <form:input path="firstName" name="firstName" class="form-control" type="text"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Agent Last Name</label>
                                            <form:input path="lastName" name="lastName" class="form-control" type="text"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Agent Gender</label>
                                            <form:select path="gender" class="form-control">
		                                        <form:option value="M">Male</form:option>
		                                        <form:option value="F">Female</form:option>
		                                    </form:select>
                                        </div>
                                        <div class="form-group">
                                            <label>Agent Phone No</label>
                                            <form:input path="phoneno" name="phoneno" class="form-control" type="text"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Agent Email Id</label>
                                            <form:input path="email" name="email" class="form-control" type="text"/>
                                        </div>
                                    	<div class="form-group">
                                            <label>Agent Address</label>
                                            <form:textarea path="address" class="form-control" rows="3"></form:textarea>
                                        </div>
                                    	
                                    	
                                        <button type="submit" class="btn btn-success">Save</button>
                                        <button type="reset" class="btn btn-danger">Reset</button>
                                        
                                        
                                        
                                        
                                    </form:form>
                                </div>
                                 <div class="col-lg-6 text-center">
                                 	<img src="<%=request.getContextPath()%>/img/courier-guy.png"/>
                                 </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
             
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

   <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=request.getContextPath()%>/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="<%=request.getContextPath()%>/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/dist/js/sb-admin-2.js"></script>
    
     <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/dist/js/sb-admin-2.js"></script>

</body>

</html>

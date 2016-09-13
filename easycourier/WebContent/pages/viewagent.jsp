<%@page import="java.util.*,com.easycourier.domain.Employee" %>
<%
Employee employee=(Employee)session.getAttribute("userObject");
List<Map<String,Object>> agents=(List<Map<String,Object>>)request.getAttribute("agents");
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
                            View Courier Agents
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Agent ID</th>
                                        <th>Agent Name</th>
                                        <th>Email</th>
                                        <th>Gender</th>
                                        <th>Phone No</th>
                                        <th>Address</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                 <%
                                	 int cnt=0;
                                	for(Map<String,Object> agent : agents){ 
                                	 String style=(cnt++/2==0)?"even":"odd";
                                	%>
                                    <tr class="<%=style%> gradeX">
                                        <td><%=agent.get("EMPLOYEE_ID") %></td>
                                        <td><%=agent.get("FULL_NAME") %></td>
                                        <td><%=agent.get("EMP_EMAIL_ID") %></td>
                                        <td><%=agent.get("EMP_GENDER") %></td>
                                        <td><%=agent.get("EMP_PHONE_NO") %></td>
                                        <td><%=agent.get("EMP_ADDRESS") %></td>
                                    </tr>
                                    <%} %>
                                    
                                    
                                </tbody>
                            </table>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
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

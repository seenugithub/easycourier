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
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    

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
                <a class="navbar-brand" href="index.html">EasyCourier - Agent Portal</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
					<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <span>Welcome <b>Seenuvasan</b></span>
                    </a>
                    <!-- /.dropdown-user -->
                </li>
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       
                        <li>
                            <a href="agentcourierrequests.jsp"><i class="fa fa-calendar fa-fw"></i> My Assigned Requests</a>
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
                            Courier Pickup Request(s)
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Request ID</th>
                                        <th>Customer Name</th>
                                        <th>Customer Phone No</th>
                                        <th>Pickup Address</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd">
                                        <td><a data-toggle="modal" data-target="#popupmodel" href="#">2343</a></td>
                                        <td>Govardana</td>
                                        <td>1234567890</td>
                                        <td>H.No 27, Sapthagiri Nilayam, Chanda nagar</td>
                                        <td>Request Completed</td>
                                        
                                    </tr>
                                    <tr class="even">
                                        <td><a data-toggle="modal" data-target="#popupmodel" href="#">2344</a></td>
                                        <td>Seenu</td>
                                        <td>1234567890</td>
                                        <td>H.No 27, Sapthagiri Nilayam, Chanda nagar</td>
                                        <td>Agent is on the way</td>
                                        
                                    </tr>
                                    
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
             <!-- Modal -->
			  <div class="modal fade" id="popupmodel" role="dialog">
			    <div class="modal-dialog">
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Pickup Details</h4>
			        </div>
			        <div class="modal-body">
			        	<form role="form">
				           <div class="form-group">
                                <label>Request ID</label>
                                <p class="form-control-static">2343</p>
                            </div>
                            <div class="form-group">
                                <label>Customer Name</label>
                                <p class="form-control-static">Govardana</p>
                            </div>
                            <div class="form-group">
                                <label>Customer Phone No</label>
                                <p class="form-control-static">1234567890</p>
                            </div>
                            <div class="form-group">
                                <label>Pickup Address</label>
                                <p class="form-control-static">H.No 27, Sapthagiri Nilayam, Chanda nagar</p>
                            </div>
                            <div class="form-group">
                                <label>Courier Partner</label>
                                <p class="form-control-static">Blue Dart</p>
                            </div>
                            <div class="form-group">
                                <label>Amount</label>
                                <p class="form-control-static"><span style="color:red"><i class="fa fa-rupee fa-fw"></i>78.99</span></p>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select class="form-control">
	                                    <option>Agent is on the way</option>
	                                    <option>Collected Parcel</option>
	                                    <option>Submitted to Courier Partner</option>
	                                    <option>Request Completed</option>
                                    </select>
                            </div>
	                     </form>
			        </div>
			        <div class="modal-footer">
			        <button type="button" class="btn btn-info" data-dismiss="modal">Save</button>
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			    </div>
			  </div><!-- Modal -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

   <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    
     <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>

<%@page import="java.util.*,com.easycourier.domain.Employee" %>
<!DOCTYPE html>
<html lang="en">
<%
List<Map<String,Object>> courierRequests=(List<Map<String,Object>>)request.getAttribute("courierRequests");
List<Map<String,Object>> agents=(List<Map<String,Object>>)request.getAttribute("agents");
Employee employee=(Employee)session.getAttribute("userObject");
System.out.println("employee session obj : "+employee);
%>

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
                                        <th>Agent Name</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                	 int cnt=0;
                                	for(Map<String,Object> creq : courierRequests){ 
                                	 String style=(cnt++/2==0)?"even":"odd";
                                	%>
                                    <tr class="<%=style%> gradeX">
                                        <td><a class="rowLink" data-toggle="modal" data-target="#popupmodel" href="#"><%=creq.get("TRANSACTION_ID") %></a></td>
                                        <td><%=creq.get("CUSTOMER_NAME") %></td>
                                        <td><%=creq.get("PHONE_NO") %></td>
                                        <td><%=creq.get("ADDRESS") %></td>
                                        <td><%=creq.get("AGENT_NAME") %></td>
                                        <td><%=creq.get("STATUS") %></td>
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
                                <p class="form-control-static" id="popuptransId"></p>
                            </div>
                            <div class="form-group">
                                <label>Customer Name</label>
                                <p class="form-control-static" id="name"></p>
                            </div>
                            <div class="form-group">
                                <label>Customer Phone No</label>
                                <p class="form-control-static" id="phoneno"></p>
                            </div>
                            <div class="form-group">
                                <label>Pickup Address</label>
                                <p class="form-control-static" id="address"></p>
                            </div>
                            <div class="form-group">
                                <label>Courier Partner</label>
                                <p class="form-control-static" id="courierpartner"></p>
                            </div>
                            <div class="form-group">
                                <label>Amount</label>
                                <p class="form-control-static"><span style="color:red"><i class="fa fa-rupee fa-fw"></i><span id="amount"></span></span></p>
                            </div>
                            <div class="form-group">
                                <label>Courier Agent</label>
                                <select class="form-control" id="agent">
                                		<option value=""></option>
	                                    <%for(Map<String,Object> agent : agents){%>
	                                    	<option value="<%=agent.get("EMPLOYEE_ID") %>"><%=agent.get("FULL_NAME") %></option>
	                                    <%} %>
                                    </select>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select class="form-control" id="status">
                                	    <option value="Request Pending">Request Pending</option>
                                	    <option value="Agent has been assigned">Agent has been assigned</option>
	                                    <option value="Agent has been assigned">Agent is on the way</option>
	                                    <option value="Collected Parcel">Collected Parcel</option>
	                                    <option value="Submitted to Courier Partner">Submitted to Courier Partner</option>
	                                    <option value="Request on hold">Request on hold</option>
	                                    <option value="Request Completed">Request Completed</option>
                                    </select>
                            </div>
	                     </form>
			        </div>
			        <div class="modal-footer">
			        <button type="button" class="btn btn-info" data-dismiss="modal" id="saveStatusBtn">Save</button>
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
        
        $(".rowLink").click(function(){
        	var transId=$(this).html();
        	$.get("/easycourier/resource/admin/pickupDetails?transId="+transId, function(result, status){
        		var data=eval('('+result+')');
        		$("#popuptransId").html(data.TRANSACTION_ID);
        		$("#name").html(data.FULL_NAME);
        		$("#phoneno").html(data.PHONE_NO);
        		$("#address").html(data.ADDRESS);
        		$("#courierpartner").html(data.COURIER_PARTNER_NAME);
        		$("#amount").html(data.AMOUNT);
        	});
        });
        
        $("#saveStatusBtn").click(function(){
        	var transId=$("#popuptransId").html();
        	var agentid=$("#agent").val();
        	var status=$("#status").val();
        	if(status!="" || agentid!=""){
        		$.get("/easycourier/resource/admin/updateStatus?transId="+transId+"&status="+status+"&agentid="+agentid, function(data, status){
            		//alert(data);
            		window.location.href="/easycourier/resource/admin/allPickupRequests";
            	});
        	}else{
        		alert("Status should be empty");
        	}
        	
        });
    });
    </script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/dist/js/sb-admin-2.js"></script>

</body>

</html>

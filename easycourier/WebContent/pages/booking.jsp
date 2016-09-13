<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<%@page import="com.easycourier.domain.*" %>
<html lang="en">

<%
 Customer customer=(Customer)session.getAttribute("userObject");
 System.out.println("customer session obj : "+customer);
%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EasyCourier - Booking</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=request.getContextPath()%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


    <link href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    
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
                <a class="navbar-brand" href="index.html">EasyCourier - Customer Portal</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
					<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <span>Welcome <b><%= customer.getFirstName()%></b></span>
                    </a>
                    <!-- /.dropdown-user -->
                </li>
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       
                        <li>
                            <a href="/easycourier/resource/customer/courierBookingPage"><i class="fa fa-calendar fa-fw"></i> Courier Booking</a>
                        </li>
                        <li>
                            <a href="/easycourier/resource/customer/trackOrderPage"><i class="fa fa-binoculars fa-fw"></i> Track Your Courier</a>
                        </li>
                        <li>
                            <a href="/easycourier/resource/customer/transHistoryPage"><i class="fa fa-book fa-fw"></i> Your Orders</a>
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
                            Book Your Courier
                        </div>
                        <div class="panel-body">
                        		<div class="row"> 
                        			<%
                        			  String successMsg=(String)request.getAttribute("successMessage");
                        			  String errorMsg=(String)request.getAttribute("errorMessage");
                        			  String orderMsg=(String)request.getAttribute("orderMessage");
                        			%>
                        			
                        			<%if(successMsg!=null){ %>
	                        			<div class="alert alert-success">
										  <strong>Success!</strong> <%=successMsg %>. <%=orderMsg %>
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
                                   <form:form role="form" method="post" modelAttribute="courier" action="/easycourier/resource/customer/courierBooking">
                                   
                                        <div class="form-group">
							               <label>Booking Date</label>
							                <div class="controls input-append date form_date" data-date="" data-date-format="dd/mm/yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
							                    <input class="form-control" size="16" type="text" value=""/>
							                    <span class="add-on"><i class="icon-remove"></i></span>
												<span class="add-on"><i class="icon-th"></i></span>
							                </div>
											<form:input path="transDate" type="hidden" class="form-control" id="dtp_input2" value="" /><br/>
							            </div>
                                    	<div class="form-group">
                                            <label>Recipient Name</label>
                                            <form:input path="toName" name="toName" class="form-control" type="text"/>
                                        </div>
                                    	<div class="form-group">
                                            <label>Recipient Address</label>
                                            <form:textarea path="toAddress" name="toAddress" class="form-control" rows="3"></form:textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Recipient Phone No</label>
                                            <form:input path="toPhoneNo" name="toPhoneNo" type="number" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Document/Parcel weight(kg)</label>
                                            <form:input path="weight" name="weight" type="number" id="weight" class="form-control" pattern="[0-9]+([.][0-9]+)?"/>
                                        </div>
                                         <div class="form-group">
		                                    <label>Courier Partners</label>
		                                    <form:select items="${courierPartners}" path="courierPartnerId" name="courierPartnerId" class="form-control">
		                               
		                                    </form:select>
		                                </div>
                                        <div class="form-group">
                                            <label>Amount</label>
                                            <p style="padding-left:20px" class="form-control-static"><span>Courier Charge</span><span style="color:red"><i class="fa fa-rupee fa-fw"></i><span id="courierCharge">0.00</span> </span></p>
                                            <p style="padding-left:20px" class="form-control-static"><span>Service Charge</span><span style="color:red"><i class="fa fa-rupee fa-fw"></i> <span id="serviceCharge">0.00</span></span></p>
                                            <p style="padding-left:20px" class="form-control-static"><span>Total Amount&nbsp;&nbsp;&nbsp;</span><span style="color:red;font-weight:bold"><i class="fa fa-rupee fa-fw"></i> <span id="totalCharge">0.00</span></span></p>
                                            <form:hidden path="amount" name="amount" id="amount" class="form-control"/>
                                        </div>
                                        <button type="submit" class="btn btn-success">Submit</button>
                                        <button type="reset" class="btn btn-danger">Reset</button>
                                        
                                       
                                        
                                        
                                    </form:form>
                                </div>
                                 <div class="col-lg-6">
                                 	<img src="<%=request.getContextPath()%>/img/book-calender.jpg"/>
                                 </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
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

    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/dist/js/sb-admin-2.js"></script>
    
    <script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.js"></script>

 <script>
    $(document).ready(function() {
    	
    	$('.form_date').datetimepicker({
            language:  'fr',
            weekStart: 1,
            todayBtn:  1,
    		autoclose: 1,
    		todayHighlight: 1,
    		startView: 2,
    		minView: 2,
    		forceParse: 0
        });
    	
        $('#weight').keyup(function(){
        	
        	calculateAmount();
        });
        
		$('#courierPartnerId').change(function(){
        	
        	calculateAmount();
        });
        
       function calculateAmount(){
			var val=$("#courierPartnerId").val();
			var weight=$("#weight").val();
			var unitCharge=0;
			if(val!="" && weight!=""){
				$.get("/easycourier/resource/customer/getRate?courierPartnerId="+val, function(data, status){
			        //alert(data);
			        unitCharge=data;
			        var courierCharge=unitCharge*((weight*1000)/10);
		        	var serviceCharge=50;
		        	$("#courierCharge").html(courierCharge);
		        	$("#serviceCharge").html(serviceCharge);
		        	$("#totalCharge").html(courierCharge+serviceCharge);
		        	$("#amount").val(courierCharge+serviceCharge);
			    });
			}
        	
        }
    });
  </script>
</body>

</html>

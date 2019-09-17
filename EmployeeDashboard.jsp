<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*,com.quinnox.mom.dao.*,com.quinnox.mom.model.*,com.quinnox.mom.controller.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Dashboard</title>
</head>
<body>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/dashboard.css" rel="stylesheet" type="text/css">

<title></title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="assets/demo/demo.css" rel="stylesheet" />





<%
	String sid = session.getAttribute("id").toString();

	int id = Integer.parseInt(sid);

	ArrayList<String> momAList = new ArrayList<String>();
	ArrayList<String> moms = new ArrayList<String>();
	moms = MomDAO.getMomDetails(momAList, id);

	ArrayList actionsList = new ArrayList();
	ArrayList getList = MomDAO.getActionDetails(actionsList, id);

	List<Actions> getActions = new ArrayList<Actions>();
	List<Actions> storeActions = MomDAO.getActionDetailsForEmp(getActions, id);

	ArrayList<Mom> createdMomList = MomDAO.getCreatorMom(id);
%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#submit').click(function(){
		var status = $('#status').val();
		$.ajax({
			type:'POST',
			data:{status:status},
			url : 'ChangeStatus',
			success: function(result)
			{
				$('#sts').html(result);
			}
		})
	});
});
</script>
</head>
<body>
	<!--
=========================================================
* Material Dashboard Dark Edition - v2.1.0
=========================================================
* Product Page: https://www.creative-tim.com/product/material-dashboard-dark
* Copyright 2019 Creative Tim (http://www.creative-tim.com)
* Coded by www.creative-tim.com
=========================================================
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<body class="dark-edition">
	<div class="wrapper ">
		<div class="sidebar" data-color="purple" data-background-color="black"
			data-image="../assets/img/sidebar-2.jpg">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"
        Tip 2: you can also add an image using data-image tag
    -->
			<div class="logo">
				<a href="#" class="simple-text logo-normal"> ABC Ltd. </a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item active  "><a class="nav-link"
						href="./dashboard.html"> <i class="material-icons">dashboard</i>
							<p>Dashboard</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="UserProfile.html"> <i class="material-icons">person</i>
							<p>User Profile</p>
					</a></li>
					<ul class="nav">
						<li class="nav-item  "><a class="nav-link"
							href="DemoGenerateMom.jsp"> <i class="material-icons">content_paste</i>
								<p>Generate MoM</p>
						</a></li>

					</ul>
			</div>
		</div>
		<div class="main-panel">

			<nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top "
				id="navigation-example">
			<div class="container-fluid">
				<div class="navbar-wrapper">
					<a class="navbar-brand" href="javascript:void(0)">Dashboard of
						<%=sid%></a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation" data-target="#navigation-example">
					<span class="sr-only">Toggle navigation</span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end">

					<ul class="navbar-nav">

						<li class="nav-item"><a class="nav-link"
							href="javascript:void(0)"> <i class="material-icons">person</i>
								<p class="d-lg-none d-md-block">Account</p>
						</a></li>
					</ul>
				</div>
			</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xl-2 col-lg-12">
							<div class="card card-chart">
								<!-- <div class="card-header card-header-success">
                  <div class="ct-chart" id="dailySalesChart"></div>
                </div> -->
								<div class="card-body">
									<h4 class="card-title">Meetings Attended :</h4>
									<%
										for (String m : moms) {
									%>
									<table>
										<tr>
											<td><%=m%></td>
										</tr>

									</table>
									<%
										}
									%>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-8 col-lg-12">
							<div class="card card-chart">
								<div class="card-body">
									<h4 class="card-title">Actions Assigned</h4>
									<table>
										<thead>
											<th>Action Id</th>
											<th>Action name</th>
											<th>Action status</th>
											<th>Change Status</th>
										</thead>
										<tbody>





										</tbody>
										<%
											for (Actions a : storeActions)

											{
										%>

										<tr>

											<td><%=a.getActionName()%></td>
											<td><%=a.getActionName()%></td>
											<td id="sts"><%=a.getStatus()%></td>

											<td>

												<form action="ChangeStatus" id="actionsForm">
													<input type="hidden" name="aid"
														value="<%=a.getActionId()%>" /> <select
														class="mdb-select md-form" name="status">
														<option value="" disabled selected>Choose status</option>
														<option value="WIP">Work in progress</option>
														<option value="RFC">Ready for Closure</option>
													</select> <input id="submit" class="btn btn-outline-success"
														type="submit" name="sub" />
												</form>

											</td>

										</tr>
										<%
											}
										%>

									</table>



								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-5 col-lg-12">
							<div class="card card-chart">
								<!-- <div class="card-header card-header-danger">
                  <div class="ct-chart" id="completedTasksChart"></div>
                </div> -->
								<div class="card-body">
									<h4 class="card-title">MoMs generated by you:</h4>
									<table>
										<th>Meeting Time</th>
										<th>Meeting purpose</th>
										<%
											for (Mom m : createdMomList) {
										%>



										<tr>
											<td><%=m.getMom_s_date() %></td>
											<td><%=m.getMom_purpose() %></td>
										</tr>

										<%
											}
										%>
									</table>

								</div>


								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> campaign sent 2 days
										ago
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-7 col-lg-14">
							<div class="card card-chart">
								<!-- <div class="card-header card-header-danger">
                  <div class="ct-chart" id="completedTasksChart"></div>
                </div> -->
                <% 
                
                ArrayList<Integer> info = new ArrayList<Integer>();
                info = MomDAO.getUserInfo(id);
                %>
								<div class="card-body">
									<h4 class="card-title"></h4>
									
								<%  ListIterator<Integer> 
                iterator = info.listIterator(); 
								while(iterator.hasNext()){
  %>
								 <%=iterator.next()%>
								
						<%} %>
									
								</div>


								<div class="card-footer">
									<div class="stats">
										<i class="material-icons"></i> 
									</div>
								</div>
							</div>
						</div>
							<div class="col-xl-7 col-lg-14">
							<div class="card card-chart">
								<!-- <div class="card-header card-header-danger">
                  <div class="ct-chart" id="completedTasksChart"></div>
                </div> -->
              
								<div class="card-body">
									<h4 class="card-title">HEHEHE</h4>
						
								<table>
								<th>Action Id</th>
								<th>Action name</th>
								<th>Action Status </th>
								<th> Assigned to </th>
								<th> Confirm </th>
								
								<% ArrayList<Actions> aList = new ArrayList<Actions>();
									aList = ActionDAO.getRFCActions(id);
									for(Actions a : aList){
								%>
								<tr>
								<td><%=a.getActionId() %></td>
								<td><%=a.getActionName() %></td>
								<td><%=a.getStatus()%></td>
								<td><%=a.getAssignedTo()%></td>
								
								<td>
								
								<form action="SetComplete">
									<input type="hidden" name="actionid" value="<%=a.getActionId()%>"/>
									
									<input type="submit" name="accept "value="Completed/Accept">
								</form>
								
								</td>
								
								
								
								</tr>
								
								
								
							<%} %>
						</table>
								</div>


								<div class="card-footer">
									<div class="stats">
										<i class="material-icons"></i> 
									</div>
								</div>
							</div>
						</div>
					</div>
					<script>
						const x = new Date().getFullYear();
						let date = document.getElementById('date');
						date.innerHTML = '&copy; ' + x + date.innerHTML;
					</script>
				</div>
			</div>
			<div class="fixed-plugin">
				<div class="dropdown show-dropdown">
					<a href="#" data-toggle="dropdown"> <i class="fa fa-cog fa-2x">
					</i>
					</a>
					<ul class="dropdown-menu">
						<li class="header-title">Sidebar Filters</li>
						<li class="adjustments-line"><a href="javascript:void(0)"
							class="switch-trigger active-color">
								<div class="badge-colors ml-auto mr-auto">
									<span class="badge filter badge-purple active"
										data-color="purple"></span> <span
										class="badge filter badge-azure" data-color="azure"></span> <span
										class="badge filter badge-green" data-color="green"></span> <span
										class="badge filter badge-warning" data-color="orange"></span>
									<span class="badge filter badge-danger" data-color="danger"></span>
								</div>
								<div class="clearfix"></div>
						</a></li>
						<li class="header-title">Images</li>
						<li><a class="img-holder switch-trigger"
							href="javascript:void(0)"> <img
								src="assets/img/sidebar-1.jpg" alt="">
						</a></li>
						<li class="active"><a class="img-holder switch-trigger"
							href="javascript:void(0)"> <img
								src="assets/img/sidebar-2.jpg" alt="">
						</a></li>
						<li><a class="img-holder switch-trigger"
							href="javascript:void(0)"> <img
								src="assets/img/sidebar-3.jpg" alt="">
						</a></li>
						<li><a class="img-holder switch-trigger"
							href="javascript:void(0)"> <img
								src="assets/img/sidebar-4.jpg" alt="">
						</a></li>
						<!--  -->
						<!-- <li class="header-title">Want more components?</li>
            <li class="button-container">
                <a href="https://www.creative-tim.com/product/material-dashboard-pro" target="_blank" class="btn btn-warning btn-block">
                  Get the pro version
                </a>
            </li> -->

					</ul>
				</div>
			</div>
			<!--   Core JS Files   -->
			<script src="../assets/js/core/jquery.min.js"></script>
			<script src="../assets/js/core/popper.min.js"></script>
			<script src="../assets/js/core/bootstrap-material-design.min.js"></script>
			<script src="https://unpkg.com/default-passive-events"></script>
			<script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
			<!-- Place this tag in your head or just before your close body tag. -->
			<script async defer src="https://buttons.github.io/buttons.js"></script>
			<!--  Google Maps Plugin    -->
			<script
				src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
			<!-- Chartist JS -->
			<script src="../assets/js/plugins/chartist.min.js"></script>
			<!--  Notifications Plugin    -->
			<script src="../assets/js/plugins/bootstrap-notify.js"></script>
			<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
			<script src="../assets/js/material-dashboard.js?v=2.1.0"></script>
			<!-- Material Dashboard DEMO methods, don't include it in your project! -->
			<script src="../assets/demo/demo.js"></script>
			<script>
				$(document)
						.ready(
								function() {
									$()
											.ready(
													function() {
														$sidebar = $('.sidebar');
														$sidebar_img_container = $sidebar
																.find('.sidebar-background');
														$full_page = $('.full-page');
														$sidebar_responsive = $('body > .navbar-collapse');
														window_width = $(window)
																.width();
														$('.fixed-plugin a')
																.click(
																		function(
																				event) {
																			// Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
																			if ($(
																					this)
																					.hasClass(
																							'switch-trigger')) {
																				if (event.stopPropagation) {
																					event
																							.stopPropagation();
																				} else if (window.event) {
																					window.event.cancelBubble = true;
																				}
																			}
																		});
														$(
																'.fixed-plugin .active-color span')
																.click(
																		function() {
																			$full_page_background = $('.full-page-background');
																			$(
																					this)
																					.siblings()
																					.removeClass(
																							'active');
																			$(
																					this)
																					.addClass(
																							'active');
																			var new_color = $(
																					this)
																					.data(
																							'color');
																			if ($sidebar.length != 0) {
																				$sidebar
																						.attr(
																								'data-color',
																								new_color);
																			}
																			if ($full_page.length != 0) {
																				$full_page
																						.attr(
																								'filter-color',
																								new_color);
																			}
																			if ($sidebar_responsive.length != 0) {
																				$sidebar_responsive
																						.attr(
																								'data-color',
																								new_color);
																			}
																		});
														$(
																'.fixed-plugin .background-color .badge')
																.click(
																		function() {
																			$(
																					this)
																					.siblings()
																					.removeClass(
																							'active');
																			$(
																					this)
																					.addClass(
																							'active');
																			var new_color = $(
																					this)
																					.data(
																							'background-color');
																			if ($sidebar.length != 0) {
																				$sidebar
																						.attr(
																								'data-background-color',
																								new_color);
																			}
																		});
														$(
																'.fixed-plugin .img-holder')
																.click(
																		function() {
																			$full_page_background = $('.full-page-background');
																			$(
																					this)
																					.parent(
																							'li')
																					.siblings()
																					.removeClass(
																							'active');
																			$(
																					this)
																					.parent(
																							'li')
																					.addClass(
																							'active');
																			var new_image = $(
																					this)
																					.find(
																							"img")
																					.attr(
																							'src');
																			if ($sidebar_img_container.length != 0
																					&& $('.switch-sidebar-image input:checked').length != 0) {
																				$sidebar_img_container
																						.fadeOut(
																								'fast',
																								function() {
																									$sidebar_img_container
																											.css(
																													'background-image',
																													'url("'
																															+ new_image
																															+ '")');
																									$sidebar_img_container
																											.fadeIn('fast');
																								});
																			}
																			if ($full_page_background.length != 0
																					&& $('.switch-sidebar-image input:checked').length != 0) {
																				var new_image_full_page = $(
																						'.fixed-plugin li.active .img-holder')
																						.find(
																								'img')
																						.data(
																								'src');
																				$full_page_background
																						.fadeOut(
																								'fast',
																								function() {
																									$full_page_background
																											.css(
																													'background-image',
																													'url("'
																															+ new_image_full_page
																															+ '")');
																									$full_page_background
																											.fadeIn('fast');
																								});
																			}
																			if ($('.switch-sidebar-image input:checked').length == 0) {
																				var new_image = $(
																						'.fixed-plugin li.active .img-holder')
																						.find(
																								"img")
																						.attr(
																								'src');
																				var new_image_full_page = $(
																						'.fixed-plugin li.active .img-holder')
																						.find(
																								'img')
																						.data(
																								'src');
																				$sidebar_img_container
																						.css(
																								'background-image',
																								'url("'
																										+ new_image
																										+ '")');
																				$full_page_background
																						.css(
																								'background-image',
																								'url("'
																										+ new_image_full_page
																										+ '")');
																			}
																			if ($sidebar_responsive.length != 0) {
																				$sidebar_responsive
																						.css(
																								'background-image',
																								'url("'
																										+ new_image
																										+ '")');
																			}
																		});
														$(
																'.switch-sidebar-image input')
																.change(
																		function() {
																			$full_page_background = $('.full-page-background');
																			$input = $(this);
																			if ($input
																					.is(':checked')) {
																				if ($sidebar_img_container.length != 0) {
																					$sidebar_img_container
																							.fadeIn('fast');
																					$sidebar
																							.attr(
																									'data-image',
																									'#');
																				}
																				if ($full_page_background.length != 0) {
																					$full_page_background
																							.fadeIn('fast');
																					$full_page
																							.attr(
																									'data-image',
																									'#');
																				}
																				background_image = true;
																			} else {
																				if ($sidebar_img_container.length != 0) {
																					$sidebar
																							.removeAttr('data-image');
																					$sidebar_img_container
																							.fadeOut('fast');
																				}
																				if ($full_page_background.length != 0) {
																					$full_page
																							.removeAttr(
																									'data-image',
																									'#');
																					$full_page_background
																							.fadeOut('fast');
																				}
																				background_image = false;
																			}
																		});
														$(
																'.switch-sidebar-mini input')
																.change(
																		function() {
																			$body = $('body');
																			$input = $(this);
																			if (md.misc.sidebar_mini_active == true) {
																				$(
																						'body')
																						.removeClass(
																								'sidebar-mini');
																				md.misc.sidebar_mini_active = false;
																				$(
																						'.sidebar .sidebar-wrapper, .main-panel')
																						.perfectScrollbar();
																			} else {
																				$(
																						'.sidebar .sidebar-wrapper, .main-panel')
																						.perfectScrollbar(
																								'destroy');
																				setTimeout(
																						function() {
																							$(
																									'body')
																									.addClass(
																											'sidebar-mini');
																							md.misc.sidebar_mini_active = true;
																						},
																						300);
																			}
																			// we simulate the window Resize so the charts will get updated in realtime.
																			var simulateWindowResize = setInterval(
																					function() {
																						window
																								.dispatchEvent(new Event(
																										'resize'));
																					},
																					180);
																			// we stop the simulation of Window Resize after the animations are completed
																			setTimeout(
																					function() {
																						clearInterval(simulateWindowResize);
																					},
																					1000);
																		});
													});
								});
			</script>
			<script>
				$(document).ready(function() {
					// Javascript method's body can be found in assets/js/demos.js
					md.initDashboardPageCharts();
				});
			</script>
</body>

</body>
</html>

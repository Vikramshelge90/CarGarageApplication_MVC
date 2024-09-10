<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Selection</title>
<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet" />
<link type="text/css" rel="stylesheet"
	href="/CarGarageApplicationMVC/URLToReachResourceFolder/css/styleadmin.css" />
<style type="text/css">
.form-container {
	width: 100%;
	padding: 20px;
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	margin: 20px 0;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	font-size: 16px;
	font-weight: 500;
	color: #333;
	margin-bottom: 5px;
	display: block;
}

.form-group input[type="text"], .form-group input[type="date"],
	.form-group textarea, .form-group select {
	width: 100%;
	padding: 10px 15px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 16px;
	transition: border-color 0.3s ease;
}

.form-group input:focus, .form-group textarea:focus {
	border-color: #ADFF2F;
	outline: none;
}

.button-container {
	padding: 30px;
	border-radius: 25px; display : flex;
	justify-content: center;
	display: flex;
}

.button-container button {
	background-color: #0A2558;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.button-container button:hover {
	background-color: #0d3073;
}

#validationMessage, #emailValidationMessage {
	color: blue;
	text-align: center;
	display: block;
	margin-top: 5px;
}

.card {
	padding: 30px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.card-header {
	background-color: #4CAF50;
	color: #fff;
	padding: 15px;
	border-radius: 8px 8px 0 0;
	display: flex;
	align-items: center;
}

.card-header input[type="checkbox"] {
	margin-right: 10px;
}

.card-body {
	padding: 15px;
}

.subcategory .d-flex {
	padding: 8px 0;
	align-items: center;
}

.subcategory input[type="checkbox"] {
	margin-right: 10px;
}

.subcategory label {
	font-weight: 500;
	margin-right: 10px;
}

.subcategory label:hover {
	color: #0d3073;
	text-decoration: underline;
}

.btn-success {
	background-color: #28a745;
	border: none;
	color: #fff;
	padding: 10px 20px;
	border-radius: 6px;
	cursor: pointer;
	font-size: 18px;
}

.btn-success:hover {
	background-color: #218838;
}

@media ( max-width : 768px) {
	.card-header h5 {
		font-size: 16px;
	}
	.card-body {
		padding: 10px;
	}
}
</style>
</head>
<body>
	<div class="sidebar">
		<div class="logo-details">
			<i class='bx bxs-car-garage'></i> <span class="logo_name">GoGarage
				AutoMobs</span>
		</div>
		<ul class="nav-links">
			<!-- Sidebar Navigation -->
			<li><a href="#"><i class="bx bx-grid-alt"></i> <span
					class="links_name">Dashboard</span></a></li>
			<li><a href="adminside"><i class='bx bxs-group'></i> <span
					class="links_name">Customers Section</span></a></li>
			<li><a href="carpage"><i class='bx bxs-car-mechanic'></i> <span
					class="links_name">Cars Section</span></a></li>
			<li><a href="#" class="active"><i class='bx bxs-cart-add'></i>
					<span class="links_name">Services</span></a></li>
			<li><a href="#"><i class="bx bx-pie-chart-alt-2"></i> <span
					class="links_name">Analytics</span></a></li>
			<li><a href="#"><i class="bx bx-coin-stack"></i> <span
					class="links_name">Stock</span></a></li>
			<li><a href="#"><i class="bx bx-book-alt"></i> <span
					class="links_name">Total order</span></a></li>
			<li><a href="#"><i class="bx bx-message"></i> <span
					class="links_name">Messages</span></a></li>
			<li><a href="#"><i class="bx bx-heart"></i> <span
					class="links_name">Favorites</span></a></li>
			<li><a href="#"><i class='bx bxs-spreadsheet'></i> <span
					class="links_name">Reports</span></a></li>
			<li class="log_out"><a href="logoutbtn"><i
					class="bx bx-log-out"></i> <span class="links_name">Log out</span></a></li>
		</ul>
	</div>
	<section class="home-section">
		<nav>
			<div class="sidebar-button">
				<i class="bx bx-menu sidebarBtn"></i> <span class="dashboard">Car
					Dashboard</span>
			</div>
			<div class="profile-details">
				<img src="" alt="" /> <span class="admin_name">Kartik&Vikram</span>
			</div>
		</nav>
		<div class="home-content">
			<div class="overview-boxes">
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Select Service</div>
					</div>
				</div>
			</div>
						
			

			<div class="sales-boxes" style="margin-top: 20px;">
				<div class="recent-sales box">

					<div class="tab-content" id="v-pills-tabContent">
						<div class="tab-pane fade show active" id="v-pills-profile"
							role="tabpanel" aria-labelledby="v-pills-profile-tab">
							<form action="submitServices?vvid=${visitID}" method="post">
								<div class="row">
									<div class="col-md-12">
										<c:forEach var="ServiceEntry" items="${servicesMap}">
											<div class="card shadow-sm p-3 mb-3 bg-body rounded">
												<!-- Main Service Checkbox -->
												<div class="card-header bg-info text-white">
													<input type="checkbox" class="form-check-input me-2"
														id="mainService-${ServiceEntry.key.msid}"
														onclick="toggleSubServices(this, 'subService-${ServiceEntry.key.msid}')" />
													<label class="form-check-label fw-bold"
														for="mainService-${ServiceEntry.key.msid}">
														<h5>${ServiceEntry.key.msname}</h5>
													</label>
												</div>
												<!-- Subservices -->
												<div class="card-body">
													<div class="subcategory">
														<c:forEach var="subService" items="${ServiceEntry.value}">
															<div class="d-flex align-items-center mb-2">
																<!-- Subservice Checkbox -->
																<input type="checkbox"
																	class="form-check-input subService-${ServiceEntry.key.msid} me-2"
																	name="selectedSubServices" value="${subService.ssid}" />
																<label class="form-check-label me-3"
																	for="subService-${subService.ssid}">
																	${subService.ssname} - ${subService.ssprice} </label>
															</div>
														</c:forEach>
													</div>
												</div>
											</div>
											
										</c:forEach>
									</div>
								</div>
								<div class="text-center mt-4">
									<button type="submit" class="btn btn-success btn-lg">Submit</button>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
	</section>
	<script>
		function toggleSubServices(mainServiceCheckbox, subServiceClass) {
			var checkboxes = document.getElementsByClassName(subServiceClass);
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = mainServiceCheckbox.checked;
			}
		}
	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet" />
<link type="text/css" rel="stylesheet"
	href="resources/css/styleadmin.css" />


<style type="text/css">

/* Container for the entire form */
.form-container {
	width: 100%;
	padding: 20px;
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	margin: 20px 0;
}

/* General styling for form fields */
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

.form-group input[type="text"], .form-group input[type="email"],
	.form-group input[type="number"], .form-group textarea {
	width: 100%;
	padding: 10px 15px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 16px;
	transition: border-color 0.3s ease;
}

.form-group input:focus, .form-group textarea:focus {
	border-color: #0A2558;
	outline: none;
}

/* Button styling */
.button-container {
	display: flex;
	justify-content: center;
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

/* Error messages */
#validationMessage, #emailValidationMessage {
	color: blue;
	text-align: center;
	display: block;
	margin-top: 5px;
}

/* Overall sales-boxes styling */
.sales-boxes {
	margin-top: 20px;
	font-family: 'Arial', sans-serif;
}

/* Recent sales box styling */
.sales-boxes .recent-sales.box {
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

/* Table container for scrollable table */
.sales-boxes .table-responsive {
	overflow-x: auto;
	-webkit-overflow-scrolling: touch;
	border-radius: 10px;
}

/* Table styling */
.sales-boxes .table {
	width: 100%;
	border-collapse: collapse;
	font-size: 16px;
	text-align: left;
	background-color: #f9f9f9;
	margin-bottom: 20px;
}

/* Table header styling */
.sales-boxes .table thead {
	background-color: #4CAF50;
	color: white;
	font-weight: bold;
}

.sales-boxes .table thead th {
	padding: 12px 15px;
	font-size: 18px;
}

/* Table body rows */
.sales-boxes .table tbody tr {
	border-bottom: 1px solid #ddd;
}

.sales-boxes .table tbody tr:hover {
	background-color: #f1f1f1;
}

/* Table cell padding */
.sales-boxes .table tbody td {
	padding: 12px 15px;
}

/* Link in table cell */
.sales-boxes .table tbody td a {
	text-decoration: none;
	color: #007bff;
	font-weight: 500;
}

.sales-boxes .table tbody td a:hover {
	color: #0056b3;
	text-decoration: underline;
}

/* Button styling */
.sales-boxes .table .btn-info {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 6px 12px;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

.sales-boxes .table .btn-info:hover {
	background-color: #0056b3;
}

.sales-boxes .table .btn-danger {
	background-color: #dc3545;
	color: white;
	border: none;
	padding: 6px 12px;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

.sales-boxes .table .btn-danger:hover {
	background-color: #c82333;
}

/* Modal styling (optional for consistency) */
.modal-content {
	border-radius: 8px;
	border: 1px solid #dee2e6;
}

.modal-header {
	background-color: #f8f9fa;
	border-bottom: 1px solid #dee2e6;
	padding: 10px 15px;
}

.modal-footer .btn-danger {
	background-color: #dc3545;
	border: none;
}

.modal-footer .btn-secondary {
	background-color: #6c757d;
	border: none;
}

.vehicle-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: #f9f9f9;
}

.vehicle-table thead {
    background-color: #4CAF50;
    color: white;
    font-weight: bold;
}

.vehicle-table thead th, .vehicle-table tbody td {
    padding: 12px 15px;
    text-align: center;
}

.vehicle-table tbody tr {
    border-bottom: 1px solid #ddd;
}

.vehicle-table tbody tr:hover {
    background-color: #f1f1f1;
}

.vehicle-table tbody td button {
    background-color: #0A2558;
    color: #fff;
    padding: 8px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.vehicle-table tbody td button:hover {
    background-color: #0d3073;
}



/* Mobile View Adjustments */
@media ( max-width : 768px) {
	/* Add scroll behavior for tables */
	.sales-boxes .table-responsive {
		overflow-x: auto;
	}
	.sales-boxes .table {
		font-size: 14px;
	}

	/* Reduce padding for mobile view */
	.sales-boxes .table thead th, .sales-boxes .table tbody td {
		padding: 10px 8px;
	}

	/* Buttons smaller on mobile */
	.sales-boxes .table .btn-info, .sales-boxes .table .btn-danger {
		padding: 4px 8px;
	}
	.vehicle-table, .vehicle-table thead th, .vehicle-table tbody td {
        font-size: 14px;
        padding: 10px 8px;}
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
			

			<li><a href="adminside" class="active"> <i
					class='bx bxs-car-mechanic'></i> <span class="links_name">All
						Vehicles</span>
			</a></li>

			
		</ul>
	</div>
	<section class="home-section">
		<nav>
			<div class="sidebar-button">
				<i class="bx bx-menu sidebarBtn"></i> <span class="dashboard">Dashboard</span>
			</div>
			
			<div class="profile-details">
				 <button class="profile-btn" onclick="location.href='/CarGarageApplicationMVC/profilePage';">
                    Profile
                </button>
			</div>
		</nav>
		<div class="home-content">
			
			<div class="sales-boxes">
				<div class="recent-sales box">
					<!-- Profile Details -->
					<h3>Customer Profile</h3>
					<div class="Wrapper_User_profile_2">
						<div class="w2">
							<h3>
								Id: <span style="color: red; font-size: 13px;">${customerLogin.getUserid()}</span>
							</h3>
						</div>
						<div class="w1">
							<h3>
								Name: <span style="color: red; font-size: 13px;">${customerLogin.getUsername()}</span>
							</h3>
						</div>
						<div class="w2">
							<h3>
								Email: <span style="color: red; font-size: 13px;">${customerLogin.getUseremail()}</span>
							</h3>
						</div>
						<div class="w2">
							<h3>
								Contact number: <span style="color: red; font-size: 13px;">${customerLogin.getUsercontact()}</span>
							</h3>
						</div>
						<div class="w2">
							<h3>
								City: <span style="color: red; font-size: 13px;">${customerLogin.getUseraddress()}</span>
							</h3>
						</div>
					</div>
				</div>
			</div>

			<!-- Vehicles Table -->
			<div class="table-responsive">
				<h3>Your Vehicles</h3>
				<table class="vehicle-table">
					<thead>
						<tr>
							<th>Sr.No.</th>
							<th>Number Plate</th>
							<th>Model</th>
							<th>Service Date</th>
							<th>Running in Km</th>
							<th>Bills</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vehicle" items="${vehicles}">
							<tr>
								<td>${vehicle.id}</td>
								<td>${vehicle.make}</td>
								<td>${vehicle.model}</td>
								<td>${vehicle.year}</td>
								<td>
									<!-- Show Bill Button -->
									<button onclick="location.href='/CarGarageApplicationMVC/billPage?vehicleId=${vehicle.id}';">Show Bill</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</section>


</body>
</html>
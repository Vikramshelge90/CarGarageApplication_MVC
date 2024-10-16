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
	.form-group input[type="number"], .form-group textarea, .form-group select
	{
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
}

/* The Modal (background) */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5);
}

/* Modal Content */
.modal-content {
	background-color: white;
	margin: 10% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	/* Width of modal */
	border-radius: 10px;
}

/* Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* Styling form fields */
.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
}

.form-group input {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

/* Submit Button */
button[type="submit"] {
	padding: 10px 20px;
	background-color: #0A2558;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #0f3886;
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
			<li><a href="dashboard" class="active"> <i class="bx bx-grid-alt"></i> <span
					class="links_name" >Dashboard</span>
			</a></li>

			<li><a href="adminside"> <i class='bx bxs-group'></i> <span
					class="links_name">Customers Section</span>
			</a></li>

			<li><a href="carpage"> <i class='bx bxs-car-mechanic'></i> <span
					class="links_name">Cars Section</span>
			</a></li>




			<li><a href="servicedetailspage"> <i class='bx bxs-car'></i><span
					class="links_name">Services</span>
			</a></li>
			<li><a href="sparePartspage"> <i class="bx bx-wrench"></i> <span
					class="links_name">Spare Parts</span>
			</a></li>
			<li><a href="techiepage"> <i class="bx bxs-group"></i> <span
					class="links_name">Technician</span>
			</a></li>

			<li><a href="billingPage"> <i class="bx bxs-receipt"></i> <span
					class="links_name">Billing</span>
			</a></li>
			<li><a href="#"> <i class='bx bxs-report'></i> <span
					class="links_name">Reports</span>
			</a></li>
			<li class="log_out"><a href="logoutbtn"> <i
					class="bx bx-log-out"></i> <span class="links_name">Log out</span>
			</a></li>


		</ul>
	</div>
	<section class="home-section">
		<nav>
			<div class="sidebar-button">
				<i class="bx bx-menu sidebarBtn"></i> <span class="dashboard">Dashboard</span>
			</div>
			<div class="search-box">
				<input type="text" placeholder="Search..." /> <i
					class="bx bx-search"></i>
			</div>

		</nav>

		<div class="home-content">
			<div class="overview-boxes">
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Total Order</div>
						<div class="number">40,876</div>
						<div class="indicator">
							<i class="bx bx-up-arrow-alt"></i> <span class="text">Up
								from yesterday</span>
						</div>
					</div>
					<i class="bx bx-cart-alt cart"></i>
				</div>
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Total Sales</div>
						<div class="number">38,876</div>
						<div class="indicator">
							<i class="bx bx-up-arrow-alt"></i> <span class="text">Up
								from yesterday</span>
						</div>
					</div>
					<i class="bx bxs-cart-add cart two"></i>
				</div>
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Total Profit</div>
						<div class="number">$12,876</div>
						<div class="indicator">
							<i class="bx bx-up-arrow-alt"></i> <span class="text">Up
								from yesterday</span>
						</div>
					</div>
					<i class="bx bx-cart cart three"></i>
				</div>
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Total Return</div>
						<div class="number">11,086</div>
						<div class="indicator">
							<i class="bx bx-down-arrow-alt down"></i> <span class="text">Down
								From Today</span>
						</div>
					</div>
					<i class="bx bxs-cart-download cart four"></i>
				</div>
			</div>

			<div class="sales-boxes">
				<div class="recent-sales box">
					<div class="title">Recent Sales</div>
					<div class="sales-details">
						<ul class="details">
							<li class="topic">Date</li>
							<li><a href="#">02 Jan 2021</a></li>
							<li><a href="#">02 Jan 2021</a></li>
							<li><a href="#">02 Jan 2021</a></li>
							<li><a href="#">02 Jan 2021</a></li>
							<li><a href="#">02 Jan 2021</a></li>
							<li><a href="#">02 Jan 2021</a></li>
							<li><a href="#">02 Jan 2021</a></li>
						</ul>
						<ul class="details">
							<li class="topic">Customer</li>
							<li><a href="#">Alex Doe</a></li>
							<li><a href="#">David Mart</a></li>
							<li><a href="#">Roe Parter</a></li>
							<li><a href="#">Diana Penty</a></li>
							<li><a href="#">Martin Paw</a></li>
							<li><a href="#">Doe Alex</a></li>
							<li><a href="#">Aiana Lexa</a></li>
							<li><a href="#">Rexel Mags</a></li>
							<li><a href="#">Tiana Loths</a></li>
						</ul>
						<ul class="details">
							<li class="topic">Sales</li>
							<li><a href="#">Delivered</a></li>
							<li><a href="#">Pending</a></li>
							<li><a href="#">Returned</a></li>
							<li><a href="#">Delivered</a></li>
							<li><a href="#">Pending</a></li>
							<li><a href="#">Returned</a></li>
							<li><a href="#">Delivered</a></li>
							<li><a href="#">Pending</a></li>
							<li><a href="#">Delivered</a></li>
						</ul>
						<ul class="details">
							<li class="topic">Total</li>
							<li><a href="#">$204.98</a></li>
							<li><a href="#">$24.55</a></li>
							<li><a href="#">$25.88</a></li>
							<li><a href="#">$170.66</a></li>
							<li><a href="#">$56.56</a></li>
							<li><a href="#">$44.95</a></li>
							<li><a href="#">$67.33</a></li>
							<li><a href="#">$23.53</a></li>
							<li><a href="#">$46.52</a></li>
						</ul>
					</div>
					<div class="button">
						<a href="#">See All</a>
					</div>
				</div>

			</div>
			</div>
	</section>
</body>
</html>

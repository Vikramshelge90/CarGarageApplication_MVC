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
	href="/CarGarageApplicationMVC/URLToReachResourceFolder/css/styleadmin.css" />


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

.form-group input[type="text"], .form-group input[type="date"],
	.form-group input[type="date"], .form-group textarea {
	width: 100%;
	padding: 10px 15px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 16px;
	transition: border-color 0.3s ease;
}

.form-group select {
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
</style>
</head>
<body>
	<div class="sidebar">
		<div class="logo-details">
			<i class='bx bxs-car-garage'></i> <span class="logo_name">GoGarage
				AutoMobs</span>
		</div>
		<ul class="nav-links">
			<li><a href="#"> <i class="bx bx-grid-alt"></i> <span
					class="links_name">Dashboard</span>
			</a></li>

			<li><a href="adminside"> <i class='bx bxs-group'></i> <span
					class="links_name">Customers Section</span>
			</a></li>

			<li><a href="carpage" > <i
					class='bx bxs-car-mechanic'></i> <span class="links_name">Cars
						Section</span>
			</a></li>




			<li><a href="#" class="active"> <i class='bx bxs-cart-add'></i> <span
					class="links_name">Services</span>
			</a></li>
			<li><a href="#"> <i class="bx bx-pie-chart-alt-2"></i> <span
					class="links_name">Analytics</span>
			</a></li>
			<li><a href="#"> <i class="bx bx-coin-stack"></i> <span
					class="links_name">Stock</span>
			</a></li>
			<li><a href="#"> <i class="bx bx-book-alt"></i> <span
					class="links_name">Total order</span>
			</a></li>

			<li><a href="#"> <i class="bx bx-message"></i> <span
					class="links_name">Messages</span>
			</a></li>
			<li><a href="#"> <i class="bx bx-heart"></i> <span
					class="links_name">Favrorites</span>
			</a></li>
			<li><a href="#"> <i class='bx bxs-spreadsheet'></i> <span
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
				<i class="bx bx-menu sidebarBtn"></i> <span class="dashboard">Car
					Dashboard</span>
			</div>
			<!-- <div class="search-box">
          <input type="text" placeholder="Search..." />
          <i class="bx bx-search"></i>
        </div> -->
			<div class="profile-details">
				<img src="" alt="" /> <span class="admin_name">Kartik&Vikram</span>
				<!-- <i class="bx bx-chevron-down"></i> -->
			</div>
		</nav>
		<div class="home-content">
			<div class="overview-boxes">
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Search Panel</div>

					</div>
				</div>
			</div>

			<div class="button1">
				<a href="addnewcustomer">Add Vehicle</a>
			</div>

			<div class="sales-boxes">
				<div class="recent-sales box">


					<form:form action="searchcarbynplate_servicepage" method="POST"
						modelAttribute="carDetails" id="vehicleForm">

				

						<!-- Number plate Field -->
						<div class="form-group">
							<label for="contactField">Vehicle Registered Number</label> <input
								type="text" id="inputVehicleNPlate" name="vehiclenplate"
								placeholder="Enter Vehicle Registered number"
								
								onkeyup="validateVehicleNumber(); clearValidationMessage('inputVehicleNPlate','vehicleNPlateError')" />
							<span id="vehicleNPlateError" style="color: red; display: none;">Invalid
								vehicle number plate</span>
						</div>

					

						<!-- Submit Button (Disabled by default) -->
						<div class="button-container">
							<button type="submit">Search</button>
						</div>
					</form:form>
				</div>
			</div>
			<div class="sales-boxes" style="margin-top: 20px;">
				<div class="recent-sales box">
					<!-- Table responsive wrapper -->
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr class=" table-success">
									<th scope="col">Sr no.</th>
									<th scope="col">Vehicle Model</th>
									<th scope="col">Registered Number</th>
									<th scope="col">Vehicle Running in KMs</th>
									<th scope="col">Entry Date</th>
									<th scope="col">Technician</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<%
								int count = 0;
								%>
								<c:forEach var="vehicle" items="${vehicles}">
									<tr>
										<td><a href="allocateservice?VisitID=${vehicle.vehicleid}"
											type="button" class="btn btn-info btn-sm"
											style="color: white; text-decoration: none"><%=++count%></a></td>

										<td>${vehicle.vehiclemodel }</td>
										<td>${vehicle.vehiclenplate }</td>
										<td>${vehicle.visitVrun }</td>
										<td>${vehicle.visitVentryDate }</td>
										<td>${vehicle.tname}</td>
										<td><button type="button" class="btn btn-danger btn-sm"
												onclick="confirmDeleteforvehicle(${vehicle.vehicleid})">Delete</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</section>

	<script type="text/javascript">
		let sidebar = document.querySelector(".sidebar");
		let sidebarBtn = document.querySelector(".sidebarBtn");
		sidebarBtn.onclick = function() {
			sidebar.classList.toggle("active");
			if (sidebar.classList.contains("active")) {
				sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
			} else
				sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
		};


		// Validate the name field
		function validateName() {
			const nameField = document.getElementById("nameField");
			const validationMessage = document
					.getElementById("nameValidationMessage");
			const nameRegex = /^[A-Za-z]+(?:[A-Za-z\s]*)$/; // Name can only start with letters

			if (nameField.value.trim() === "") {
				validationMessage.textContent = ""; // Hide message if input is empty
			} else if (!nameRegex.test(nameField.value.trim())) {
				validationMessage.textContent = "Name cannot start with spaces, numbers, or special characters.";
				validationMessage.style.color = "red";
			} else {
				validationMessage.textContent = ""; // Clear the error if valid
			}
		}

		// Validate the contact field
		function validateContact() {
			const contactField = document.getElementById("contactField");
			const contactValidationMessage = document
					.getElementById("contactValidationMessage");
			const contactRegex = /^[0-9]{10}$/; // Phone number should be 10 digits and start with a number

			if (contactField.value.trim() === "") {
				contactValidationMessage.textContent = ""; // Hide message if input is empty
			} else if (!contactRegex.test(contactField.value.trim())) {
				contactValidationMessage.textContent = "Invalid phone number. Only 10 digits allowed.";
				contactValidationMessage.style.color = "red";
			} else {
				contactValidationMessage.textContent = ""; // Clear the error if valid
			}
		}

		// Validate the email field
		function validateEmail() {
			const emailField = document.getElementById("emailField");
			const emailValidationMessage = document
					.getElementById("emailValidationMessage1");
			const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Basic email pattern

			if (emailField.value.trim() === "") {
				emailValidationMessage.textContent = ""; // Hide message if input is empty
			} else if (!emailRegex.test(emailField.value.trim())) {
				emailValidationMessage.textContent = "Invalid email format.";
				emailValidationMessage.style.color = "red";
			} else {
				emailValidationMessage.textContent = ""; // Clear the error if valid
			}
		}

		// Clear validation message on empty input
		function clearValidationMessage(fieldId, messageId) {
			const field = document.getElementById(fieldId);
			const message = document.getElementById(messageId);

			if (field.value.trim() === "") {
				message.textContent = ""; // Hide message if input is empty
			}
		}
		
		
		
		
		//delete by using ajax vehicle
		
		function confirmDeleteforvehicle(vehicleId) {
			// Show confirmation dialog

			if (confirm("Do you really want to delete this vehicle?")) {
				// If the user confirms, proceed with AJAX call
				let xhr = new XMLHttpRequest();
				// Adjust the URL based on your controller's mapping
				// Define what happens on successful data submission
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						// Response from the server (success)
						let response = xhr.responseText;
						console.log(response)
						if (response === 'success') {
							alert("Vehicle deleted successfully.");
							// Optionally, you can remove the row from the table
							window.location.reload(); // Refresh the page to see the changes

						} else {
							alert("something went wrong")
						}
					}
				};

				xhr.open("GET", "deleteVehicle?vvID=" + vehicleId, true);
				// Send the userId as the data
				xhr.send();
			}
		}
		
	   
	  //that is for number plate
		function validateVehicleNumber() {
			const input = document.getElementById('inputVehicleNPlate').value;
			const errorMsg = document.getElementById('vehicleNPlateError');
			const initialCheck = /^[A-Za-z][A-Za-z0-9 ]*$/; // First check for valid starting character
			const vehicleNumberPattern = /^[A-Z]{2}\d{2}[A-Z]{2}\d{1,4}$/; // Format for registered vehicle plate

			if (!initialCheck.test(input)) {
				errorMsg.innerHTML = "Number plate cannot start with spaces, digits, or special characters.";
				errorMsg.style.display = 'inline';
			} else if (!vehicleNumberPattern.test(input)) {
				errorMsg.innerHTML = "Invalid vehicle number plate format. Expected format: MH12AB1234.";
				errorMsg.style.display = 'inline';
			} else {
				errorMsg.style.display = 'none';
			}
		}
	    
	</script>

</body>
</html>
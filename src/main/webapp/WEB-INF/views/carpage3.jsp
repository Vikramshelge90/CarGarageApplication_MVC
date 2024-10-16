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

.form-group input[type="text"], .form-group input[type="date"],
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
</style>
</head>
<body>
	<div class="sidebar">
		<div class="logo-details">
			<i class='bx bxs-car-garage'></i> <span class="logo_name">GoGarage
				AutoMobs</span>
		</div>
		<ul class="nav-links">
			<li><a href="dashboard"> <i class="bx bx-grid-alt"></i> <span
					class="links_name">Dashboard</span>
			</a></li>

			<li><a href="adminside"> <i
					class='bx bxs-group'></i> <span class="links_name">Customers
						Section</span>
			</a></li>

			<li><a href="carpage" class="active"> <i
					class='bx bxs-car-mechanic'></i> <span class="links_name">Cars
						Section</span>
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
			<li class="log_out"><a href="logoutbtn"> <i class="bx bx-log-out"></i>
					<span class="links_name">Log out</span>
			</a></li>
		</ul>
	</div>
	<section class="home-section">
		<nav>
			<div class="sidebar-button">
				<i class="bx bx-menu sidebarBtn"></i> <span class="dashboard">Dashboard</span>
			</div>
			<!-- <div class="search-box">
          <input type="text" placeholder="Search..." />
          <i class="bx bx-search"></i>
        </div> -->
			<div class="profile-details">
				<img src="" alt="" /> <span class="admin_name">${adminName}</span>
				<!-- <i class="bx bx-chevron-down"></i> -->
			</div>
		</nav>
		<div class="home-content">
			<div class="overview-boxes">
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Car Registration Panel</div>

					</div>
				</div>
			</div>


			<div class="sales-boxes">
				<div class="recent-sales box">


					<form:form action="addingnewcardetails" method="POST"
						modelAttribute="VehicleDetails" id="userForm">

						<!-- Model Name Field -->
						<div class="form-group">
							<label for="nameField">Vehicle Model</label> <input type="text"
								id="inputVehicleModel" name="vehiclemodel"
								placeholder="Enter Vehicle Model Name" value=""
								required="required"
								onkeyup="validateVehicleModel(); clearValidationMessage('inputVehicleModel','error-message')" />
							<span id="error-message" style="color: red; display: none;">Invalid
								vehicle model name. Ensure no leading spaces, special
								characters, and no more than one space between words.</span>
						</div>

						<!-- Registered Number Field -->
						<div class="form-group">
							<label for="inputVehicleNPlate6" class="form-label">Vehicle
								Registered Number</label> <input type="text" class="form-control"
								id="inputVehicleNPlate" name="vehiclenplate"
								placeholder="Enter Registered Vehicle Number" value=""
								required="required" maxlength="10"
								onkeyup="validateVehicleNumber(); clearValidationMessage('inputVehicleNPlate','vehicleNPlateError')"
								onchange="checkVehicleNumber()" /> <span
								id="vehicleNPlateError" style="color: red; display: none;">Invalid
								vehicle number plate</span>
						</div>

						<!-- KM Running Field -->
						<div class="form-group">
							<label for="emailField">Vehicle Runs in KM</label> <input
								type="number" id="inputVehicleRun" name="visitVrun"
								placeholder="Enter Vehicle Running in km" value=""
								required="required" />
						</div>



						<!-- Entry Date Field -->
						<div class="form-group">
							<label for="addressField">Vehicle Entry Date</label> <input
								type="date" id="inputVehicleEntryDate" name="visitVentryDate"
								placeholder="Enter Vehicle Entry Date" value=""
								required="required">
						</div>

						<!-- Technician Field -->
						<div class="form-group">
							<label for="selectTechnician" class="form-label">Select
								Technician</label> <select class="form-control" id="selectTechnician"
								name="tid" required="required">
								<option value="" disabled selected>Select a technician</option>
								<c:forEach var="technician" items="${techies}">
									<option value="${technician.tid}">${technician.tname}</option>
								</c:forEach>
							</select>
						</div>

						<!-- Submit Button (Disabled by default) -->
						<div class="button-container">
							<button type="submit">Submit</button>
						</div>
						<div style="text-align: center;">
							<label style="color: blue;">${msg}</label>
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
									<th scope="col">Registered Vehicle Number</th>
									<th scope="col">Vehicle Running KM</th>
									<th scope="col">Vehicle Entry Date</th>
									<th scope="col">Technician Name</th>
									<th></th>
								</tr>
							</thead>
							<tbody>

								<c:if test="${not empty vehicle}">
									<tr>
										<td><a href="updateforcar?VisitID=${vehicle.vehicleid}"
											type="button" class="btn btn-info btn-sm"
											style="color: white; text-decoration: none">${vehicle.vehicleid}</a></td>
										<td>${vehicle.vehiclemodel }</td>
										<td>${vehicle.vehiclenplate }</td>
										<td>${vehicle.visitVrun }</td>
										<td>${vehicle.visitVentryDate }</td>
										<td>${vehicle.tname }</td>
										<td><button type="button" class="btn btn-danger btn-sm"
												onclick="confirmDeleteforvehicle(${vehicle.vehicleid})">Delete</button></td>
									</tr>
								</c:if>
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

		
		//for vehicle model 
		 function validateVehicleModel() {
    const inputField = document.getElementById('inputVehicleModel');
    const errorMessage = document.getElementById('error-message');
    
    
    
    // Regular expression: no leading spaces, no special characters, only one space between words
    const regex = /^[a-zA-Z0-9]+(?: [a-zA-Z0-9]+)*$/;

    if (!regex.test(inputField.value)) {
        errorMessage.style.display = 'block';
        inputField.setCustomValidity('Invalid vehicle model name.');
    } else {
        errorMessage.style.display = 'none';
        inputField.setCustomValidity('');
    }
 	
}
		 
		
		 function clearValidationMessage(fieldId, messageId) {
				const field = document.getElementById(fieldId);
				const message = document.getElementById(messageId);

				if (field.value.trim() === "") {
					message.style.display = 'none';
					field.setCustomValidity('');
			    }
			}
		
		
		
		//for delete the vehicle
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
	    
		function validateVehicleNumber() {
		    const input = document.getElementById('inputVehicleNPlate').value;
		    const errorMsg = document.getElementById('vehicleNPlateError');
		    
		    // Clear error message if input is empty
		    if (input.trim() === "") {
		        errorMsg.style.display = 'none'; // Hide the error message
		        return; // Stop further validation
		    }

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
		
		function checkVehicleNumber() {
			const vehicleNumber = document.getElementById('inputVehicleNPlate').value;
	        console.log(vehicleNumber)
	        if (vehicleNumber.length > 0) {
	            // Send Ajax request
	            var xhr = new XMLHttpRequest();
	            xhr.open("GET", "/CarGarageApplicationMVC/checkVehicleNumber?vehicleNumber=" + vehicleNumber, true);
	            
	            xhr.onreadystatechange = function () {
	                if (xhr.readyState == 4 && xhr.status == 200) {
	                    const response = xhr.responseText;

	                    // Show error if vehicle number exists
	                    if (response === 'exists') {
	                        const errorMsg = document.getElementById('vehicleNPlateError');
	                        errorMsg.innerHTML = "Vehicle number already exists.";
	                        errorMsg.style.display = 'inline';
	                    }
	                }
	            };
	            xhr.send();
	        }
	    }

	  
		 // Check if the message exists
	    var messageLabel = document.getElementById("messageLabel");
	    if (messageLabel && messageLabel.innerHTML.trim() !== "") {
	        // Set a timeout to hide the message after 5 seconds (5000 ms)
	        setTimeout(function() {
	            messageLabel.style.display = "none";
	        }, 2000); // 5000 milliseconds = 5 seconds
	    }
	    
	</script>

</body>
</html>

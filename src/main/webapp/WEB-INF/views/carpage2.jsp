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
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	background-color: #0A2558;
	font-size: 15px;
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
			<li><a href="dashboard"> <i class="bx bx-grid-alt"></i> <span
					class="links_name">Dashboard</span>
			</a></li>

			<li><a href="adminside"> <i class='bx bxs-group'></i> <span
					class="links_name">Customers Section</span>
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
				<img src="" alt="" /> <span class="admin_name">${adminName}</span>
				<!-- <i class="bx bx-chevron-down"></i> -->
			</div>
		</nav>
		<div class="home-content">
			<div class="overview-boxes">
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Update Panel</div>

					</div>
				</div>
			</div>



			<div class="sales-boxes">
				<div class="recent-sales box">


					<form:form action="goingtoupdatecar" method="POST" id="userForm"
						onsubmit="return validateForm()">


						<!-- Submit Button (Disabled by default) -->
						<div class="button-container">
							<button id="btnsubmit" type="submit" style="background-color: #0A2558" disabled>Submit</button>
						</div>
						<div style="text-align: center;">
							<label style="color: blue;">${msg}</label>
						</div>
						<input type="hidden" name="vehicleid" value="${carinfo.vehicleid}">
						<!-- Vehicle Model name -->
						<div class="form-group">
							<label for="nameField">Vehicle Model</label><input type="text"
								class="form-control" id="inputName4" name="vehiclemodel"
								placeholder="Enter Vehicle Model"
								value="${carinfo.vehiclemodel}"
								onkeyup="validateVehicleModel(); clearValidationMessageforCar('inputName4','error-message')" />
							<span id="error-message" style="color: red; display: none;">Invalid
								vehicle model name. Ensure no leading spaces, special
								characters, and no more than one space between words.</span>
						</div>

						<!-- Number plate Field -->
						<div class="form-group">
							<label for="contactField">Vehicle Registered Number</label> <input
								type="text" id="inputVehicleNPlate" name="vehiclenplate"
								placeholder="Enter Vehicle Registered number"
								value="${carinfo.vehiclenplate}" maxlength="10"
								onkeyup="validateVehicleNumber(); clearValidationMessage('inputVehicleNPlate','vehicleNPlateError')"
								onchange="checkVehicleNumber()" /> <span
								id="vehicleNPlateError" style="color: red; display: none;">Invalid
								vehicle number plate</span>
						</div>


						<!-- Vehicle KM Running -->
						<div class="form-group">
							<label for="emailField">Vehicle Running in Km</label> <input
								type="number" id="inputVehicleDate8" name="visitVrun"
								placeholder="Enter Vehicle Running in Km"
								value="${carinfo.visitVrun }" />

						</div>

						<!-- Vehicle Entry Date -->
						<div class="form-group">
							<label for="emailField">Vehicle Entry Date</label> <input
								type="date" id="inputVehicleDate8" name="visitVentryDate"
								placeholder="Enter Vehicle Entry Date"
								value="${carinfo.visitVentryDate}" />

						</div>
					</form:form>
				</div>
			</div>

			<!-- modal button -->
			<div class="button1" style="margin-top: 20px;">
				<button type="submit" id="openModalBtn">Add Customer</button>
			</div>
			<!-- Modal Structure -->
			<div id="myModal" class="modal">
				<div class="modal-content">
					<span class="close">&times;</span>

					<h2>Fillup Customer Details</h2>
					<form:form action="submitformforvehiclenduser" method="POST"
						modelAttribute="modalform" id="userFormModal"
						onsubmit="return validateUserForm()">


						<input type="hidden" name="userid" value="${VisitID }">
						<!-- name field -->
						<div class="form-group">
							<label for="inputVehicleModel5" class="form-label">Name</label> <input
								type="text" id="nameField" name="username"
								placeholder="Enter full name" value="${userinfo.username}"
								required="required"
								onkeyup="validateName(); clearValidationMessageforCar('nameField', 'error-message-name')" />
							<span id="error-message-name" style="color: red; display: none;">Invalid
								User Name. Ensure no leading spaces, special characters, and no
								more than one space between words.</span>
						</div>

						<!-- contact -->
						<div class="form-group">
							<label for="inputVehicleNPlate6" class="form-label">Contact</label>
							<input type="text" id="contactField" name="usercontact"
								required="required" placeholder="Enter phone number"
								value="${userinfo.usercontact}" maxlength="10"
								onkeyup="validateContact(); clearValidationMessage('contactField', 'contactValidationMessage')" />
							<span id="contactValidationMessage"></span>
						</div>

						<!-- email -->
						<div class="form-group">
							<label for="inputVehicleKM7" class="form-label">Email</label> <input
								type="email" id="emailField" name="useremail"
								required="required" placeholder="Enter email"
								value="${userinfo.useremail}"
								onkeyup="validateEmail(); clearValidationMessage('emailField', 'emailValidationMessage')" />
							<span id="emailValidationMessage1"></span>
						</div>

						<!-- address -->
						<div class="form-group">
							<label for="inputVehicleDate8" class="form-label">Address</label>
							<input type="text" id="addressField" name="useraddress"
								required="required" placeholder="Enter home address"
								value="${userinfo.useraddress}"
								onkeyup="validatAddress(); clearValidationMessageforCar('addressField', 'error-message-address')" />
							<span id="error-message-address"
								style="color: red; display: none;">Invalid Address.
								Ensure no leading spaces, special characters, and no more than
								one space between words.</span>

						</div>
						<!-- Submit Button -->
						<button type="submit">Submit</button>
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
									<th scope="col">Name</th>
									<th scope="col">Contact</th>
									<th scope="col">Email</th>
									<th scope="col">Address</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty customer }">
									<tr>
										<td><a href="updateSave?userID=${customer.userid }"
											type="button" style="color: white; text-decoration: none"
											class="btn btn-info btn-sm">${customer.userid }</a></td>

										<td>${customer.username }</td>
										<td>${customer.usercontact }</td>
										<td>${customer.useremail }</td>
										<td>${customer.useraddress }</td>
										<td><button type="button" class="btn btn-danger btn-sm"
												onclick="confirmDelete(${customer.userid})">Delete</button></td>

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

		
		
		function validateForm() {
		    let isValid = true;

		    // Validate vehicle model
		    const vehicleModelField = document.getElementById("inputName4");
		    const vehicleModelError = document.getElementById("error-message");
		    if (!validateVehicleModel()) {
		        isValid = false;
		    }

		    // Validate vehicle number plate
		    const vehicleNumberField = document.getElementById("inputVehicleNPlate");
		    const vehicleNumberError = document.getElementById("vehicleNPlateError");
		    if (!validateVehicleNumber()) {
		        isValid = false;
		    }

		    // Validate other fields (if necessary)
		    // Add more validation checks if needed

		    // Return false to prevent form submission if any validation fails
		    return isValid;
		}

		
		
		
		/* document.getElementById("userForm").addEventListener("submit", function(event) {
	        if (validateForm()) {
	            alert("Vehicle details updated successfully!");
	        }
	    }); */
		
		function validateVehicleModel() {
		    const inputField = document.getElementById('inputName4');
		    const errorMessage = document.getElementById('error-message');
		    const regex = /^[a-zA-Z0-9]+(?: [a-zA-Z0-9]+)*$/;

		    if (!regex.test(inputField.value)) {
		        errorMessage.style.display = 'block';
		        inputField.setCustomValidity('Invalid vehicle model name.');
		        return false;
		    } else {
		        errorMessage.style.display = 'none';
		        inputField.setCustomValidity('');
		        return true;
		    }
		}

		

		function confirmDelete(userId) {
	        // Show confirmation dialog
	        
	        if (confirm("Do you really want to delete this user?")) {
	            // If the user confirms, proceed with AJAX call
	            let xhr = new XMLHttpRequest();
	             // Adjust the URL based on your controller's mapping
	            // Define what happens on successful data submission
	            xhr.onreadystatechange = function () {
	                if (xhr.readyState == 4 && xhr.status == 200) {
	                    // Response from the server (success)
	                    let response=xhr.responseText;
	                    console.log(response)
	                    if(response==='success'){
	                    	alert("User deleted successfully.");
		                    // Optionally, you can remove the row from the table
		                    window.location.reload(); // Refresh the page to see the changes
		                
	                    }else{
	                    	alert("something went wrong")
	                    }
	                 }
	            };

	            xhr.open("GET", "deleteUser?userID="+userId, true);
	            // Send the userId as the data
	            xhr.send();
	        } 
	    }

		//for modal form

		 // Get modal element and button
    const modal = document.getElementById("myModal");
    const openModalBtn = document.getElementById("openModalBtn");
    const closeModalBtn = document.getElementsByClassName("close")[0];
    const submitBtn = document.querySelector("#userFormModal button[type='submit']");
    
    // Function to check if form fields are populated
    function checkFormFields() {
        const nameField = document.getElementById("nameField").value.trim();
        const contactField = document.getElementById("contactField").value.trim();
        const emailField = document.getElementById("emailField").value.trim();
        const addressField = document.getElementById("addressField").value.trim();
        
        if (nameField || contactField || emailField || addressField) {
            return true; // Form fields have data
        } else {
            return false; // No data in form fields
        }
    }

    // Open modal when the button is clicked
    openModalBtn.onclick = function() {
        modal.style.display = "block";
        if (checkFormFields()) {
            alert("Form already contains data.");
            submitBtn.disabled = true; // Disable the submit button
        } else {
            submitBtn.disabled = false; // Enable the submit button
        }
    };

    // Close modal when the 'x' is clicked
    closeModalBtn.onclick = function() {
        modal.style.display = "none";
    };

    // Close modal when clicking outside the modal content
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };

		
		
		
		
		
		
	    
	    
	    
	    function validateUserForm() {
	        let isValid = true;

	        // Validate name
	        const nameField = document.getElementById("nameField");
	        const nameError = document.getElementById("error-message-name");
	        if (!validateName()) {
	            isValid = false;
	        }

	        // Validate contact
	        const contactField = document.getElementById("contactField");
	        const contactError = document.getElementById("contactValidationMessage");
	        if (!validateContact()) {
	            isValid = false;
	        }

	        // Validate email
	        const emailField = document.getElementById("emailField");
	        const emailError = document.getElementById("emailValidationMessage1");
	        if (!validateEmail()) {
	            isValid = false;
	        }

	        // Validate address
	        const addressField = document.getElementById("addressField");
	        const addressError = document.getElementById("error-message-address");
	        if (!validatAddress()) {
	            isValid = false;
	        }

	        // Return false to prevent form submission if any validation fails
	        return isValid;
	    }

	    
	    document.getElementById("userFormModal").addEventListener("submit", function(event) {
	        if (validateUserForm()) {
	            alert("User details added successfully!");
	            document.getElementById("myModal").style.display = "none";
	        }
	    });
	    
	    
	    
	    function validateName() {
	        const nameField = document.getElementById("nameField");
	        const validationMessage = document.getElementById("error-message-name");
	        const regex = /^[a-zA-Z]+(?: [a-zA-Z]+)*$/;

	        if (!regex.test(nameField.value)) {
	            validationMessage.style.display = 'block';
	            nameField.setCustomValidity('Invalid User name.');
	            return false;
	        } else {
	            validationMessage.style.display = 'none';
	            nameField.setCustomValidity('');
	            return true;
	        }
	    }

	    function validateContact() {
	        const contactField = document.getElementById("contactField");
	        const contactValidationMessage = document.getElementById("contactValidationMessage");
	        const contactRegex = /^[0-9]{10}$/;

	        if (!contactRegex.test(contactField.value.trim())) {
	            contactValidationMessage.textContent = "Invalid phone number. Only 10 digits allowed.";
	            contactValidationMessage.style.color = "red";
	            return false;
	        } else {
	            contactValidationMessage.textContent = "";
	            return true;
	        }
	    }

	    function validateEmail() {
	        const emailField = document.getElementById("emailField");
	        const emailValidationMessage = document.getElementById("emailValidationMessage1");
	        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

	        if (!emailRegex.test(emailField.value.trim())) {
	            emailValidationMessage.textContent = "Invalid email format.";
	            emailValidationMessage.style.color = "red";
	            return false;
	        } else {
	            emailValidationMessage.textContent = "";
	            return true;
	        }
	    }

	    function validatAddress() {
	        const addressField = document.getElementById('addressField');
	        const errorMessage = document.getElementById('error-message-address');
	        const regex = /^[a-zA-Z0-9]+(?: [a-zA-Z0-9]+)*$/;

	        if (!regex.test(addressField.value)) {
	            errorMessage.style.display = 'block';
	            addressField.setCustomValidity('Invalid Address input.');
	            return false;
	        } else {
	            errorMessage.style.display = 'none';
	            addressField.setCustomValidity('');
	            return true;
	        }
	    }
	    
	    
	    function validateVehicleNumber() {
	        const input = document.getElementById('inputVehicleNPlate').value;
	        const errorMsg = document.getElementById('vehicleNPlateError');
	        const submitButton =document.getElementById('btnsubmit'); // Adjust selector if necessary
	        const initialCheck = /^[A-Za-z][A-Za-z0-9 ]*$/;
	        const vehicleNumberPattern = /^[A-Z]{2}\d{2}[A-Z]{2}\d{1,4}$/;

	        // Reset submit button initially
	        submitButton.disabled = false;

	        if (input.length !== 10) {
	            errorMsg.innerHTML = "Vehicle number must be exactly 10 characters.";
	            errorMsg.style.display = 'inline';
	            submitButton.disabled = true; // Disable submit button
	            return false;
	        } else if (!initialCheck.test(input)) {
	            errorMsg.innerHTML = "Number plate cannot start with spaces, digits, or special characters.";
	            errorMsg.style.display = 'inline';
	            submitButton.disabled = true;
	            return false;
	        } else if (!vehicleNumberPattern.test(input)) {
	            errorMsg.innerHTML = "Invalid vehicle number plate format. Expected format: MH12AB1234.";
	            errorMsg.style.display = 'inline';
	            submitButton.disabled = true;
	            return false;
	        } else {
	            errorMsg.style.display = 'none';
	            return true;
	        }
	    }

	    function checkVehicleNumber() {
	        const vehicleNumber = document.getElementById('inputVehicleNPlate').value;
	        const submitButton = document.getElementById('btnsubmit'); // Adjust selector if necessary
	        if (vehicleNumber.length > 0) {
	            var xhr = new XMLHttpRequest();
	            xhr.open("GET", "/CarGarageApplicationMVC/checkVehicleNumber?vehicleNumber=" + vehicleNumber, true);
	            
	            xhr.onreadystatechange = function () {
	                if (xhr.readyState == 4 && xhr.status == 200) {
	                    const response = xhr.responseText;

	                    if (response === 'exists') {
	                        const errorMsg = document.getElementById('vehicleNPlateError');
	                        errorMsg.innerHTML = "Vehicle number already exists.";
	                        errorMsg.style.display = 'inline';
	                        submitButton.disabled = true; // Disable submit button
	                    }
	                }
	            };
	            xhr.send();
	        }
	    }

	    function clearValidationMessage(fieldId, messageId) {
	        const field = document.getElementById(fieldId);
	        const message = document.getElementById(messageId);
	        const submitButton = document.querySelector('input[type="submit"]'); // Adjust selector if necessary

	        if (field.value.trim() === "") {
	            message.style.display = 'none';
	            submitButton.disabled = false; // Enable submit button if no error
	        }
	    }

	    

	</script>

</body>
</html>


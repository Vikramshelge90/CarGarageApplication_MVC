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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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
			<li><a href="techiepage" class="active"> <i
					class="bx bxs-group"></i> <span class="links_name">Technician</span>
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
						<div class="box-topic">Technician Search Panel</div>

					</div>
				</div>
			</div>

			<div class="button1">
				<a href="addnewTechie">Add Technician</a>
			</div>

			<div class="sales-boxes">
				<div class="recent-sales box">


					<%-- 					<form:form action="processform" method="POST"
						modelAttribute="userDetails" id="userForm"> --%>

					<!-- Name Field -->
					<div class="form-group">
						<label for="inputVehicleNPlate">Search Techie by Name</label> <input
							type="text" id="techiefield" name="vehiclenplate"
							placeholder="Enter Vehicle Registered number"
							value="${techie.tname}" onkeyup="searchTechie()" /> <span
							id="techieError" style="color: red; display: none;">No
							Technician found</span>
					</div>


					<%-- 
						<!-- Submit Button (Disabled by default) -->
						<div class="button-container">
							<button type="submit">Search</button>
						</div>
					</form:form> --%>
				</div>
			</div>
			<div class="sales-boxes" style="margin-top: 20px;">
				<div class="recent-sales box">
					<!-- Table responsive wrapper -->
					<div class="disptable" style="margin-top: 30px;">
						<table id="resultsTable" class="table">
							<thead>
								<tr class=" table-success">
									<th scope="col">Sr no.</th>
									<th scope="col">Technician Name</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<%
								int count = 0;
								%>
								<c:forEach var="techie" items="${techies}">
									<tr>
										<td><a href="#"
											type="button" class="btn btn-info btn-sm"
											style="color: white; text-decoration: none"><%=++count%></a></td>
										<td>${techie.tname}</td>

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


		
		
		function clearValidationMessageforCar(fieldId, messageId) {
			const field = document.getElementById(fieldId);
			const message = document.getElementById(messageId);

			if (field.value.trim() === "") {
				message.style.display = 'none';
				field.setCustomValidity('');
			}
		}
		
		
	
	    function confirmDeleteforTechie(techieId) {
	        // Show confirmation dialog
	        
	        if (confirm("Do you really want to delete this Technician?")) {
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
	                    	alert("Technician deleted successfully.");
		                    // Optionally, you can remove the row from the table
		                    window.location.reload(); // Refresh the page to see the changes
		                
	                    }else{
	                    	alert("something went wrong")
	                    }
	                 }
	            };

	            xhr.open("GET", "deleteTechie?techieId="+techieId, true);
	            // Send the userId as the data
	            xhr.send();
	        } 
	    }
	    
	    $(document).ready(function() {
	        // Fetch all data when the page loads
	        searchTechie();

	        // Attach event handlers for form input fields
	        $('#techiefield').on('keyup', searchTechie);
	    });
	    
	    
	    function searchTechie() {
	        var tname = $('#techiefield').val().trim();

	        // Prepare an AJAX request
	        $.ajax({
	            url: 'searchForTechie', // Controller endpoint to process the form
	            type: 'POST',
	            dataType: 'json', // Expect JSON from the server
	            data: {
	                tname: tname || null,   // Send null for empty fields
	                
	            },
	            success: function(response) {
	                // Clear the existing table rows
	                $("tbody").empty();

	                // Append new rows to the table from the response
	                response.forEach(function(techie, index) {
	                    var row = '<tr>' +
	                    '<td><a href="#" type="button" class="btn btn-info btn-sm" style="color: white; text-decoration: none">' + (index + 1) + '</a></td>' +
	                     '<td>' + (techie.tname || '') + '</td>'+
	                        '</tr>';
	                    $("tbody").append(row);
	                });
	            },
	            error: function() {
	                console.log('Error retrieving data.');
	            }
	        });
	    }

	    
	    
	    
		/* function searchTechie() {
		    const tname = document.getElementById('techiefield').value;
		    const errorMsg = document.getElementById('techieError');
		    const resultsTable = document.getElementById('resultsTable').getElementsByTagName('tbody')[0];

		    if (vehicleNumber.length > 0) {
		        const xhr = new XMLHttpRequest();
		        xhr.open('GET', '/CarGarageApplicationMVC/checktechie?techieName=' + tname, true);

		        xhr.onreadystatechange = function () {
		            if (xhr.readyState == 4 && xhr.status == 200) {
		                const response = JSON.parse(xhr.responseText);
		                resultsTable.innerHTML = ''; // Clear previous results

		                if (response.length > 0) {
		                    errorMsg.style.display = 'none'; // Hide error message if there are results

		                    response.forEach((vehicle, index) => {
		                        const row = resultsTable.insertRow();

		                        // First cell with anchor tag styled as button
		                        const firstCell = row.insertCell(0);
		                        const buttonAnchor = document.createElement('a');
		                        buttonAnchor.href = '/CarGarageApplicationMVC/updateSavefortechie?techieID=' + vehicle.tid;
		                        buttonAnchor.className = 'btn btn-info btn-sm'; // Bootstrap classes for button look
		                        buttonAnchor.style.color = 'white';
		                        buttonAnchor.style.textDecoration = 'none';
		                        buttonAnchor.innerText = vehicle.vehicleid;  // Display vehicle ID as button text
		                        firstCell.appendChild(buttonAnchor);

		                        // Other cells
		                        row.insertCell(1).innerHTML = vehicle.tname;
		                       
		                    });
		                } else {
		                    errorMsg.style.display = 'inline'; // Show error message if no results found
		                }
		            }
		        };
		        xhr.send();
		    } else {
		        resultsTable.innerHTML = ''; // Clear table when input is cleared
		        errorMsg.style.display = 'none'; // Hide error message when input is empty
		    }
		} */
	    
	</script>

</body>
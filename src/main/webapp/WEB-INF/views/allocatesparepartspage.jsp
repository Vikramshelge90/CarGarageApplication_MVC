<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
	href="resources/css/styleadmin.css" />
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
	border-radius: 25px;
	display: flex;
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
	display: flex;
	justify-content: space-between;
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

.quantity {
	width: 70px;
	text-align: right;
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
		<!-- Sidebar Content -->
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
			<li><a href="sparePartspage" class="active"> <i
					class="bx bx-wrench"></i> <span class="links_name">Spare
						Parts</span>
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
			<div class="profile-details">
				<img src="" alt="" /> <span class="admin_name">${adminName}</span>
			</div>
		</nav>
		<div class="home-content">
			<div class="overview-boxes">
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Select Spare Parts</div>
					</div>
				</div>
			</div>

		<div class="sales-boxes" style="margin-top: 20px;">
                <div class="recent-sales box">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade show active" id="v-pills-profile" role="tabpanel" aria-labelledby=v-pills-profile-tab>
                            <form:form action="submitSpareParts?vvid=${visitID}" method="POST" onsubmit="return validateSparePartsSelection()">
                                <div class="row">
                                    <div class="col-md-12">
                                        <c:forEach var="sparePartEntry" items="${mapSpareParts}">
                                            <div class="card shadow-sm p-3 mb-3 bg-body rounded">
                                                <!-- Main Category Checkbox -->
                                                <div class="card-header bg-info text-white">
                                                    <input type="checkbox" class="form-check-input me-2"
                                                        id="mainCategory${sparePartEntry.key.mspid}"
                                                        onclick="toggleSubCategories(this, 'subCategory${sparePartEntry.key.mspid}')" />
                                                    <label class="form-check-label fw-bold"
                                                        for="mainCategory${sparePartEntry.key.mspid}">
                                                        ${sparePartEntry.key.mspname} </label>
                                                </div>
                                                <!-- Subcategories -->
                                                <div class="card-body">
                                                    <div class="subcategory">
                                                        <c:forEach var="subCategory" items="${sparePartEntry.value}">
                                                            <div class="d-flex align-items-center mb-2">
                                                                <!-- Subcategory Checkbox -->
                                                                <div class="flex-grow-1">
                                                                    <input type="checkbox"
                                                                        class="form-check-input subCategory${sparePartEntry.key.mspid} me-2"
                                                                        id="subCategory_${subCategory.spid}"
                                                                        name="subCategory_${subCategory.spid}"
                                                                        onchange="setDefaultQuantity(this, 'quantity_${subCategory.spid}')" />
                                                                    <label class="form-check-label"
                                                                        for="subCategory_${subCategory.spid}">
                                                                        ${subCategory.spname} </label>
                                                                </div>
                                                                <!-- Quantity Input -->
                                                                <input type="number"
                                                                    class="form-control form-control-sm quantity ms-auto"
                                                                    id="quantity_${subCategory.spid}"
                                                                    name="quantity_${subCategory.spid}" min="1" max="10"
                                                                    placeholder="Qty" />
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
                            </form:form>

                            <!-- Display server-side message as a pop-up alert -->
                            <c:if test="${not empty message}">
                                <script type="text/javascript">
                                    alert("${message}");
                                </script>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <script>
        // Function to check if any spare parts are selected before form submission
        function validateSparePartsSelection() {
            let checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
            if (checkboxes.length === 0) {
                // If no checkboxes are selected, show alert and prevent form submission
                alert("Please select at least one spare part.");
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }

        function toggleSubCategories(mainCategoryCheckbox, subCategoryClass) {
            let subCategories = document.getElementsByClassName(subCategoryClass);
            for (let checkbox of subCategories) {
                checkbox.checked = mainCategoryCheckbox.checked;
                checkbox.dispatchEvent(new Event('change'));
            }
        }

        function setDefaultQuantity(subCategoryCheckbox, quantityId) {
            let quantityInput = document.getElementById(quantityId);
            if (subCategoryCheckbox.checked && !quantityInput.value) {
                quantityInput.value = 1; // Set default quantity to 1
            } else if (!subCategoryCheckbox.checked) {
                quantityInput.value = ''; // Clear quantity if unchecked
            }

            // Ensure quantity is within valid range
            quantityInput.addEventListener('input', function() {
                let value = parseInt(this.value, 10);
                if (value < 1) this.value = 1;
                if (value > 10) this.value = 10;
            });
        }
    </script>
</body>
</html>

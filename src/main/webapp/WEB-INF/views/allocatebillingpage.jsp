<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<% 
    // Set current date in "dd/MM/yyyy" format
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String currentDate = sdf.format(new Date());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Billing Section</title>

<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="resources/css/styleadmin.css" />

<style type="text/css">
/* General styles */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

/* Container for the entire form */
.billing-container {
    width: 80%;
    margin: 30px auto;
    background-color: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #0A2558;
    margin-bottom: 20px;
    font-size: 28px;
}

.invoice-container {
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 10px;
    margin-top: 20px;
}

.logo-section h1 {
    color: #0A2558;
    font-size: 30px;
    text-align: center;
    margin-bottom: 30px;
}

.row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.column {
    width: 48%;
}

.contact-info, .bill-info, .customer-info, .vehicle-info {
    background-color: #f9f9f9;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 20px;
    border: 1px solid #ddd;
}

.contact-info p, .bill-info p, .customer-info p, .vehicle-info p {
    font-size: 16px;
    color: #333;
    margin: 5px 0;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
}

table th, table td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

table th {
    background-color: #0A2558;
    color: #fff;
}

table tbody tr:hover {
    background-color: #f1f1f1;
}

.totals {
    text-align: right;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    margin-top: 20px;
    border: 1px solid #ddd;
}

.totals p {
    font-size: 18px;
    color: #333;
    margin: 8px 0;
}

.print-btn, .payment-btn {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.print-btn button, .payment-btn button {
    background-color: #0A2558;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.print-btn button:hover, .payment-btn button:hover {
    background-color: #0d3073;
}

/* Mobile View Adjustments */
@media (max-width: 768px) {
    .row {
        flex-direction: column;
    }
    .column {
        width: 100%;
        margin-bottom: 20px;
    }
}
</style>
</head>
<body>
	<div class="billing-container">
		<div class="invoice-container">
			<div class="logo-section">
				<h1><i class="fa-solid fa-car-on"></i> GoGarage Automobs</h1>
			</div>

			<div class="row">
				<div class="column">
					<div class="contact-info">
						<p><strong>Contact:</strong> 8208309995</p>
						<p><strong>Address:</strong> Near Warje Bridge, Pune 411058</p>
					</div>
				</div>
				<div class="column">
					<div class="bill-info">
						<p><strong>Bill No:</strong> ${billingModel.billID}</p>
						<p><strong>Date:</strong> <%= currentDate %></p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="column">
					<div class="customer-info">
						<p><strong>Customer Name:</strong> ${billingModel.userDetailsModel.username}</p>
						<p><strong>Customer Contact:</strong> ${billingModel.userDetailsModel.usercontact}</p>
					</div>
				</div>
				<div class="column">
					<div class="vehicle-info">
						<p><strong>Vehicle No:</strong> ${billingModel.vehicleFormModel.vehiclenplate}</p>
						<p><strong>Vehicle Model:</strong> ${billingModel.vehicleFormModel.vehiclemodel}</p>
						<p><strong>Vehicle Technician:</strong> ${billingModel.vehicleFormModel.tname}</p>
					</div>
				</div>
			</div>

			<!-- Services Table -->
			<table>
				<thead>
					<tr>
						<th>Sr.No</th>
						<th>Services</th>
						<th>Price</th>
						
					</tr>
				</thead>
				<tbody>
				<% int count2=0; %>
					<c:forEach var="service" items="${billingModel.subService}">
						<tr>
							<td><%=++count2 %></td>
							<td>${service.ssname}</td>
							<td>${service.ssprice}</td>
							<%-- <td>${service.servicePrice}</td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- Spare Parts Table -->
			<table>
				<thead>
					<tr>
						<th>Sr.No</th>
						<th>Spare Parts</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
				<% int count=0; %>
					<c:forEach var="sparePart" items="${billingModel.subSpareParts}">
						
						<tr>
							<td><%=++count %></td>
							<td>${sparePart.key.spname}</td>
							<td>${sparePart.key.spprice}</td>
							<td>${sparePart.value}</td>
							 <td>${sparePart.key.spprice * sparePart.value}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="totals">
				<p><strong>Subtotal (Services):</strong> ${billingModel.subTotalServices}</p>
				<p><strong>Subtotal (Spare Parts):</strong> ${billingModel.subTotalSpareParts}</p>
				<p><strong>GST (9%):</strong> ${(billingModel.subTotalServices + billingModel.subTotalSpareParts) * 0.09}</p>
				<p><strong>CGST (9%):</strong> ${(billingModel.subTotalServices + billingModel.subTotalSpareParts) * 0.09}</p>
				<p><strong>Final Bill:</strong> ${billingModel.subTotalServices + billingModel.subTotalSpareParts + (billingModel.subTotalServices + billingModel.subTotalSpareParts) * 0.18}</p>
			</div>
			
			<div class="payment-btn">
				<button onclick="window.location.href='paymentPage'">Proceed to Payment</button>
			</div>
			
			<div class="print-btn">
				<button onclick="window.print()">Print Bill</button>
			</div>

		</div>
	</div>
</body>
</html>

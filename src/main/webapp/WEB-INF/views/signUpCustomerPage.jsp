<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up for GoGarage AutoMobs</title>
<link rel="icon" type="image/x-icon"
    href="resources/images/website-feviicon.png" />

<style type="text/css">
/* Your existing CSS remains the same */
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	/*   border: 1px solid #000; */
}

.register_form_user {
	/*    border: 1px solid red; */
	height: 500pX;
	width: 36%;
	margin-left: 32%;
	margin-top: 5%;
	border-radius: 6px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

h1 {
	padding-top: 3%;
	text-align: center;
	color: #007bff;
}

h3 {
	text-align: center;
	font-size: 14px;
	font-weight: 700;
	margin-top: 3%;
}

h4 {
	margin-top: -40px;
	font-size: 14px;
	font-weight: 600;
	margin-left: 60%;
	margin-bottom: 5vh;
}

input[type="text"], input[type="password"], select, textarea {
	width: 90%;
	height: 40px;
	padding: 10px;
	margin-top: 1px;
	margin-left: 5%;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 16px;
}

input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 16px;
	margin-left: 8%;
}

input[type="reset"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 16px;
	margin-left: 1%;
}

input[type="checkbox"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 8px;
	margin-left: 5%;
}
	label{
		font-size: 15px;
		width: 100%
	}

.error-message {
	color: red;
	font-size: 14px;
	margin-top: 13px;
	margin-left: 10%;
}

.more-info-section-2 {
	width: 100%;
	margin-top: 5%;
	/* border: 1px solid white; */
}

.more-info-section-2 h3 {
	font-size: 12px;
	/* margin-top: 20px; */
	font-family: "Poppins", sans-serif;
	font-weight: 100;
	text-align: center;
	color: black;
}

@media ( max-width : 1024px) {
	.register_form_user {
		border: 1px solid #007bff;
		height: 500pX;
		width: 60%;
		margin-left: 20%;
		margin-top: 8%;
		border-radius: 6px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	}
}

@media ( max-width : 480px) {
	.register_form_user {
		border: 1px solid #007bff;
		height: 450pX;
		width: 90%;
		margin-left: 5%;
		margin-top: 30%;
		border-radius: 6px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	}
	h1 {
		text-align: center;
		color: #007bff;
		font-size: 20px;
	}
	h3 {
		text-align: center;
		font-size: 10px;
		font-weight: 700;
		margin-top: 3%;
	}
	h4 {
		margin-top: 10px;
		font-size: 10px;
		font-weight: 600;
		margin-left: 60%;
		margin-bottom: 5vh;
	}
	input[type="text"], input[type="password"], select, textarea {
		width: 90%;
		height: 30px;
		padding: 10px;
		margin-top: 1px;
		margin-left: 5%;
		border: 1px solid #ccc;
		border-radius: 5px;
		box-sizing: border-box;
		font-size: 16px;
	}
	input[type="submit"] {
		background-color: #007bff;
		color: #fff;
		border: none;
		border-radius: 5px;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 11px;
		/* margin-left: 8%; */
		height: 12%;
		width: 38%;
	}
	input[type="reset"] {
		background-color: #007bff;
		color: #fff;
		border: none;
		border-radius: 5px;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 11px;
		/* margin-left: 8%; */
		height: 12%;
		width: 38%;
	}
	input[type="checkbox"] {
		background-color: #007bff;
		color: #fff;
		border: none;
		border-radius: 5px;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 8px;
		/* margin-left: 7%; */
	}
	.error-message {
		color: red;
		font-size: 11px;
		margin-top: 13px;
		margin-left: 10%;
	}
	.more-info-section-2 {
		width: 100%;
		margin-top: 16%;
		/* border: 1px solid white; */
	}
	.more-info-section-2 h3 {
		font-size: 11px;
		/* margin-top: 20px; */
		font-family: "Poppins", sans-serif;
		font-weight: 400;
		text-align: center;
		color: black;
	}
}
</style>

</head>
<body>
    <div class="register_form_user">
        <h1>GoGarage AutoMobs</h1>
        <h3>Create a New Account</h3>

        <form:form name="RegForm" action="submitCustDetails" method="Post"
            modelAttribute="reguser" onsubmit="return validateForm()">
            <p>
                <input type="text" id="name" name="username"
                    placeholder="Enter your name" /> 
                <span id="name-error" class="error-message"></span>
            </p>
            <p>
                <input type="text" id="contactnumber" placeholder="Enter your Contact Number"
                    name="usercontact" /> 
                <span id="validationcontactMessage" class="error-message"></span>
            </p>
            <p>
                <input type="text" id="email" name="useremail"
                    placeholder="Enter your email" maxlength="60" /> 
                <span id="emailValidationMessage" class="error-message"></span>
            </p>

            <p>
                <input type="text" id="address" name="useraddress"
                    placeholder="Enter your Address" required /> 
                <span id="address-error" class="error-message"></span>
            </p>

            <p>
                <input type="checkbox" id="agree" name="Agree" /> 
                <label for="agree">I agree to the Terms & Conditions of GoGarage AutoMobs</label> 
                <span id="agree-error" class="error-message"></span>
            </p>

            <p>
                <input type="submit" value="Send" name="Submit" /> 
                <input type="reset" value="Reset" name="Reset" />
            </p>

            <div style="text-align: center;">
                <span style="color: blue;">${msg}</span>
            </div>

            <a href="custlogin"><h3>Already have an account?</h3></a>
        </form:form>
        <div class="more-info-section-2">
            <h3>
                All material<span>&copy; 2024 GoGarage AutoMobs company Pvt.Ltd. All Rights Reserved 2024</span>
            </h3>
        </div>
    </div>

    <script>
    // Real-time validation functions
    document.getElementById('name').addEventListener('input', validateName);
    document.getElementById('contactnumber').addEventListener('input', validateContact);
    document.getElementById('email').addEventListener('input', validateEmail);
    document.getElementById('address').addEventListener('input', validateAddress);

    // Helper function to remove leading spaces
    function removeLeadingSpaces(value) {
        return value.replace(/^\s+/, '');
    }

    // Username validation
    function validateName() {
        const nameField = document.getElementById("name");
        const name = removeLeadingSpaces(nameField.value);
        const nameError = document.getElementById("name-error");
        nameError.textContent = "";

        if (name === "" || /\d/.test(name)) {
            nameError.textContent = "Please enter a valid username without numbers.";
        } else if (name.length < 6 || name.length > 50) {
            nameError.textContent = "Username must be between 6 and 50 characters.";
        } else if (/^\s/.test(name)) {
            nameError.textContent = "Username cannot start with a space.";
        }
        
        // Update the input value to sanitized value
        nameField.value = name;
    }

    // Contact number validation
    function validateContact() {
        const contact = document.getElementById("contactnumber").value;
        const contactError = document.getElementById("validationcontactMessage");
        contactError.textContent = "";

        if (contact.length !== 10 || !/^[0-9]+$/.test(contact)) {
            contactError.textContent = "Contact number must be 10 digits and numeric.";
        }
    }

    // Email validation
    function validateEmail() {
        const emailField = document.getElementById("email");
        const email = removeLeadingSpaces(emailField.value);
        const emailError = document.getElementById("emailValidationMessage");
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        emailError.textContent = "";

        if (!emailPattern.test(email)) {
            emailError.textContent = "Invalid email format.";
        }
        
        // Update the input value to sanitized value
        emailField.value = email;
    }

    // Address validation
    function validateAddress() {
        const addressField = document.getElementById("address");
        const address = removeLeadingSpaces(addressField.value);
        const addressError = document.getElementById("address-error");
        addressError.textContent = "";

        if (address === "" || address.length > 50) {
            addressError.textContent = "Address is too long (max 50 characters).";
        } else if (/^\s/.test(address)) {
            addressError.textContent = "Address cannot start with a space.";
        }
        
        // Update the input value to sanitized value
        addressField.value = address;
    }

    // Final form submission validation
    function validateForm() {
        validateName();
        validateContact();
        validateEmail();
        validateAddress();

        const nameError = document.getElementById("name-error").textContent;
        const contactError = document.getElementById("validationcontactMessage").textContent;
        const emailError = document.getElementById("emailValidationMessage").textContent;
        const addressError = document.getElementById("address-error").textContent;
        const agreeError = document.getElementById("agree-error");
        const agreeChecked = document.getElementById("agree").checked;

        if (!agreeChecked) {
            agreeError.textContent = "You must agree to the Terms & Conditions.";
            return false;
        } else {
            agreeError.textContent = "";
        }

        if (nameError || contactError || emailError || addressError) {
            return false; // Prevent form submission if there are validation errors
        }

        return true; // Submit form if no errors
    }
    </script>
</body>
</html>

package mvc.cgapp.controller;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import mvc.cgapp.model.CustomerLoginModel;
import mvc.cgapp.model.UserDetailsModel;
import mvc.cgapp.service.CustomerLoginService;
import mvc.cgapp.service.UserService;

@Controller
//@SessionAttributes("userdata")
public class CustomerLoginController {

	@Autowired
	CustomerLoginService customerLoginService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/custlogin")
	public String customerLoginpage(@ModelAttribute("custdetails") CustomerLoginModel customerLoginModel) {
		
		return "customerloginpage";
		
	}
	
	@PostMapping("/saveloginuser")
	public String Custometlogin(HttpServletRequest request, CustomerLoginModel customerLoginModel,Model model) {
		
		System.out.println(customerLoginModel);
		UserDetailsModel umodel=customerLoginService.isCustomerLogoin(customerLoginModel);
		if(umodel!=null) {
			
			HttpSession session=request.getSession();
			session.setAttribute("customerLogin", umodel);
			return "redirect:/customerprofile";
		}
		else {
			model.addAttribute("msg","Invalid Credentials ☹️");
			return "customerloginpage";
		}

	}
	
	@RequestMapping("/userSignup")
	public String signUpCustomerPage(@ModelAttribute("reguser") UserDetailsModel userDetailsModel) {
		return "signUpCustomerPage";
	}
	
	@PostMapping("/submitCustDetails")
	public String submitSignUpPage(UserDetailsModel userDetailsModel,Model model) {
		boolean res=userService.addNewCustomer(userDetailsModel);
		if(res==true) {
			return "redirect:/custlogin";
		}else {
			model.addAttribute("msg","Credentials Found 😐");
			return "signUpCustomerPage";
		}
	}
	
	
	@RequestMapping("/customerprofile")
	public String customerProfile() {
		
		return "customerProfilePage";
	}
	
	
}

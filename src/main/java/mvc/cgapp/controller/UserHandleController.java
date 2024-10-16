package mvc.cgapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mvc.cgapp.model.TechniciansModel;
import mvc.cgapp.model.UserDetailsModel;
import mvc.cgapp.model.VehicleFormModel;
import mvc.cgapp.service.TechniciansService;
import mvc.cgapp.service.UserService;
import mvc.cgapp.service.UserVehicleService;

@Controller
public class UserHandleController {

	@Autowired
	UserService userService;

	@Autowired
	UserVehicleService userVehicleService;

	@Autowired
	TechniciansService techniciansService;

	private List<TechniciansModel> getalltechies;

//	@RequestMapping("/customerProfilePage")
//	public String customerProfilePage() {
//		
//		return "customerProfilePage";
//	}
//	
//	
//	@RequestMapping("/clientpannel")
//	public String clientPannel(@ModelAttribute("userDetails") UserDetailsModel userDetailsModel) {
//		return "clientPannel";
//	}

//    @ResponseBody
//    public String handleFormSubmission(@RequestBody UserDetailsModel userDetailsModel) {
//        // Log the received data (for debugging)
//        System.out.println("Received data: " + userDetailsModel);
//		return "handle";
//
// 
//	}

	@RequestMapping("/adminside")
	public String admin(@ModelAttribute("userDetails") UserDetailsModel userDetailsModel, Model model) {
		List<UserDetailsModel> allUsers = userService.getAllUser();
		model.addAttribute("Users", allUsers);
		return "admin";
	}

//
//	    @PostMapping("/processform")
//	    @ResponseBody
//	    public List<UserDetailsModel> searchUsers(@RequestParam(required = false) String name,
//	                                  @RequestParam(required = false) String contact,
//	                                  @RequestParam(required = false) String email,
//	                                  @RequestParam(required = false) String address) {
//	    	
//	    	UserDetailsModel get=new UserDetailsModel();
//	    	get.setUsername(name);
//	    	get.setUsercontact(contact);
//	    	get.setUseremail(email);
//	    	get.setUseraddress(address);
//	        // Call service to search users based on provided criteria
//	        List<UserDetailsModel> users = userService.getSelectedUsers(get);
//	        return users;
//	    }

//	@PostMapping("/processform")
//	public String processForm(UserDetailsModel userDetailsModel, Model model) {
//		if (userDetailsModel.getUsername().isEmpty() && userDetailsModel.getUsercontact().isEmpty()
//				&& userDetailsModel.getUseremail().isEmpty() && userDetailsModel.getUseraddress().isEmpty()) {
//
//			List<UserDetailsModel> gettingAllUsers = userService.getAllUser();
//			model.addAttribute("users", gettingAllUsers);
//		} else {
//			model.addAttribute("userinfo", userDetailsModel);
//
//			List<UserDetailsModel> gettingSelectedUsers = userService.getSelectedUsers(userDetailsModel);
//			model.addAttribute("users", gettingSelectedUsers);
//		}
//		return "admin";
//	}

	@RequestMapping("dashboard")
	public String dashBoard() {
		
		return "DashBoard";
	}
	
	
	@PostMapping("/processform")
	@ResponseBody // This ensures the method returns a JSON response
	public List<UserDetailsModel> processFormAjax(@RequestParam(required = false) String username,
			@RequestParam(required = false) String usercontact, @RequestParam(required = false) String useremail,
			@RequestParam(required = false) String useraddress) {

		// If all parameters are null or empty, return all users
		if ((username == null || username.isEmpty()) && (usercontact == null || usercontact.isEmpty())
				&& (useremail == null || useremail.isEmpty()) && (useraddress == null || useraddress.isEmpty())) {

			// Return all users
			return userService.getAllUser(); // This should return all users
		}

		// If some parameters are provided, filter based on the criteria
		UserDetailsModel searchCriteria = new UserDetailsModel();
		searchCriteria.setUsername(username);
		searchCriteria.setUsercontact(usercontact);
		searchCriteria.setUseremail(useremail);
		searchCriteria.setUseraddress(useraddress);

		// Fetch the filtered users from the service
		return userService.getSelectedUsers(searchCriteria);
	}

	@RequestMapping("/updateSave")
	public String AddUpdateUser(@RequestParam("userID") int id, Model model) {

		System.out.println(id);
		UserDetailsModel selectedUser = userService.getSelectedUsersByID(id);
//		System.out.println(selectedUser);
		List<VehicleFormModel> getAllSelectedVehicles = userVehicleService.getVehiclesByUserID(id);
		getalltechies = techniciansService.getAllTechnicians();
		model.addAttribute("userinfo", selectedUser);

		model.addAttribute("vehicles", getAllSelectedVehicles);
		model.addAttribute("techies", getalltechies);

		/* return "userAddUpdate"; */
		return "admin2";
	}

	@RequestMapping("/goingtoupdate")
	public String updatedUser(UserDetailsModel userDetailsModel, Model model) {

		UserDetailsModel olddetails = userService.getSelectedUsersByID(userDetailsModel.getUserid());

		UserDetailsModel gettingUpdatedUser = userService.getUpdatedUser(userDetailsModel);

		if (olddetails.getUsername().equals(gettingUpdatedUser.getUsername())
				&& olddetails.getUsercontact().equals(gettingUpdatedUser.getUsercontact())
				&& olddetails.getUseremail().equals(gettingUpdatedUser.getUseremail())
				&& olddetails.getUseraddress().equals(gettingUpdatedUser.getUseraddress())) {
			model.addAttribute("userinfo", olddetails);
		} else {
			model.addAttribute("msg", "Updated !");
			model.addAttribute("userinfo", gettingUpdatedUser);
		}
		/*
		 * List<UserVehicleModel>
		 * getAllSelectedVehicles=userVehicleService.getVehiclesByUserID(
		 * userDetailsModel.getUserid());
		 */

		List<VehicleFormModel> getAllSelectedVehicles = new ArrayList<VehicleFormModel>();
		try {
			getAllSelectedVehicles = userVehicleService.getVehiclesByUserID(userDetailsModel.getUserid());
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		model.addAttribute("vehicles", getAllSelectedVehicles);
		/* return "userAddUpdate"; */
		List<TechniciansModel> getalltechies = techniciansService.getAllTechnicians();

		model.addAttribute("techies", getalltechies);
		model.addAttribute("userinfo", userDetailsModel);

		return "admin2";

	}

	@RequestMapping("/addnewcustomer")
	public String addNewCustomerPage(@ModelAttribute("CustDetails") UserDetailsModel userDetailsModel) {

		return "admin3";
		/* return "addcustomerpage"; */
	}

	@PostMapping("/addingnewcustomerdetails")
	public String addingNewCustomerDetails(UserDetailsModel userDetailsModel, Model model) {
		System.out.println(userDetailsModel.getUseremail() + userDetailsModel.getUsercontact());
		boolean res = userService.addNewCustomer(userDetailsModel);
		UserDetailsModel userid = userService.getSelectedUserByEmail(userDetailsModel.getUseremail());

		/*
		 * UserDetailsModel userid=new UserDetailsModel();
		 * 
		 * userid.setUsername("abbbc"); userid.setUsercontact("1122233");
		 * userid.setUseraddress("aadddd");
		 */

		System.out.println("got it while saving " + userid.getUserid());
		if (res == true) {
			model.addAttribute("Userid", userid.getUserid());
			model.addAttribute("msg", "data added");
			model.addAttribute("user", userid);
		} else {
			model.addAttribute("userinfo", userDetailsModel);
			model.addAttribute("msg", "data not added or may be data duplicated... ☹️");
		}

		return "admin3";
		/* return "addcustomerpage"; */
	}

	@RequestMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(@RequestParam("userID") int id) {

		try {
			boolean res = userService.deleteUsersByID(id);
			if (res) {
				System.out.println(res);
				return "success";
			}

			else {
				System.out.println(res);
				return "failed";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "failed";

		}
	}

}

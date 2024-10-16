package mvc.cgapp.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import mvc.cgapp.model.TechniciansModel;
import mvc.cgapp.model.UserDetailsModel;
import mvc.cgapp.model.VehicleFormModel;
import mvc.cgapp.service.CarHandleService;
import mvc.cgapp.service.TechniciansService;
import mvc.cgapp.service.UserService;
import mvc.cgapp.service.UserVehicleService;

@Controller
public class CarHandleController {

	@Autowired
	CarHandleService carHandleService;

	@Autowired
	UserVehicleService userVehicleService;

	@Autowired
	UserService userService;

	@Autowired
	TechniciansService techniciansService;

	List<TechniciansModel> getalltechies;
	
	@RequestMapping("/carpage")
	public String carPage(@ModelAttribute("carDetails") VehicleFormModel vehicleFormModel, Model model) {
		List<VehicleFormModel> gettingAllCars = userVehicleService.getAllCars();
		model.addAttribute("vehicles", gettingAllCars);
		getalltechies = techniciansService.getAllTechnicians();
		model.addAttribute("techies", getalltechies);
		return "carpage";
	}
	
	
	@PostMapping("/searchcar")
	@ResponseBody
	public List<VehicleFormModel> searchCar(
	        @RequestParam(required = false) String vehiclemodel,
	        @RequestParam(required = false) String vehiclenplate,
	        @RequestParam(required = false) String visitVentryDate,
	        @RequestParam(required = false) String tname) {

	    VehicleFormModel searchCriteria = new VehicleFormModel();
	    searchCriteria.setVehiclemodel(vehiclemodel);
	    searchCriteria.setVehiclenplate(vehiclenplate);
	    searchCriteria.setVisitVentryDate(visitVentryDate);
	    searchCriteria.setTname(tname);

	    System.out.println(searchCriteria);
	    List<VehicleFormModel> filteredVehicles = userVehicleService.getSelectedCars(searchCriteria);

	    System.out.println("output is:- "+filteredVehicles);
	    return filteredVehicles;
	}

	
	@PostMapping("/submitformforvehicle")
	public String processFormForCar(VehicleFormModel vehicleFormModel, @RequestParam("UserIDCustomer") String userid,
			Model model) {

		Long userID = null;
		try {
			userID = Long.parseLong(userid);
			if (userID == 0) {
				userID = null;
			}

		} catch (Exception ex) {}
		
		/* carHandleService.addVehicleDataProcess(vehicleFormModel, userID); */
		
		boolean res=carHandleService.addVehicleAndVisitVehicleDetails(vehicleFormModel, userID);
		
		if(res==true) {
			System.out.println("procedure call true");
		}else {System.out.println("not call procedure false");}
		int uid = userID.intValue();
		UserDetailsModel selectedUser = userService.getSelectedUsersByID(uid);
		List<VehicleFormModel> getAllSelectedVehicles = userVehicleService.getVehiclesByUserID(uid);
		List<TechniciansModel> getalltechies = techniciansService.getAllTechnicians();

		model.addAttribute("userinfo", selectedUser);
		model.addAttribute("vehicles", getAllSelectedVehicles);
		model.addAttribute("techies", getalltechies);
		return "admin2";
	}
	
	@RequestMapping("/addnewvehicle")
	public String addnewvehicle(@ModelAttribute("VehicleDetails")VehicleFormModel vehicleFormModel ,Model model) {
		List<TechniciansModel> getalltechies = techniciansService.getAllTechnicians();

		
		model.addAttribute("techies", getalltechies);
		
		return "carpage3";
	}
	
	@GetMapping("/checkVehicleNumber")
    @ResponseBody
    public String checkVehicleExists(@RequestParam("vehicleNumber") String vehicleNumber) {
        
		System.out.println("run time vehicle number is "+vehicleNumber);
		boolean exists = userVehicleService.checkIfVehicleExists(vehicleNumber);
		System.out.println(exists);
        // Return 'exists' if vehicle is found in the database, otherwise return 'not exists'
        if (exists) {
        	System.out.println("yes");
            return "exists";
        } else {
        	System.out.println("not");
            return "not exists";
        }
    }
	
	@PostMapping("/addingnewcardetails")
	public String addingNewCardetails(VehicleFormModel vehicleFormModel,Model model) {
		
		boolean res=carHandleService.addVehicleAndVisitVehicleDetails(vehicleFormModel, null);
		getalltechies = techniciansService.getAllTechnicians();
		
		if(res==true) {
			VehicleFormModel vehicle=userVehicleService.getSelectedCarByEntryDate(vehicleFormModel.getVisitVentryDate());
			model.addAttribute("vehicle",vehicle);
			model.addAttribute("msg","data added");
		}
		else {
			model.addAttribute("techies", getalltechies);
			model.addAttribute("msg","data not added");
		}
		return "carpage3";

	}

	
	@RequestMapping("/updateforcar")
	public String updateForCar(@RequestParam("VisitID") int vvid,Model model,@ModelAttribute("userinfo") UserDetailsModel userDetailsModel,HttpSession session) {
		session.setAttribute("VisitID", vvid);
		System.out.println("visit id for the updation "+vvid);
		VehicleFormModel vehicleFormModel=userVehicleService.getSelectedCarByID(vvid);
		System.out.println(vehicleFormModel.getVisitVrun());
		vehicleFormModel.setVehicleid(vvid);
		UserDetailsModel selectedUser=new UserDetailsModel();
		
		try{
			selectedUser=userService.getSelectedUsersByVisitID(vvid);
			model.addAttribute("userinfo",selectedUser);
			model.addAttribute("customer",selectedUser);
			model.addAttribute("carinfo",vehicleFormModel);
			return "carpage2";
		}
		catch(Exception ex) {
			return "redirect:/searchcar";
		}
		
	}

	@PostMapping("/goingtoupdatecar")
	public String goingtoUpdateCar(VehicleFormModel vehicleFormModel,UserDetailsModel userDetailsModel,Model model) {
		
		System.out.println("entery date for visit vehicle  "+vehicleFormModel.getVisitVentryDate());
		System.out.println(vehicleFormModel.getVisitVrun());
		
		VehicleFormModel oldVehicleDetail=userVehicleService.getSelectedCarByID(vehicleFormModel.getVehicleid());

		VehicleFormModel gettingUpdatedVehicle=carHandleService.getUpdatedVehicle(vehicleFormModel);
		
		if(oldVehicleDetail.getVehiclemodel().equals(gettingUpdatedVehicle.getVehiclemodel())&&
				oldVehicleDetail.getVehiclenplate().equals(gettingUpdatedVehicle.getVehiclenplate())&&
						oldVehicleDetail.getVisitVrun()==gettingUpdatedVehicle.getVisitVrun()&&
						oldVehicleDetail.getVisitVentryDate().equals(gettingUpdatedVehicle.getVisitVentryDate())) {
			
			System.out.println("data no updated");
			System.out.println(oldVehicleDetail.getVisitVrun());
			model.addAttribute("carinfo",oldVehicleDetail);
			
		}else {
			model.addAttribute("msg","updated");
			System.out.println(gettingUpdatedVehicle.getVisitVrun());
			model.addAttribute("carinfo",gettingUpdatedVehicle);
		}
		
		UserDetailsModel selectedUser=new UserDetailsModel();
		
		try{
			selectedUser=userService.getSelectedUsersByVisitID(vehicleFormModel.getVehicleid());
		}catch(Exception ex) {}
		model.addAttribute("userinfo",selectedUser);
		model.addAttribute("customer",selectedUser);
		
		return "carpage2";
		
	}
	
	@PostMapping("/addcustomermodal")
	public String goingtoUpdateCustomer(UserDetailsModel userDetailsModel,Model model) {

		boolean res=userService.addNewCustomer(userDetailsModel);
		
		if(res==true) {
			userVehicleService.linkVIDCustomer(userDetailsModel);
			VehicleFormModel vehicleFormModel=userVehicleService.getSelectedCarByID(userDetailsModel.getUserid());
			UserDetailsModel selectedUser=userService.getSelectedUserByEmail(userDetailsModel.getUseremail());
			model.addAttribute("carinfo",vehicleFormModel);
			model.addAttribute("customer",selectedUser);
		}		
		return "carpage2";
	}
	
	
	@PostMapping("/submitformforvehiclenduser")
	public String submitFormForVehicleNdUser(UserDetailsModel userDetailsModel,Model model) {
		System.out.println("user details +"+userDetailsModel.getUserid());
		UserDetailsModel res=userService.addFirstVehiclendUser(userDetailsModel);
		
		if(userDetailsModel.getUserid()!=res.getUserid()) {
			model.addAttribute("userinfo",res);
			model.addAttribute("customer",res);
		}
		VehicleFormModel oldVehicleDetail=userVehicleService.getSelectedCarByID(userDetailsModel.getUserid());
		model.addAttribute("carinfo",oldVehicleDetail);
		model.addAttribute(oldVehicleDetail);
		return "carpage2";
		
	}
	

	@RequestMapping("/deleteVehicle")
	@ResponseBody
	public String confirmDeleteForVehicle(@RequestParam("vvID") int vvid) {
		
		try {
			boolean res=carHandleService.deleteVehicleByVVID(vvid);
				if(res)
					return "success";
				else
					return "failed";
			
		}catch(Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}
}

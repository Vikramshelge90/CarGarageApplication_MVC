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

	
	@RequestMapping("/carpage")
	public String carPage(@ModelAttribute("carDetails") VehicleFormModel vehicleFormModel, Model model) {
		List<TechniciansModel> getalltechies = techniciansService.getAllTechnicians();
		model.addAttribute("techies", getalltechies);
		return "carpage";
	}
	
	
	
	@RequestMapping("/cardetails")
	public String carDetails(@ModelAttribute("carDetails") VehicleFormModel vehicleFormModel, Model model) {
		List<TechniciansModel> getalltechies = techniciansService.getAllTechnicians();
		model.addAttribute("techies", getalltechies);
		return "CarDetails";
	}

	@PostMapping("searchcar")
	public String searchCar(VehicleFormModel vehicleFormModel, Model model) {

		List<TechniciansModel> getalltechies = techniciansService.getAllTechnicians();

		model.addAttribute("techies", getalltechies);
		
		if (vehicleFormModel.getVehiclemodel().isEmpty() && vehicleFormModel.getVehiclenplate().isEmpty()
				&& vehicleFormModel.getVisitVentryDate().isEmpty() && vehicleFormModel.getTname() == null) {
			List<VehicleFormModel> gettingAllCars = userVehicleService.getAllCars();
			model.addAttribute("vehicles", gettingAllCars);
		} else {
			List<VehicleFormModel> gettingSelectedCars = userVehicleService.getSelectedCars(vehicleFormModel);
			
			model.addAttribute("carinfo", vehicleFormModel);
			model.addAttribute("vehicles", gettingSelectedCars);
		}

		return "carpage";
		/* return "CarDetails"; */
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
		//return "addvehiclepage";
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
		
		if(res==true) {
			VehicleFormModel vehicle=userVehicleService.getSelectedCarByEntryDate(vehicleFormModel.getVisitVentryDate());
			model.addAttribute("vehicle",vehicle);
			model.addAttribute("msg","data added");
		}
		else {
			model.addAttribute("msg","data not added");
		}
		return "carpage3";
		//return "addvehiclepage";
	}
	
	
	
	
	
	@RequestMapping("/updateforcar")
	public String updateForCar(@RequestParam("VisitID") int vvid,Model model,@ModelAttribute("userinfo") UserDetailsModel userDetailsModel) {
		
		System.out.println("visit id for the updation "+vvid);
		VehicleFormModel vehicleFormModel=userVehicleService.getSelectedCarByID(vvid);
		System.out.println(vehicleFormModel.getVisitVrun());
		vehicleFormModel.setVehicleid(vvid);
		UserDetailsModel selectedUser=new UserDetailsModel();
		
		try{
			selectedUser=userService.getSelectedUsersByVisitID(vvid);
			model.addAttribute("customer",selectedUser);
			model.addAttribute("carinfo",vehicleFormModel);
			return "carpage2";
		}
		catch(Exception ex) {
			return "redirect:/searchcar";
		}
		
		
		
		
		/* return "carupdatepage"; */
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
		model.addAttribute("customer",selectedUser);
		
		return "carpage2";
		/* return "carupdatepage"; */
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
		/* return "carupdatepage"; */
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

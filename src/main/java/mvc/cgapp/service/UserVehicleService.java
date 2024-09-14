package mvc.cgapp.service;

import java.util.List;

import mvc.cgapp.model.UserDetailsModel;
import mvc.cgapp.model.UserVehicleModel;
import mvc.cgapp.model.VehicleFormModel;

public interface UserVehicleService {

	List<VehicleFormModel> getVehiclesByUserID(int vid);
	
	List<VehicleFormModel> getAllCars();
	
	List<VehicleFormModel> getSelectedCars(VehicleFormModel vehicleFormModel);
	
	VehicleFormModel getSelectedCarByID(int vvid);
	
	VehicleFormModel getSelectedCarByEntryDate(String vnDate);
	
	void linkVIDCustomer(UserDetailsModel userDetailsModel);
	
	List<VehicleFormModel> getSelectedCarsByVNPlate(String vnplate);
	
	
	boolean checkIfVehicleExists(String vehicleNumber);
}

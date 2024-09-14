package mvc.cgapp.repository;

import java.util.List;

import mvc.cgapp.model.UserDetailsModel;
import mvc.cgapp.model.UserVehicleModel;
import mvc.cgapp.model.VehicleFormModel;

public interface UserVehicleRepo {

	List<VehicleFormModel> getVehiclesByUserID(int userid);
	
	List<VehicleFormModel> getAllCars();
	
	List<VehicleFormModel> getSelectedCarsByModel(String vmodel);
	List<VehicleFormModel> getSelectedCarsByModelNumberPlate(String vmodel,String vnplate);
	List<VehicleFormModel> getSelectedCarsByModelEntryDate(String vmodel,String vdate);
	List<VehicleFormModel> getSelectedCarsByModelTname(String vmodel,String tname);
	/*---------------------------------------------------------------------------------*/
	List<VehicleFormModel> getSelectedCarsByNumberPlate(String vnplate);
	List<VehicleFormModel> getSelectedCarsByNumberPlateEntryDate(String vnplate,String vdate);
	List<VehicleFormModel> getSelectedCarsByNumberPlateTname(String vnplate,String tname);
	/*---------------------------------------------------------------------------------*/
	List<VehicleFormModel> getSelectedCarsByEntryDate(String vdate);
	List<VehicleFormModel> getSelectedCarsByEntryDateTname(String vdate,String tname);
	
	List<VehicleFormModel> getSelectedCarsByTname(String tname);
	/*---------------------------------------------------------------------------------*/


	VehicleFormModel getSelectedCarByID(int vvid);
	
	VehicleFormModel getSelectedCarByEntryDate(String vnDate);
	
	int gettingVID(int vvid);
	
	boolean getLinkedUIDinVehicle(int vid,int uid);
	
//	void deleteUsersByID(int userid);
	
	boolean checkIfVehicleExists(String vehicleNumber);
}

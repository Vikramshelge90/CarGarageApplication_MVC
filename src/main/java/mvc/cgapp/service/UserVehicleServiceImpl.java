package mvc.cgapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.cgapp.model.UserDetailsModel;
import mvc.cgapp.model.UserVehicleModel;
import mvc.cgapp.model.VehicleFormModel;
import mvc.cgapp.repository.UserRepo;
import mvc.cgapp.repository.UserVehicleRepo;

@Service
public class UserVehicleServiceImpl implements UserVehicleService {

	@Autowired
	UserRepo userRepo;
	
	@Autowired
	UserVehicleRepo userVehicleRepo;

	@Override
	public List<VehicleFormModel> getVehiclesByUserID(int userid) {

		return userVehicleRepo.getVehiclesByUserID(userid);
	}

	@Override
	public List<VehicleFormModel> getAllCars() {

		return userVehicleRepo.getAllCars();
	}

	@Override
	public List<VehicleFormModel> getSelectedCars(VehicleFormModel vehicleFormModel) {

		if (!vehicleFormModel.getVehiclemodel().isEmpty()) {
			
			System.out.println("i am in midelll");
			if (!vehicleFormModel.getVehiclenplate().isEmpty()) {
				return userVehicleRepo.getSelectedCarsByModelNumberPlate(vehicleFormModel.getVehiclemodel(),
						vehicleFormModel.getVehiclenplate());
			}
			if (!vehicleFormModel.getVisitVentryDate().isEmpty()) {
				return userVehicleRepo.getSelectedCarsByModelEntryDate(vehicleFormModel.getVehiclemodel(),
						vehicleFormModel.getVisitVentryDate());
			}
			if(!(vehicleFormModel.getTname()==null))
			{
				return userVehicleRepo.getSelectedCarsByModelTname(vehicleFormModel.getVehiclemodel(), vehicleFormModel.getTname());
			}
			return userVehicleRepo.getSelectedCarsByModel(vehicleFormModel.getVehiclemodel());

		}
		
		
		if (!vehicleFormModel.getVehiclenplate().isEmpty()) {
			
			if(!vehicleFormModel.getVisitVentryDate().isEmpty()) {
				return userVehicleRepo.getSelectedCarsByNumberPlateEntryDate(vehicleFormModel.getVehiclenplate(), vehicleFormModel.getVisitVentryDate());
			}
			if(!(vehicleFormModel.getTname()==null)) {
				return userVehicleRepo.getSelectedCarsByNumberPlateTname(vehicleFormModel.getVehiclenplate(), vehicleFormModel.getTname());
			}
			return userVehicleRepo.getSelectedCarsByNumberPlate(vehicleFormModel.getVehiclenplate());
		}
		
		if (!vehicleFormModel.getVisitVentryDate().isEmpty()) {
			
			if(!(vehicleFormModel.getTname()==null)) {
				return userVehicleRepo.getSelectedCarsByEntryDateTname(vehicleFormModel.getVisitVentryDate(), vehicleFormModel.getTname());
			}
			return userVehicleRepo.getSelectedCarsByEntryDate(vehicleFormModel.getVisitVentryDate());
		}
		
		if(!(vehicleFormModel.getTname()==null)) {
			return userVehicleRepo.getSelectedCarsByTname(vehicleFormModel.getTname());
		}

		return userVehicleRepo.getAllCars();
	}

	@Override
	public VehicleFormModel getSelectedCarByID(int vvid) {

		return userVehicleRepo.getSelectedCarByID(vvid);
	}

	@Override
	public VehicleFormModel getSelectedCarByEntryDate(String vnDate) {
		
		return userVehicleRepo.getSelectedCarByEntryDate(vnDate);
	}

	
	@Override
	public void linkVIDCustomer(UserDetailsModel userDetailsModel) {
		int vid=userVehicleRepo.gettingVID(userDetailsModel.getUserid());
		int uid=userRepo.getUIDByEmail(userDetailsModel.getUseremail());
		boolean res=userVehicleRepo.getLinkedUIDinVehicle(vid,uid);
		if(res!=false) {
			System.out.println("vid and uid data linked.....");
		}
	}

	@Override
	public List<VehicleFormModel> getSelectedCarsByVNPlate(String vnplate) {
		
		return userVehicleRepo.getSelectedCarsByNumberPlate(vnplate);
	}

	@Override
	public boolean checkIfVehicleExists(String vehicleNumber) {
		
		return userVehicleRepo.checkIfVehicleExists(vehicleNumber);
	}

}

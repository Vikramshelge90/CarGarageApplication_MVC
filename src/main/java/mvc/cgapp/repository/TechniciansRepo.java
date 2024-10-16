package mvc.cgapp.repository;

import java.util.List;

import mvc.cgapp.model.TechniciansModel;

public interface TechniciansRepo {

	List<TechniciansModel> getAllTechnicians();
	List<TechniciansModel> getTechniciansByName(String tname);
	int addNewTechie(TechniciansModel techniciansModel);
	TechniciansModel getSelectedTechieByTid(int tid);
	
}
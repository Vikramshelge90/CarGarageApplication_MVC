package mvc.cgapp.service;

import java.util.List;

import mvc.cgapp.model.TechniciansModel;

public interface TechniciansService {

	List<TechniciansModel> getAllTechnicians();
	List<TechniciansModel> getSelectedTechies(String tname);
	int addNewTechie(TechniciansModel techniciansModel);
	TechniciansModel getSelectedTechieByTid(int tid);
	
}

package mvc.cgapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.cgapp.model.TechniciansModel;
import mvc.cgapp.repository.TechniciansRepo;

@Service
public class TechniciansServiceImpl implements TechniciansService{

	@Autowired
	TechniciansRepo techniciansRepo;
	
	@Override
	public List<TechniciansModel> getAllTechnicians() {
		
		return techniciansRepo.getAllTechnicians();
	}

	@Override
	public List<TechniciansModel> getSelectedTechies(String tname) {
		
		return techniciansRepo.getTechniciansByName(tname);
	}

	@Override
	public int addNewTechie(TechniciansModel techniciansModel) {
		// TODO Auto-generated method stub
		return techniciansRepo.addNewTechie(techniciansModel);
	}

	@Override
	public TechniciansModel getSelectedTechieByTid(int tid) {
		
		return techniciansRepo.getSelectedTechieByTid(tid);
	}




}

package mvc.cgapp.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import mvc.cgapp.model.TechniciansModel;

@Repository
public class TechniciansRepoImpl implements TechniciansRepo {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<TechniciansModel> getAllTechnicians() {

		String sql = "select *from techniciandetails_1";

		List<TechniciansModel> getAllTechie = jdbcTemplate.query(sql, new RowMapper<TechniciansModel>() {

			@Override
			public TechniciansModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				TechniciansModel getit = new TechniciansModel();
				getit.setTid(rs.getInt(1));
				getit.setTname(rs.getString(2));
				return getit;
			}
		});
		return getAllTechie;
	}

	@Override
	public List<TechniciansModel> getTechniciansByName(String tname) {
		String sql = "select *from techniciandetails_1 where tname like ?";
		String pattern = tname + "%";
		List<TechniciansModel> getSelectedTechie = null;
		try {

			getSelectedTechie = jdbcTemplate.query(sql, new RowMapper<TechniciansModel>() {

				@Override
				public TechniciansModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					TechniciansModel getit = new TechniciansModel();
					getit.setTid(rs.getInt(1));
					getit.setTname(rs.getString(2));
					return getit;
				}
			}, pattern);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return getSelectedTechie;
	}

	@Override
	public int addNewTechie(TechniciansModel techniciansModel) {
		
		String sql="insert into techniciandetails_1(tname) values(?)";
		String tname=techniciansModel.getTname();
		
		int res=0;
		int tid=0;
		try{
			res=jdbcTemplate.update(sql,tname);
		}catch(Exception ex) {
			ex.printStackTrace();
			res=0;
		}
		if(res!=0) {
			String sql1="select tid from techniciandetails_1 where tname=?";
			tid=jdbcTemplate.queryForObject(sql1,new RowMapper<Integer>() {

				@Override
				public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					return rs.getInt(1);
				}
			},tname);
		}
		else {
			tid=0;
		}
		return tid;
	}

	@Override
	public TechniciansModel getSelectedTechieByTid(int tid) {
		
		String sql="select *from techniciandetails_1 where tid=?";
		TechniciansModel getSelectedTechie = null;
		try {

			getSelectedTechie = jdbcTemplate.queryForObject(sql, new RowMapper<TechniciansModel>() {

				@Override
				public TechniciansModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					TechniciansModel getit = new TechniciansModel();
					getit.setTid(rs.getInt(1));
					getit.setTname(rs.getString(2));
					return getit;
				}
			},tid);

		} catch (Exception ex) {
			ex.printStackTrace();
			
		}
		return getSelectedTechie;
	}



	
}

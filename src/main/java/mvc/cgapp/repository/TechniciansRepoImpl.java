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

		String sql = "select *from TechnicianDetails_1";

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
		String sql = "select *from TechnicianDetails_1 where tname like ?";
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
}

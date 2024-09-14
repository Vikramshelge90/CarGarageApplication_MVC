package mvc.cgapp.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import mvc.cgapp.model.MainServicesModel;
import mvc.cgapp.model.SubServicesModel;

@Repository
public class MainServicesRepoImpl implements MainServicesRepo {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<SubServicesModel> getSubServicesByMsId(int msid) {
		String sql = "select *from subservicedetails_1 where msid=?";
		List<SubServicesModel> gettingSelectedSubServices = null;
		try {
			gettingSelectedSubServices = jdbcTemplate.query(sql, new RowMapper<SubServicesModel>() {

				@Override
				public SubServicesModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					SubServicesModel getit = new SubServicesModel();
					getit.setSsid(rs.getInt(1));
					getit.setSsname(rs.getString(2));
					getit.setSsprice(rs.getFloat(3));
					getit.setMsid(rs.getInt(4));
					return getit;
				}

			}, msid);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return gettingSelectedSubServices;
	}

	@Override
	public Map<MainServicesModel, List<SubServicesModel>> getAllServices() {

		String sql = "select msid,msname from mainservicedetails_1";
		List<MainServicesModel> mainServices = jdbcTemplate.query(sql, new RowMapper<MainServicesModel>() {

			@Override
			public MainServicesModel mapRow(ResultSet rs, int arg1) throws SQLException {
				MainServicesModel collect = new MainServicesModel();
				collect.setMsid(rs.getInt(1));
				collect.setMsname(rs.getString(2));
				return collect;
			}

		});

		Map<MainServicesModel, List<SubServicesModel>> servicesMap = new LinkedHashMap<>();
		for (MainServicesModel gotit : mainServices) {
			List<SubServicesModel> subServices = getSubServicesByMsId(gotit.getMsid());
			servicesMap.put(gotit, subServices);
		}
		return servicesMap;
	}

	@Override
	public boolean linkVVIDtoSSID(int vvid, List<Integer> subServiceIDs) {

		int res = 0;
		String sql = "insert into servicesjoin_1(vvid,ssid) values(?,?)";
		try {
			for (Integer ssid : subServiceIDs) {
				res = jdbcTemplate.update(sql, vvid, ssid);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return res > 0 ? true : false;
	}

}

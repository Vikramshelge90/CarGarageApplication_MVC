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

import mvc.cgapp.model.MainSparePartsModel;
import mvc.cgapp.model.SubSparePartsModel;

@Repository
public class SparePartsRepoImpl implements SparePartsRepo {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<SubSparePartsModel> getSubSparePartsByMSPID(int mspid) {

		String sql = "select spid,spname,spprice,mspid from sparepartsdetails_1 where mspid=?";
		List<SubSparePartsModel> gettingSelectedSubSpareParts = null;
		try {

			gettingSelectedSubSpareParts = jdbcTemplate.query(sql, new RowMapper<SubSparePartsModel>() {

				@Override
				public SubSparePartsModel mapRow(ResultSet rs, int arg1) throws SQLException {
					SubSparePartsModel getit = new SubSparePartsModel();
					getit.setSpid(rs.getInt(1));
					getit.setSpname(rs.getString(2));
					getit.setSpprice(rs.getFloat(3));
					getit.setMspid(rs.getInt(4));
					return getit;
				}

			}, mspid);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return gettingSelectedSubSpareParts;

	}

	@Override
	public Map<MainSparePartsModel, List<SubSparePartsModel>> getAllSpareParts() {

		String sql = "select mspid,mspname from mainsparepartsdetails_1";
		List<MainSparePartsModel> mainSpareParts = jdbcTemplate.query(sql, new RowMapper<MainSparePartsModel>() {

			@Override
			public MainSparePartsModel mapRow(ResultSet rs, int arg1) throws SQLException {
				MainSparePartsModel collect = new MainSparePartsModel();
				collect.setMspid(rs.getInt(1));
				collect.setMspname(rs.getString(2));
				return collect;
			}
		});
		Map<MainSparePartsModel, List<SubSparePartsModel>> mapSpareParts = new LinkedHashMap<MainSparePartsModel, List<SubSparePartsModel>>();
		for (MainSparePartsModel gotit : mainSpareParts) {
			List<SubSparePartsModel> subSpareParts = getSubSparePartsByMSPID(gotit.getMspid());
			mapSpareParts.put(gotit, subSpareParts);
		}

		return mapSpareParts;
	}

	@Override
	public boolean linkSPID_QTY_VVID(int vvid, Map<Integer, Integer> SpidQty) {
		int res = 0;
		String sql = "insert into sparepartsjoin_1(spid,spqty,vvid) values(?,?,?)";
		try {

			for (Map.Entry<Integer, Integer> idmap : SpidQty.entrySet()) {
				int spid = idmap.getKey();
				int qty = idmap.getValue();
				res = jdbcTemplate.update(sql, spid, qty, vvid);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return res > 0 ? true : false;
	}

}

package mvc.cgapp.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import mvc.cgapp.model.UserDetailsModel;
import mvc.cgapp.model.UserVehicleModel;
import mvc.cgapp.model.VehicleFormModel;
import mvc.cgapp.rowmapper.UserRowMapper;
import mvc.cgapp.rowmapper.UserVehicleRowMapper;

@Repository
public class UserVehicleRepoImpl implements UserVehicleRepo {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<VehicleFormModel> getVehiclesByUserID(int userid) {

		String sql = "select vs.vvid,v.vmodel,v.vnplate,vs.vvrun,vs.vventrydate, t.tname from visitvehicleDetails_1 vs inner join vehicleDetails_1 v on v.vid=vs.vid inner join techniciandetails_1 t on t.tid=vs.tid left join userdetails_1 u on u.uid=v.uid where u.uid=?";
		List<VehicleFormModel> allUserVehicles = jdbcTemplate.query(sql, new RowMapper<VehicleFormModel>() {

			@Override
			public VehicleFormModel mapRow(ResultSet rs, int arg1) throws SQLException {
				VehicleFormModel getit=new VehicleFormModel();
				getit.setVehicleid(rs.getInt(1));
				getit.setVehiclemodel(rs.getString(2));
				getit.setVehiclenplate(rs.getString(3));
				getit.setVisitVrun(rs.getLong(4));
				getit.setVisitVentryDate(rs.getString(5));
				getit.setTname(rs.getString(6));
				return getit;
			}
			
		}, userid);
		return allUserVehicles;
	}

	@Override
	public List<VehicleFormModel> getAllCars() {
		String sql = "select vs.vvid,v.vmodel,v.vnplate,vs.vvrun,vs.vventrydate, t.tname from visitvehicleDetails_1 vs inner join vehicleDetails_1 v on v.vid=vs.vid inner join techniciandetails_1 t on t.tid=vs.tid left join userdetails_1 u on u.uid=v.uid ";
		List<VehicleFormModel> allUserVehicles = jdbcTemplate.query(sql, new UserVehicleRowMapper());
		return allUserVehicles;
	}

	

//	@Override
//	public UserVehicleModel getSelectedCarsByID(int vid) {
//		String sql = "select *from vehicledetails_1 where vid=?";
//
//		UserVehicleModel selectedCar = jdbcTemplate.queryForObject(sql, new UserVehicleRowMapper(),vid);
//
//		return selectedCar;
//	}

	@Override
	public List<VehicleFormModel> getSelectedCarsByModel(String vmodel) {
		System.out.println("i am in model name car");
		String sql="SELECT vs.vvid, v.vmodel, v.vnplate, vs.vvrun, vs.vventrydate, t.tname FROM visitvehicleDetails_1 vs INNER JOIN vehicleDetails_1 v ON v.vid = vs.vid INNER JOIN techniciandetails_1 t ON t.tid = vs.tid left JOIN userdetails_1 u ON u.uid = v.uid WHERE v.vmodel LIKE ?";
		String pattern="%"+vmodel+"%";
		List<VehicleFormModel> getSelectedCars=jdbcTemplate.query(sql,new UserVehicleRowMapper() ,pattern);
		System.out.println(getSelectedCars);
		return getSelectedCars;
	}

	@Override
	public List<VehicleFormModel> getSelectedCarsByModelNumberPlate(String vmodel, String vnplate) {
		String sql="SELECT vs.vvid, v.vmodel, v.vnplate, vs.vvrun, vs.vventrydate, t.tname FROM visitvehicleDetails_1 vs INNER JOIN vehicleDetails_1 v ON v.vid = vs.vid INNER JOIN techniciandetails_1 t ON t.tid = vs.tid left JOIN userdetails_1 u ON u.uid = v.uid WHERE v.vmodel LIKE ? and v.vnplate like ?";
		String pattern="%"+vmodel+"%";
		String pattern1="%"+vnplate+"%";
		List<VehicleFormModel> getSelectedCars=jdbcTemplate.query(sql,new UserVehicleRowMapper() ,pattern,pattern1);
		return getSelectedCars;
	}

	@Override
	public List<VehicleFormModel> getSelectedCarsByModelEntryDate(String vmodel, String vdate) {
		String sql="SELECT vs.vvid, v.vmodel, v.vnplate, vs.vvrun, vs.vventrydate, t.tname FROM visitvehicleDetails_1 vs INNER JOIN vehicleDetails_1 v ON v.vid = vs.vid INNER JOIN techniciandetails_1 t ON t.tid = vs.tid left JOIN userdetails_1 u ON u.uid = v.uid WHERE vs.vventrydate= ?";
		String pattern="%"+vmodel+"%";
		List<VehicleFormModel> getSelectedCars=jdbcTemplate.query(sql,new UserVehicleRowMapper() ,pattern,vdate);
		return getSelectedCars;
	}

	@Override
	public List<VehicleFormModel> getSelectedCarsByModelTname(String vmodel, String tname) {
		String sql="SELECT vs.vvid, v.vmodel, v.vnplate, vs.vvrun, vs.vventrydate, t.tname FROM visitvehicleDetails_1 vs INNER JOIN vehicleDetails_1 v ON v.vid = vs.vid INNER JOIN techniciandetails_1 t ON t.tid = vs.tid left JOIN userdetails_1 u ON u.uid = v.uid WHERE v.vmodel LIKE ? and t.tname= ?";
		String pattern="%"+vmodel+"%";
//		String pattern1="%"+tname+"%";
		List<VehicleFormModel> getSelectedCars=jdbcTemplate.query(sql,new UserVehicleRowMapper() ,pattern,tname);
		return getSelectedCars;
	}

	@Override
	public List<VehicleFormModel> getSelectedCarsByNumberPlate(String vnplate) {
		String sql="SELECT vs.vvid, v.vmodel, v.vnplate, vs.vvrun, vs.vventrydate, t.tname FROM visitvehicleDetails_1 vs INNER JOIN vehicleDetails_1 v ON v.vid = vs.vid INNER JOIN techniciandetails_1 t ON t.tid = vs.tid left JOIN userdetails_1 u ON u.uid = v.uid WHERE v.vnplate LIKE ?";
		String pattern="%"+vnplate+"%";
		List<VehicleFormModel> getSelectedCars=jdbcTemplate.query(sql,new UserVehicleRowMapper() ,pattern);
		return getSelectedCars;
	}

	@Override
	public List<VehicleFormModel> getSelectedCarsByNumberPlateEntryDate(String vnplate, String vdate) {
		String sql="SELECT vs.vvid, v.vmodel, v.vnplate, vs.vvrun, vs.vventrydate, t.tname FROM visitvehicleDetails_1 vs INNER JOIN vehicleDetails_1 v ON v.vid = vs.vid INNER JOIN techniciandetails_1 t ON t.tid = vs.tid left JOIN userdetails_1 u ON u.uid = v.uid WHERE v.vnplate LIKE ? and vs.vventrydate=?";
		String pattern="%"+vnplate+"%";
		List<VehicleFormModel> getSelectedCars=jdbcTemplate.query(sql,new UserVehicleRowMapper() ,pattern,vdate);
		return getSelectedCars;
	}

	@Override
	public List<VehicleFormModel> getSelectedCarsByNumberPlateTname(String vnplate, String tname) {
		String sql="SELECT vs.vvid, v.vmodel, v.vnplate, vs.vvrun, vs.vventrydate, t.tname FROM visitvehicleDetails_1 vs INNER JOIN vehicleDetails_1 v ON v.vid = vs.vid INNER JOIN techniciandetails_1 t ON t.tid = vs.tid left JOIN userdetails_1 u ON u.uid = v.uid WHERE v.vnplate LIKE ? and t.tname=?";
		String pattern="%"+vnplate+"%";
//		String pattern1="%"+tname+"%";
		List<VehicleFormModel> getSelectedCars=jdbcTemplate.query(sql,new UserVehicleRowMapper() ,pattern,tname);
		return getSelectedCars;
	}

	@Override
	public List<VehicleFormModel> getSelectedCarsByEntryDate(String vdate) {
		String sql="SELECT vs.vvid, v.vmodel, v.vnplate, vs.vvrun, vs.vventrydate, t.tname FROM visitvehicleDetails_1 vs INNER JOIN vehicleDetails_1 v ON v.vid = vs.vid INNER JOIN techniciandetails_1 t ON t.tid = vs.tid left JOIN userdetails_1 u ON u.uid = v.uid WHERE vs.vventrydate= ?";

		List<VehicleFormModel> getSelectedCars=jdbcTemplate.query(sql,new UserVehicleRowMapper() ,vdate);
		return getSelectedCars;
	}

	@Override
	public List<VehicleFormModel> getSelectedCarsByEntryDateTname(String vdate, String tname) {
		String sql="SELECT vs.vvid, v.vmodel, v.vnplate, vs.vvrun, vs.vventrydate, t.tname FROM visitvehicleDetails_1 vs INNER JOIN vehicleDetails_1 v ON v.vid = vs.vid INNER JOIN techniciandetails_1 t ON t.tid = vs.tid left JOIN userdetails_1 u ON u.uid = v.uid WHERE vs.vventrydate=? and t.tname=?";
//		String pattern="%"+tname+"%";
		List<VehicleFormModel> getSelectedCars=jdbcTemplate.query(sql,new UserVehicleRowMapper() ,vdate,tname);
		return getSelectedCars;
	}

	@Override
	public List<VehicleFormModel> getSelectedCarsByTname(String tname) {
		System.out.println("techie nameis   :---"+ tname);
		
		
		String sql="SELECT vs.vvid, v.vmodel, v.vnplate, vs.vvrun, vs.vventrydate, t.tname FROM visitvehicleDetails_1 vs INNER JOIN vehicleDetails_1 v ON v.vid = vs.vid INNER JOIN techniciandetails_1 t ON t.tid = vs.tid left JOIN userdetails_1 u ON u.uid = v.uid WHERE t.tname=?";
//		String pattern="%"+tname+"%";
		List<VehicleFormModel> getSelectedCars=jdbcTemplate.query(sql,new UserVehicleRowMapper() ,tname);
		System.out.println(getSelectedCars);
		return getSelectedCars;
	}

	@Override
	public VehicleFormModel getSelectedCarByID(int vvid) {
		String sql="SELECT vs.vvid, v.vmodel, v.vnplate, vs.vvrun, vs.vventrydate, t.tname FROM visitvehicleDetails_1 vs INNER JOIN vehicleDetails_1 v ON v.vid = vs.vid INNER JOIN techniciandetails_1 t ON t.tid = vs.tid left JOIN userdetails_1 u ON u.uid = v.uid WHERE vs.vvid=?";
//		String pattern="%"+tname+"%";
		VehicleFormModel getSelectedCar=jdbcTemplate.queryForObject(sql,new UserVehicleRowMapper() ,vvid);
		System.out.println(getSelectedCar);
		return getSelectedCar;
	}

	@Override
	public VehicleFormModel getSelectedCarByEntryDate(String vnDate) {
		String sql="SELECT vs.vvid, v.vmodel, v.vnplate, vs.vvrun, vs.vventrydate, t.tname FROM visitvehicleDetails_1 vs INNER JOIN vehicleDetails_1 v ON v.vid = vs.vid INNER JOIN techniciandetails_1 t ON t.tid = vs.tid WHERE vs.vventrydate=? order by vs.vventrydate desc limit 1";
		VehicleFormModel getSelectedCar=jdbcTemplate.queryForObject(sql,new UserVehicleRowMapper() ,vnDate);
		System.out.println(getSelectedCar);
		return getSelectedCar;
	}

}

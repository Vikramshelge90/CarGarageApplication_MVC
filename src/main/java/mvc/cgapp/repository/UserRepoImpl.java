package mvc.cgapp.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import mvc.cgapp.model.UserDetailsModel;
import mvc.cgapp.rowmapper.UserRowMapper;

@Repository
public class UserRepoImpl implements UserRepo {

	@Autowired
	JdbcTemplate jdbcTemplate;

	// fetch all data
	@Override
	public List<UserDetailsModel> getAllUser() {
		String sql = "select *from userDetails_1";

		List<UserDetailsModel> allUsers = jdbcTemplate.query(sql, new UserRowMapper());
		return allUsers;
	}

	// fetch data by name
	@Override
	public List<UserDetailsModel> getSelectedUsersByName(String uname) {

		String sql = "select *from userDetails_1 where uname like ?";

		String likePattern = uname + "%";
		List<UserDetailsModel> allUsers = null;
		try {
			allUsers = jdbcTemplate.query(sql, new UserRowMapper(), likePattern);
		} catch (Exception ex) {
		}

		return allUsers;
	}

	// fetch data by name and contact
	@Override
	public List<UserDetailsModel> getSelectedUsersByNameContact(String uname, String contact) {
		String sql = "select *from userDetails_1 where uname like ? and ucontact like ?";
		String likePattern = "%" + uname + "%";
		String likePattern1 = "%" + contact + "%";
		List<UserDetailsModel> allUsers=null;
		try {
			allUsers = jdbcTemplate.query(sql, new UserRowMapper(), likePattern, likePattern1);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return allUsers;
	}

	// fetch data by name and email
	@Override
	public List<UserDetailsModel> getSelectedUsersByNameEmail(String uname, String email) {
		String sql = "select *from userDetails_1 where uname like ? and umail=?";
		String likePattern = "%" + uname + "%";
		List<UserDetailsModel> allUsers=null;
		try {
			allUsers = jdbcTemplate.query(sql, new UserRowMapper(), likePattern, email);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return allUsers;
	}

	// fetch data by name and address
	@Override
	public List<UserDetailsModel> getSelectedUsersByNameAddress(String uname, String address) {
		String sql = "select *from userDetails_1 where uname like ? and uaddress like ?";
		String likePattern = "%" + uname + "%";
		String likePattern1 = "%" + address + "%";
		List<UserDetailsModel> allUsers=null;
		try {
			allUsers = jdbcTemplate.query(sql, new UserRowMapper(), likePattern, likePattern1);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return allUsers;
	}

	// fetch data by contact
	@Override
	public List<UserDetailsModel> getSelectedUsersByContact(String contact) {
		String sql = "select *from userDetails_1 where ucontact like ?";
		String likePattern = "%" + contact + "%";
		List<UserDetailsModel> allUsers=null;
		try {
			allUsers = jdbcTemplate.query(sql, new UserRowMapper(), likePattern);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return allUsers;
	}

	// fetch data by contact and email
	@Override
	public List<UserDetailsModel> getSelectedUsersByContactEmail(String contact, String email) {
		String sql = "select *from userDetails_1 where ucontact like ? and umail=?";
		String likePattern = "%" + contact + "%";
		List<UserDetailsModel> allUsers=null;
		try {
			allUsers = jdbcTemplate.query(sql, new UserRowMapper(), likePattern, email);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return allUsers;
	}

	// fetch data by contact and address
	@Override
	public List<UserDetailsModel> getSelectedUsersByContactAddress(String contact, String address) {
		String sql = "select *from userDetails_1 where ucontact like ? and uaddress like ?";
		String likePattern = "%" + contact + "%";
		String likePattern1 = "%" + address + "%";
		List<UserDetailsModel> allUsers=null;
		try {
			allUsers = jdbcTemplate.query(sql, new UserRowMapper(), likePattern, likePattern1);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return allUsers;
	}

	// fetch data by email
	@Override
	public List<UserDetailsModel> getSelectedUsersByEmail(String email) {
		String sql = "select *from userDetails_1 where umail like ?";
		List<UserDetailsModel> allUsers=null;
		try {
			allUsers = jdbcTemplate.query(sql, new UserRowMapper(), email);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return allUsers;
	}

	// fetch data by email and address
	@Override
	public List<UserDetailsModel> getSelectedUsersByEmailAddress(String email, String address) {
		String sql = "select *from userDetails_1 where umail=? and uaddress like ?";
		String likePattern1 = "%" + address + "%";
		List<UserDetailsModel> allUsers=null;
		try {
			allUsers = jdbcTemplate.query(sql, new UserRowMapper(), email, likePattern1);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return allUsers;
	}

	// fetch data by address
	@Override
	public List<UserDetailsModel> getSelectedUsersByAddress(String address) {

		String sql = "select *from userDetails_1 where uaddress like ?";
		String likePattern = "%" + address + "%";
		List<UserDetailsModel> allUsers=null;
		try {
			allUsers = jdbcTemplate.query(sql, new UserRowMapper(), likePattern);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return allUsers;
	}

	@Override
	public UserDetailsModel getSelectedUsersByID(int userid) {
		String sql = "select *from userDetails_1 where uid=?";
		UserDetailsModel selectedUser=null;
		try {
			selectedUser= jdbcTemplate.queryForObject(sql, new UserRowMapper(), userid);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return selectedUser;
	}

	@Override
	public boolean deleteUsersByID(int userid) {

		String sql = "CALL delete_user_and_related(?)";
		int res = 0;
		try {
			res = jdbcTemplate.update(sql, userid);
			System.out.println("deletion res is:- " + res);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return res > 0 ? true : false;

	}

	@Override
	public UserDetailsModel getUpdatedUser(UserDetailsModel userDetailsModel) {
		String sql = "update userDetails_1 set uname=?,ucontact=?,umail=?,uaddress=? where uid=?";
		String name = userDetailsModel.getUsername();
		String contact = userDetailsModel.getUsercontact();
		String email = userDetailsModel.getUseremail();
		String address = userDetailsModel.getUseraddress();
		int id = userDetailsModel.getUserid();

		UserDetailsModel binddata = new UserDetailsModel();
		binddata.setUserid(id);
		binddata.setUsername(name);
		binddata.setUsercontact(contact);
		binddata.setUseremail(email);
		binddata.setUseraddress(address);
		int res=0;
		try {
			res = jdbcTemplate.update(sql, name, contact, email, address, id);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return res > 0 ? binddata : null;
	}

	@Override
	public boolean addNewCustomer(UserDetailsModel userDetailsModel) {

		String sql = "insert into userDetails_1(uname,ucontact,umail,uaddress) values(?,?,?,?)";

		String name = userDetailsModel.getUsername();
		String contact = userDetailsModel.getUsercontact();
		String email = userDetailsModel.getUseremail();
		String address = userDetailsModel.getUseraddress();
		int res=0;
		try {
			res = jdbcTemplate.update(sql, name, contact, email, address);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return res >= 0 ? true : false;
	}

	@Override
	public UserDetailsModel getSelectedUserByEmail(String email) {
		String sql = "select *from userDetails_1 where umail=?";
		UserDetailsModel user=null;
		try {
			user = jdbcTemplate.queryForObject(sql, new UserRowMapper(), email);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return user;
	}

	@Override
	public UserDetailsModel getSelectedUsersByVisitID(int vvid) {

		String sql = "select u.uid,u.uname,u.ucontact,u.umail,u.uaddress from userdetails_1 u inner join vehicleDetails_1 v on v.uid=u.uid inner join visitvehicleDetails_1 vs on vs.vid=v.vid where vs.vvid=?";
		UserDetailsModel getSelectedUser=null;
		try {
			getSelectedUser= jdbcTemplate.queryForObject(sql, new UserRowMapper(), vvid);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return getSelectedUser;
	}

	@Override
	public int getUIDByEmail(String email) {
		String sql = "select uid from userdetails_1 where umail=?";
		int uid=0;
		try {
			uid = jdbcTemplate.queryForObject(sql, new RowMapper<Integer>() {

				@Override
				public Integer mapRow(ResultSet rs, int arg1) throws SQLException {
					return rs.getInt(1);
				}
			}, email);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return uid;
	}

}

package com.sports.ServiceImpl;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sports.Dao.SportsDao;
import com.sports.service.SportsService;
import com.sports.Dao.SportsDao;
import com.sports.model.UserLogin;
import com.sports.service.SportsService;


@Service
@Transactional
public class SportsServiceImpl implements SportsService {

	@Autowired
	SportsDao sportsDao;
	
	@Override
	public boolean findUser(String email) {
		return sportsDao.findUser(email);
	}

	@Override
	public long createUser(UserLogin userLogin) {
		return sportsDao.createUser(userLogin);
	}

	@Override
	public UserLogin updateUser(UserLogin userLogin) {
		return sportsDao.updateUser(userLogin);
	}

	@Override
	public void deleteUserById(long id) {
		sportsDao.deleteUserById(id);
		
	}

	@Override
	public List<UserLogin> getAllusers() {
		return sportsDao.getAllusers();
	}

	@Override
	public UserLogin getUserByEmailId(String email) {
		return sportsDao.getUserByEmailId(email);
	}

	@Override
	public UserLogin getUserById(long id) {
		return sportsDao.getUserById(id);
	}

	@Override
	public void updaterole(UserLogin userLogin, String role, long id) {
		sportsDao.updaterole(userLogin, role, id);
		
	}

	
	@Override
	public void passReset(UserLogin userLogin, String pass, String email) {
		sportsDao.passReset(userLogin, pass, email);
		
	}

	@Override
	public void updateSubscription(UserLogin userLogin, String membership, long id) {
		sportsDao.updateSubscription(userLogin, membership, id);
	}

	@Override
	public List<UserLogin> lookupMembers(String name) {		
		return sportsDao.lookupMembers(name);
	}

	@Override
	public void updateUserById(UserLogin userLogin, long id) {
		sportsDao.updateUserById(userLogin, id);
		
	}

	/*@Override
	public List<UserLogin> getUserByName(String user) {
		return sportsDao.getUserByName(user);
	}*/

	@Override
	public List<UserLogin> lookupCity(String cityOrZip) {		
		return sportsDao.lookupCity(cityOrZip);
	}

	@Override
	public JSONObject jdbcDbConnect(String email) {
		return sportsDao.jdbcDbConnect(email);
	}

	@Override
	public void savebio(long id) {
		sportsDao.savebio(id);
		
	}

}

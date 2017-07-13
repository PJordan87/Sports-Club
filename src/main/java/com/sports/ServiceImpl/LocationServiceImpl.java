package com.sports.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sports.Dao.LocationDao;
import com.sports.model.Locations;
import com.sports.service.LocationService;

@Service
@Transactional
public class LocationServiceImpl implements LocationService {
	
	@Autowired
	LocationDao locationDao;

	@Override
	public long createAddress(Locations locations) {		
		return locationDao.createAddress(locations);
	}
	
	@Override
	public void deleteAddressById(long id) {
		locationDao.deleteAddressById(id);		
	}

	@Override
	public Locations updateAddress(Locations locations) {		
		return locationDao.updateAddress(locations);
	}

	

	@Override
	public List<Locations> getAllAddresses() {
		return locationDao.getAllAddresses();
	}

	@Override
	public List<Locations> lookupByName(String name) {
		return locationDao.lookupByName(name);
	}

	@Override
	public List<Locations> lookupAddressByCity(String cityOrZip) {		
		return locationDao.lookupAddressByCity(cityOrZip);
	}

	

}

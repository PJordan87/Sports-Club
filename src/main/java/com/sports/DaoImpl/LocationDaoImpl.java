package com.sports.DaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sports.Dao.LocationDao;
import com.sports.Repository.HibernateUtil;
import com.sports.model.Locations;

@Repository
public class LocationDaoImpl implements LocationDao{
	
	@Autowired
    private HibernateUtil hibernateUtil;


	@Override
	public long createAddress(Locations locations) {
		return (Long) hibernateUtil.create(locations);
	}

	@Override
	public Locations updateAddress(Locations locations) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAddressById(long id) {
		Locations locations = new Locations();
		locations.setId(id);
        hibernateUtil.delete(locations);
		
	}

	@Override
	public List<Locations> getAllAddresses() {
		return hibernateUtil.fetchAll(Locations.class);
	}

	@Override
	public List<Locations> lookupByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Locations> lookupAddressByCity(String cityOrZip) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}

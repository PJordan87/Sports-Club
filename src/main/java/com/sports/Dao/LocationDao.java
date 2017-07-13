package com.sports.Dao;

import java.util.List;

import com.sports.model.Locations;

public interface LocationDao {
	
	public long createAddress(Locations locations);
	public List<Locations> getAllAddresses();
	
	public Locations updateAddress(Locations locations);	
	public void deleteAddressById(long id);
    
    public List<Locations> lookupByName(String name);
    public List<Locations> lookupAddressByCity(String cityOrZip);
}

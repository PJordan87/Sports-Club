package com.sports.service;

import java.util.List;

import com.sports.model.Locations;

public interface LocationService {
	
	public long createAddress(Locations locations);
	public Locations updateAddress(Locations locations);	
	public void deleteAddressById(long id);
    public List<Locations> getAllAddresses();
    public List<Locations> lookupByName(String name);
    public List<Locations> lookupAddressByCity(String cityOrZip);

}

package com.sports.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sports.model.Addresses;
import com.sports.model.Locations;
import com.sports.model.UserLogin;
import com.sports.service.LocationService;
import com.sports.sportsUtils.States;

@Controller
public class LocationController {

	
	@Autowired
	 LocationService locationService;
	
	 @Autowired
	 DataSource dataSource;
	
	 @ModelAttribute("states")
	    public List<States> populateStates(){
	        return Arrays.asList(States.values());
	  }
   
	
	    /*@RequestMapping("deleteClub")
	    public String deleteClub(@RequestParam long id, ModelMap model){    	
	    			
	    	try { 	    		
	    		locationService.deleteAddressById(id);
		         model.addAttribute("success", "Address deleted successfully");
		         model.addAttribute("users", locationService.getAllAddresses());
			     }
				catch(RuntimeException e) {
					model.addAttribute("error", "Unexpected error occured");
					model.addAttribute("users", locationService.getAllAddresses());				    	
		             e.printStackTrace();				    
			  }	    		
	    	return "about";
	    }*/
	 
	 @RequestMapping("deleteClub")
	    public String deleteClub(@RequestParam long id, ModelMap model){    	
	    		  
		    	 locationService.deleteAddressById(id);
		         model.addAttribute("success", "Address deleted successfully");
		         model.addAttribute("users", locationService.getAllAddresses());
			     	
	    	return "about";
	    }
	 
	/*    @RequestMapping(value = "/testpage", method = RequestMethod.GET)
	    public String testpage(Model model) {
	         model.addAttribute("msg", "this is test page");
	         model.addAttribute("msg2", "I am now 2nd this is test page");
	         model.addAttribute("users", locationService.getAllAddresses());
	              
	        return "testpage";
	    }
	    
	    @RequestMapping(value = "/testpost", method = RequestMethod.POST)
	    public String test(@ModelAttribute("testpost") UserLogin user, ModelMap model){	    	
	    	 
	         model.addAttribute("users", locationService.getAllAddresses());
	         model.addAttribute("msg2", " Lookup succces");
	    	return "testpage";
	    }*/
	    
	    @RequestMapping(value = "/lookcity", method = RequestMethod.POST)
	    public String testlookup(@ModelAttribute("lookcity") long lookcity, ModelMap model){	    	
	    	 model.addAttribute("message", lookcity +" Lookup");
	         model.addAttribute("users", getJoinTables(lookcity));
	         
	    	return "services";
	    }
 
       @RequestMapping(value = "/addresses", method = RequestMethod.GET)
	    public String addreses(Model model) {
	              //model.addAttribute("locations", new Locations());
	              model.addAttribute("locations", new Addresses());
	              
	        return "addresses";
	    }
    
    @RequestMapping(value = "/addresses", method = RequestMethod.POST)
    public String addresses(@Valid @ModelAttribute("locations")
    Locations address, BindingResult result, Model model) {
 	   
 	   if (result.hasErrors()) {
			return "addresses";
		   }
 	   try {
 		   locationService.createAddress(address); 
 		   //model.addAttribute("users", locationService.getAllAddresses());			    	
 		   model.addAttribute("success", "Address added for "+ address.getCity()+ " City");		    		        
		       
		    }
			catch(EmptyResultDataAccessException e){
				e.printStackTrace();
					return "addresses";
			  }catch(RuntimeException e) {						
				    model.addAttribute("error", "Address Not Added for "+ address.getCity()+ " City");		    		        
 		       
					e.printStackTrace();
					return "addresses";
			  }
 	   
 	      
           return "about";
          }
    
    @RequestMapping("LookupcityByZip")
    public String searchCity(ModelMap model, @RequestParam("zip")long zip){    	
    	
    	try { 
    		if(getJoinTables(zip).isEmpty()){          
                model.addAttribute("error",  "There are no matches for this "+zip);
               }else	    				
    		   
    		    model.addAttribute("users", getJoinTables(zip));
    		    model.addAttribute("success", getJoinTables(zip).size()+ " Members found in " +zip);
    		   
		    }catch(EmptyResultDataAccessException e){
		    	 model.addAttribute("error",  "There are no matches for this "+zip); 
				 }
			 catch(RuntimeException e) {
				model.addAttribute("error", "Unexpected error occured");
			    e.printStackTrace();					    
		     }
    		
    	return "services";
    }
    
    
      
    	       public List<Map<String, Object>> getJoinTables(long id) {
    	              JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
    	              String join="SELECT users.*, locations.*  FROM users JOIN locations"
    	                                         +" ON locations.zip = users.zip"
    	                                         +" WHERE users.zip like '%"+ id +"%'";
    	           return jdbcTemplate.queryForList(join);
    	       }
    	      
    	    @SuppressWarnings("rawtypes")
   			public List<UserLogin> lookupCity(String cityOrZip) {
   				JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource); 
   				
   		       	final String sql  = "SELECT m.* FROM wellness.users m WHERE m.city like '%"+ cityOrZip +"%'"
   		       			+ " UNION "
   		       			+ "SELECT m.* FROM wellness.users m WHERE m.zip like '%"+ cityOrZip +"%'";
   		       	@SuppressWarnings("unchecked")
   		   		List<UserLogin> memberList = jdbcTemplate.query
   		   		(sql, new BeanPropertyRowMapper( UserLogin.class ));						
   		   		return memberList;
   		   		 
   			}  
    	    
    	  public void setForeignKeys(int id, String name) {
                JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
          jdbcTemplate.update("INSERT INTO locations set email = ?, id = ?", name, id);
      }
   
	    

}

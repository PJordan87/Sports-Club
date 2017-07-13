package com.sports.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.sql.DataSource;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sports.model.Sports;
import com.sports.service.SportsService;
import com.sports.sportsUtils.SportsUtils;
import com.sports.model.Locations;
import com.sports.model.UserLogin;
import com.sports.model.Sports;
import com.sports.service.LocationService;
import com.sports.service.SendMail;
import com.sports.service.SportsService;
import com.sports.sportsUtils.DataEntryValidator;
import com.sports.sportsUtils.SportsUtils;


@Controller
@SessionAttributes("emailAddress")
public class SportsController {
	
		    public SportsController() {
				System.out.println("in SportsController servelet");
			}
		    
		    DataEntryValidator dataEntryValidator = new DataEntryValidator();
		    
		    
		     @Autowired
			private SportsService sportsService; 
		     
		     @Autowired
			 DataSource dataSource;
		     
		     @Autowired
			 LocationService locationService;
		    
		    
		   
		    SendMail sendMail =new SendMail();
		    SportsUtils sportsUtils=new SportsUtils();
		    
		    @ModelAttribute("address")
		    public List<Locations> populateStates(Model model){
		    	return locationService.getAllAddresses();
		    }
		    
		    @RequestMapping(value = "/jdbcCrudes", method = RequestMethod.GET)
		    public String services(Model model) {
		         model.addAttribute("attribs", sportsService.jdbcDbConnect("p.jordan87@yahoo.com"));
		              
		        return "jdbcCrudes";
		    }
		    
		    @RequestMapping("email-lookup")
		    public String handlepost(@ModelAttribute("email-lookup") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    		    	 
			    	 try {
				    		 if(sportsService.findUser(userLogin.getEmailAddress())== true){
				    			UserLogin userdetail= sportsService.getUserByEmailId(userLogin.getEmailAddress());
					    		model.addAttribute("attribs", userdetail);
				    		 }else{
				    			 model.addAttribute("error", "User email does not exist"); 
				    		 }		    		 
					     }
						 catch(EmptyResultDataAccessException e){
							
							 }catch(RuntimeException e) {						
								model.addAttribute("error", "Unexpected error occured");
								e.printStackTrace();
							    
						  }
		    	 
		    	 
		         return "services";
		    	
		    }
		    
		    @RequestMapping("lookUpByLastnameOrFirstname")
		    public String lookUpname(@ModelAttribute("lookUpByLastnameOrFirstname") UserLogin userLogin, ModelMap model){    	
		    	//List<UserLogin> userdetail= wellnesService.lookupMembers(userLogin.getLname());	
  	    	  
		    	     try {
		    	    	    model.addAttribute("users", sportsService.lookupMembers(userLogin.getLname()));
					     }
						 catch(EmptyResultDataAccessException e){
							 model.addAttribute("error", "User "+userLogin.getLname()+" does noe exist in the Data base"); 
							 model.addAttribute("users", sportsService.lookupMembers(userLogin.getLname()));
							 }catch(RuntimeException e) {						
								model.addAttribute("error", "Unexpected error occured"+e);
								model.addAttribute("users", sportsService.lookupMembers(userLogin.getLname()));
								e.printStackTrace();
						  } 
		         return "services";
		    	
		    }
		    
		  /*  @RequestMapping("lookUpname")
		    public String lookUpname(@ModelAttribute("lookUpname") UserLogin userLogin, BindingResult bindingResult, ModelMap model){    	
		    	
		    	     try {
		    	    	     List<UserLogin> userdetail= wellnesService.lookupMembers(userLogin.getLname());	
		    	    	     model.addAttribute("users", userdetail);
				    		  		 
					     }
						 catch(EmptyResultDataAccessException e){
							 model.addAttribute("error", "User "+userLogin.getLname()+" does noe exist in the Data base"); 
				    		 
							 }catch(RuntimeException e) {						
								model.addAttribute("error", "Unexpected error occured"+e);
								e.printStackTrace();
							    
						  }
		    	 
		    	 
		         return "services";
		    	
		    }*/
		    
		    
		    @RequestMapping(value = "/logins", method = RequestMethod.GET)
		    public String login(Model model) {
		    	model.addAttribute("loginUser", new UserLogin());
		    	model.addAttribute("msg", "Login to explore the complete features!");
		        return "logins";
		    }
		    
		    
		    
		    @RequestMapping("bio")
		    public String bio(ModelMap model, @RequestParam("id") long id, @RequestParam("lgid") long lgid){    	
		    	
		    	try {
		    		UserLogin userdetail= sportsService.getUserById(id);
		    		UserLogin lguser= sportsService.getUserById(lgid);
		    		model.addAttribute("attribs", userdetail);
    		        model.addAttribute("user", lguser);
    		       // model.addAttribute("role", userdetail.getRoles());
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					    
				  }
		    		
		    	return "bio";
		    }
		    
		   
		    
		    @RequestMapping("LookupMembers")
		    public String searchMembers(ModelMap model, @RequestParam("LookupMembers") String names, @RequestParam(value="id",required=false) long id){    	
		    	
		    	try {
		    		long membersId=id;
		    		List<UserLogin> memberList = sportsService.lookupMembers(names);
		    		if(sportsService.lookupMembers(names).isEmpty()){          
		                model.addAttribute("error",  "There are no matches for this Look-up");
		               }
		    		else		    				
		    			model.addAttribute("success", memberList.size()+ " members found with name " +names);
		    		    model.addAttribute("users", sportsService.lookupMembers(names));		    		    
		    		    model.addAttribute("user", sportsService.getUserById(membersId));
		    		    
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					    
				  }
		    		
		    	return "members";
		    }
		    
		    @RequestMapping("lookupArtist")
		    public String lookartist(ModelMap model, @RequestParam("lookupArtist") String names){    	
		    	
		    	try {
		    		
		    		List<UserLogin> memberList = sportsService.lookupMembers(names);
		    		if(sportsService.lookupMembers(names).isEmpty()){          
		                model.addAttribute("error",  "There are no matches for this Look-up");
		               }
		    		else		    				
		    			model.addAttribute("success", memberList.size()+ " members found with name " +names);
		    		    model.addAttribute("users", memberList);		    		    
		    		     
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					    
				  }
		    		
		    	return "services";
		    }
		    
		    @RequestMapping("Lookupcity")
		    public String searchCity(ModelMap model, @RequestParam("Lookupcity") String cityorZip, @RequestParam(value="id",required=false) long id){    	
		    	
		    	
		    	try { 
		    		//List<UserLogin> memberList = sportsService.getUserByName(cityorZip);
		    		if(lookupCity(cityorZip).isEmpty()){          
		                model.addAttribute("error",  "There are no matches for this Look-up");
		               }
		    		   else{if(!(id==-1)){
		    			    model.addAttribute("users", lookupCity(cityorZip));
			    		    model.addAttribute("user", sportsService.getUserById(id));
			    		   /* if(Pattern.matches("^\\d+$", cityorZip)){
			    		    model.addAttribute("success", lookupCity(cityorZip).size()+ " Members found in Postal ZIP  " +cityorZip);
			    		    }else*/
			    		    	model.addAttribute("success", lookupCity(cityorZip).size()+ " Members found " +cityorZip);
			    		    return "members";
		    		   }else	    				
		    		   
		    		    model.addAttribute("users", lookupCity(cityorZip));
		    		    model.addAttribute("success", lookupCity(cityorZip).size()+ " Members found in " +cityorZip);
		    		   
		    		}
		    		    
				    } 
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					    
				  }
		    		
		    	return "services";
		    }
		    
		    
			@SuppressWarnings("rawtypes")
			public List<UserLogin> lookupCity(String cityOrZip) {
				JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource); 
				
		       	final String sql  = "SELECT m.* FROM wellness.users m WHERE m.city like '%"+ cityOrZip +"%'"
		       			+ " UNION "
		       			+ "SELECT m.* FROM wellness.users m WHERE m.zip like '%"+ cityOrZip +"%'";
		       	@SuppressWarnings("unchecked")
		   		List<UserLogin> memberList = jdbcTemplate.query(sql, new BeanPropertyRowMapper( UserLogin.class ));						
		   		return memberList;
		   		 
			}
   	       
	    
			@RequestMapping(value = {"index", "/"}, method = RequestMethod.GET)
		    public String index(Model model){ 
		    model.addAttribute("msg", "Hi welcome to Sports Club");
		    model.addAttribute("m", "Select Units");
	    	model.addAttribute("wt", "lb/kg");
	    	model.addAttribute("ht", "ft/cm");
		    
		    	return "index";				 
			} 
	       
	       @RequestMapping(value ="bmi",  method = RequestMethod.POST)
	       public String bmi(@RequestParam Map<String,String> requestParams,Model model) throws Exception{
	       	   String w=requestParams.get("w");
	       	   String h=requestParams.get("h");
	       	   String m=requestParams.get("system");    	   
	       	   Integer wt = Integer.valueOf(w);
	       	   Integer ht = Integer.valueOf(h);
	       	
	       		 if(m.equals("metric")){
	   		    //metric system SI units
	   		    	    double bmi = sportsUtils.getBmi(wt, ht, 10000);
	   	    		   // model.addAttribute("welcome", "You selected "+m+" Height "+ h+ " cm weight " +w+ " kg" );
	   			    	model.addAttribute("bmi", "Your BMI is " +bmi);
	   			    	model.addAttribute("status", "You are " +sportsUtils.getStatus(bmi));  
	   			    	model.addAttribute("m", m); 
	   			    	model.addAttribute("wt", "kg");
	   			    	model.addAttribute("ht", "cm");
	   			    	model.addAttribute("w", wt);
	   			    	model.addAttribute("h", ht);
	       	     }else {
	       		 // Imperial system US units
	   	    		    if(m.equals("imperial")){
	   	    		    double bmi = sportsUtils.getBmi(wt, ht, 703);
	   			    	//model.addAttribute("welcome", "You selected " +m+ " Hight "+ h+ " in weight " +w+ " lb");
	   			    	model.addAttribute("bmi", "Your BMI is " +bmi);
	   			    	model.addAttribute("status", " - " +sportsUtils.getStatus(bmi));
	   			    	model.addAttribute("m", m); 
	   			    	model.addAttribute("wt", "lb");
	   			    	model.addAttribute("ht", "ft");
	   			    	model.addAttribute("w", wt);
	   			    	model.addAttribute("h", ht);
	   	    		    }
	       		   		 
	       	 }
	       	return "index";
	       }
	       
	       
		    @RequestMapping(value = "/about", method = RequestMethod.GET)
		    public String about(Model model) {
		    	
		    	model.addAttribute("address", locationService.getAllAddresses());
		    	
		        return "about";
		    }
		    
		    
		    @RequestMapping(value = "/contact", method = RequestMethod.GET)
		    public String contact(Model model) {
		    	model.addAttribute("sendEmail", new UserLogin());
		    	model.addAttribute("message", "Welcome to Sports Club, please drop us an email"); 
		    	
		        return "contact";
		    }
		    
		    @RequestMapping("messageArtist")
		    public String contactartist(@ModelAttribute("messageArtist") Sports sports, Model model) { 
		    			  
			    			  String validemails = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
			    	          String message="Name: " +sports.getName()+ "\nEmail: " +sports.getSubject()+"\n\nMessage: " + sports.getMsg();
			    	          UserLogin userdetail= sportsService.getUserById(sports.getId());
			            	  
			    	          
			   	                try { 					            	   
					            	   if(!sports.getSubject().matches(validemails)) {
						    	        	  model.addAttribute("attribs", userdetail);
						                	  model.addAttribute("error", "Invalid email "+ sports.getSubject()+ " please use format johnsmith@scglobal.com ");		                  
						   	           }else{
					            	   sendMail.sendMails(sports.getEmailAddress() , sports.getSubject(), message.toString());					          
					                   model.addAttribute("success", "Thanks you "+sports.getName()+" an email has been sent to "+ userdetail.getFname());
					                   model.addAttribute("attribs", userdetail);
						   	           }
							        }catch(Exception e) {
							                 model.addAttribute("error", "Error sending email  " );
							                 model.addAttribute("attribs", userdetail);
							                 e.printStackTrace();
							        }
			   	                
						
						return "profile";
				    }
		    
		    
		    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
		    public String sendMail(@ModelAttribute("sendEmail") Sports sports, BindingResult bindingResult, Model model) { 
		    	          
		    	          String validemails = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"; 
		    	          model.addAttribute("em", sports.getEmailAddress());
		       	          model.addAttribute("sb", sports.getSubject());              
		                  String message="Subject: " +sports.getSubject()+"\nMessage: " + sports.getMsg();
		          
		                  if(!sports.getEmailAddress().matches(validemails)) {
		                	  model.addAttribute("emailerror", "Invalid email "+ sports.getEmailAddress()+ " use format johnsmith@scglobal.com ");		                  
		   	               }
		                  
		                  if(sports.getSubject().isEmpty()) {
		                	  model.addAttribute("sbjerror", "Please enter main Subject");		                    
		   		           }  
		                  
		                  if(sports.getMsg().length() <= 1 || sports.getMsg().length() > 3000) {
		                	  model.addAttribute("msgerror", "Must be between 10 and 300 characters");		                   
		   		           }
		                  
		                  else
				       
				             try {     
				            	   sendMail.sendMails(sports.getEmailAddress() , sports.getSubject(), message.toString());					          
				                   model.addAttribute("success", "Thanks Email has been sent to "+ sports.getEmailAddress());
				                   model.addAttribute("emailerror", "");  
				                   model.addAttribute("sbjerror", "");		                   
				       	           model.addAttribute("msgerror", "");
				       	           model.addAttribute("em", "");
				       	           model.addAttribute("sb", "");   
				       	           
						        }catch(Exception e) {
						                 model.addAttribute("sendmailfail", "Error sending email  " );
						                 e.printStackTrace();
						        }
						
						return "contact";
				    }
		    
		    @RequestMapping("writeBio")
		    public String changeMembershipType(@ModelAttribute("writeBio") UserLogin userLogin, ModelMap model) throws ParseException{    	
		    	try {
		    		writeBio(userLogin, userLogin.getBackground(), userLogin.getId());
		    		model.addAttribute("success", "Hi "+sportsService.getUserById(userLogin.getId()).getFname()+" Thanks, Biography saved");		    		
			    	model.addAttribute("attribs", sportsService.getUserById(userLogin.getId()));
			    	
		    	    }
					catch(RuntimeException e) {						
			    		model.addAttribute("attribs", sportsService.getUserById(userLogin.getId()));				    	
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	 return "profile";
		    }
		    
		    
		   
		    
		    @SuppressWarnings({ "unchecked", "rawtypes" })			
			public UserLogin getUserByNane(String name){
				String sql = "SELECT * FROM sports.users WHERE lname = ?";
		     JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		     UserLogin userLogin = (UserLogin) jdbcTemplate.queryForObject(
		     sql, new Object[] { name }, new BeanPropertyRowMapper(UserLogin.class));
		     return userLogin;
			}
		    
		    
			public void writeBio(UserLogin userLogin, String bio, long id) {

				String UpdateSql = "UPDATE users SET background=? where id=? ";    	
			     JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			  	  jdbcTemplate.update(
			  			UpdateSql,
			  			new Object[] { 			  					
			  					userLogin.getBackground(),
			  					userLogin.getId()
			  					
			  					}); 	  			
			     }
			
		   /* @RequestMapping("userEdits")
		    public String userEdits(@RequestParam long id, @ModelAttribute UserLogin userEdits, ModelMap model){    	
		    	
		    	try { 
		    		userEdits = wellnesService.getUserById(id);  
		    		 model.addAttribute("userEdit", userEdits);
		    		 model.addAttribute("attribs", wellnesService.getUserById(id));
		    		  
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }
		    		
		    	return "UserUpdateForm";
		    }
		    */
		   /* @RequestMapping("userEdit")
		    public String userEdit(@ModelAttribute("userEdit") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	
		    	dataEntryValidator.validate(userLogin, bindingResult);        
		        
		    	
		    	if (bindingResult.hasErrors()) {
		    		return "UserUpdateForm";
		        }else       
		    	      
		    	try {
				    		wellnesService.updateUserById(userLogin, userLogin.getId());
				    		model.addAttribute("message", "Update Success");
				    		model.addAttribute("attribs", wellnesService.getUserById(userLogin.getId()));
				    		model.addAttribute("user", wellnesService.getUserById(userLogin.getId()).getFname());
				    		model.addAttribute("role", wellnesService.getUserById(userLogin.getId()).getRoles());
				    		
				    		return "profile";
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	 return "UserUpdateForm";
		    }
		*/    
		   
}



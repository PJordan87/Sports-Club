package com.sports.sportsUtils;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.sports.model.UserLogin;

@Component
public class DataEntryValidator implements Validator {
   
    @Override
    public boolean supports(Class<?> aClass) {
        return UserLogin.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
    	UserLogin UserLogin = (UserLogin) o;
    	
    	/*ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fname", "NotEmpty");    	
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lname", "NotEmpty");    	
        */
    	
    	// String validemails = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";         
      
    	/*ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotEmpty");    	
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hours", "NotEmpty");    	
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "manager", "NotEmpty");        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "zip", "NotEmpty");        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "telephone", "NotEmpty");        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "city", "NotEmpty");        
        
	    */
	    /*if (UserLogin.getZip() < 0 ){
	        errors.rejectValue("zip", "Size.profile.Numeric");
	    }  */  

	    /*ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emailAddress", "NotEmpty");
        if (!UserLogin.getEmailAddress().matches(validemails)) {
            errors.rejectValue("emailAddress", "Size.signupMember.emailAddress");
        }*/
        
        
        
        

        
    }
    
    
    
    
    
    
    
}

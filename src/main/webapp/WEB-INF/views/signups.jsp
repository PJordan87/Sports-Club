
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.io.*,java.util.*" %>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("MM/dd/yyyy"); %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<script>

</script>
  </head>
  <body>
	<header style="background-color: #051834;">		
		<div class="navigation">
				<div class="container">				
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>						
					</div>
					
					<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li ><a href="index">Home</a></li>
								<li><a href="about">About Us</a></li>																
								<li><a href="contact">Contact Us</a></li>	
								<li class="active"><a href="signups">Sign up</a></li>
								<li><a href="services">Look-Ups</a></li>
								<li><a href="login">login</a></li>						
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		
	</header>
	
	<div class="container">
	
		<div class="col-md-10 col-md-offset-1">			
			    <h3 style="color: #FF0000">${error} </h3>				
				<h3 class="col-md-4 col-md-offset-4"> Registration </h3>
				${message}
		</div>
	
	
	 <form:form method="POST" modelAttribute="signupMember" class="col-md-12 col-md-offset-1">        
        
        <div class="row">
        <div class="col-md-3">
         <form:input type="hidden" path="roles" value="user"/>
        <spring:bind path="fname">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="fn" id='efn' >First Name*</label>
                <form:input type="text" path="fname" class="form-control" placeholder="First Name"
                            autofocus="true"></form:input>
                <form:errors class="text-danger" path="fname"></form:errors>
            </div>
        </spring:bind>
        </div>
        
        <div class="col-md-3">
        <spring:bind path="lname">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="lname" id='lname' >Last Name*</label>
                <form:input type="text" path="lname" class="form-control" placeholder="Last Name"
                            autofocus="true"></form:input>
                <form:errors class="text-danger" path="lname"></form:errors>
            </div>
        </spring:bind>
        </div>
        
        <div class="col-md-2">
        <spring:bind path="tel">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="tel" id='tel' > Telephone*</label>
                <form:input type="text" path="tel" class="form-control" placeholder="Telephone"
                            autofocus="true"></form:input>
                <form:errors class="text-danger" path="tel"></form:errors>
            </div>
        </spring:bind>
        </div>
        
        <div class="col-md-1">
        <spring:bind path="age">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="age" id='age' > Age*</label>
                <form:input type="text" path="age" class="form-control" placeholder="*Age"
                            autofocus="true"></form:input>
                <form:errors class="text-danger" path="age"></form:errors>
            </div>
        </spring:bind>
        </div>
        </div>
        
        <div class="row"> 
        <div class="col-md-3">
        <spring:bind path="address">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="address" id='address' > Address*</label>
                <form:input type="text" path="address" class="form-control" placeholder="Address"
                            autofocus="true"></form:input>
                <form:errors class="text-danger" path="address"></form:errors>
            </div>
        </spring:bind>
        </div>
        
        <div class="col-md-2">
        <spring:bind path="city">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="city" id='city' > City*</label>
                <form:input type="text" path="city" class="form-control" placeholder="*Enter City"
                            autofocus="true"></form:input>
                <form:errors class="text-danger" path="city"></form:errors>
            </div>
        </spring:bind>
        </div>
        
        <div class="col-md-2">
        <spring:bind path="state">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="state" id='state' > State*</label>
           		 <form:select path="state" name="state" class="form-control input-sm"> 
						     <option value="" >Select State</option>
							 <c:forEach items="${states}" var="state">							 
							 <option value="${state}">${state.id}</option>
							 </c:forEach>
						</form:select> 
						<form:errors class="text-danger" path="state"></form:errors>               
            </div>
        </spring:bind>
        </div>
        
        <div class="col-md-2">
        <spring:bind path="zip">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="zip" id='zip' > ZIP*</label>
                <form:input type="text" path="zip" class="form-control" placeholder="ZIP"
                            autofocus="true"></form:input>
                <form:errors class="text-danger" path="zip"></form:errors>
            </div>
        </spring:bind>
        </div>       
        </div> <!-- end row   -->
         
        <div class="row"> 
          
        <div class="col-md-3">
        <spring:bind path="emailAddress">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="emailAddress" id='emailAddress' > Email Address*</label>
                <form:input type="text" path="emailAddress" class="form-control" placeholder="*Email Address"
                            autofocus="true"></form:input>
                <form:errors class="text-danger" path="emailAddress"></form:errors>
            </div>
        </spring:bind>
        </div>
        
        
             
        <div class="col-md-3">
        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="password" id='password' > Password*</label>
                <form:input type="text" path="password" class="form-control" placeholder="*Password"
                            autofocus="true"></form:input>
                <form:errors class="text-danger" path="password"></form:errors>
            </div>
        </spring:bind>
        </div>
        
        <div class="col-md-3">
        <spring:bind path="passwordConfirm">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="passwordConfirm" id='passwordConfirm' >Confirm Password*</label>
                <form:input type="text" path="passwordConfirm" class="form-control" placeholder="*Confirm Password "
                            autofocus="true"></form:input>
                <form:errors  class="text-danger" path="passwordConfirm"></form:errors>
            </div>
        </spring:bind>
        </div>        
        </div> 
        
        <div class="row"> 
        <div class="col-md-6">       
        <spring:bind path="background">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="background" id='background' >Biography*</label>
                <form:textarea type="text" path="background" rows="4" class="form-control" placeholder="Write  a short Biography* " ></form:textarea>
                <form:errors class="text-danger" path="background"></form:errors>
            </div>
        </spring:bind>
         </div>
         
         <div class="col-md-3">
        <spring:bind path="subscription">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           		 <label for="subscription" id='subscription' > *subscription</label>
           		 <form:select path="subscription" name="subscription" class="form-control input-sm"> 
                              <option value="Anual Subscription" >Annual Subscription $250</option>  
                               <option value="Monthly Subscription" >Monthly Subscription $28</option>
                                 <option value="7 Day Free Trial">7 day Free trial</option> 
                                  <option value="" selected>Select Subscription</option>                                           
                                                                 
						</form:select> 
						<form:errors class="text-danger" path="subscription"></form:errors>               
            </div>
        </spring:bind>
        </div>
        <div class="col-md-4">
        <button class="btn btn-primary" type="submit">Submit</button>
		<a class="btn btn-primary" href="index">Cancel Sign-Up</a>
		</div>
                    
		</div> 
        			 
    </form:form>
    
</div>	
   
<footer  style="background-color: #f2dede; position: fixed; bottom:0;width:100%;" >						
				<div class="col-md-5 col-md-offset-5">
				<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li ><a href="index">Home</a></li>
								<li><a href="about">About Us</a></li>																
								<li><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li><a href="login">login</a></li>	
								<li><a href="services">Look-Ups</a></li>							
						        
							</ul>
							
						</div>
						</div>
		
	</footer>	

  </body>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
	
	$(document).ready(function() {
		$('#errorslname').css('color', '#FF0000');
		$('#errorsfname').css('color', '#FF0000');
		$('#errorspassword').css('color', '#FF0000');
		$('#errorsemailAddress').css('color', '#FF0000');
		$('#errorspasswordConfirm').css('color', '#FF0000');
    });
	 
	 
	
	</script>
</html>

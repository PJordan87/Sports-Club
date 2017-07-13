
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
					<div class="col-lg-8 col-lg-offset-2">
					<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li class="active"><a href="">Update </a></li>
								<li class="pull-right"><a href="index">Logout | ${attribs.fname}</a></li>					
							    <li>
							      <a class="btn btn-link" id="profilelink" onclick="document.forms['profile'].submit()">Profile</a>
					            </li>
							</ul>
						</div>
					</div>
					</div>						
				</div>
			</div>	
		
	</header>
	
	<div class="container">
		<div class="col-lg-8 col-lg-offset-3">
			<div>
			
			    <h1 style="color: #AB0B1A">Sports Club Data entry</h1>
				
				<h2 class="text-success" >${message} </h2>				
				<h2 class="text-danger" >${error} </h2>
							
			</div>
		</div>
  
		<div>
		     
		</div>
	</div>
	
	<%-- <form:form  id="editUser" method="post"  modelAttribute="userEdit" class="col-md-3 col-md-offset-4"> 
		<form:input type="text" path="id" class="form-control" ></form:input>       
        <spring:bind path="fname">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="fname" class="form-control" placeholder="First Name"
                            autofocus="true"></form:input>
                <form:errors id="errorsfname" path="fname"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="lname">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="lname" class="form-control" placeholder="last Name"
                            autofocus="true"></form:input>
                <form:errors id="errorslname" path="lname"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="emailAddress">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="emailAddress" class="form-control" placeholder="Email Address"
                            autofocus="true"></form:input>
                <form:errors id="errorsemailAddress" path="emailAddress"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                <form:errors id="errorspassword" path="password"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="passwordConfirm">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="passwordConfirm" class="form-control"
                            placeholder="Confirm your password"></form:input>
                <form:errors id="errorspasswordConfirm" path="passwordConfirm"></form:errors>
            </div>
        </spring:bind>
                    <button class="btn btn-primary btn-block" type="submit">Submit</button>
					 <a class="btn btn-primary btn-block" href="index">Cancel Sign-Up</a>
					 
    </form:form> --%>
	
	<form id="editUser" method="post"  action="userEdit" class="col-lg-8 col-lg-offset-2">
                    
      <div class="contact-form">
              <div class="container">
                     <div class="row">             
                     <div class="col-md-4" >
                           <div class="form-group">
                              <label for="ln" id='eln' >Last Name*</label>
                              <input type="hidden" class="form-control" name="id" value="${attribs.id}"/>
                              <input type="hidden" class="form-control" name="roles" value="${attribs.roles}"/>
							  <input type="hidden" class="form-control" name="emailAddress" id="emailAddress"  value="${attribs.emailAddress}"/>							    
                              <input type="hidden" class="form-control" name="password" id="password" value="${attribs.password}"/>
                              <input type=text id="lname" name="lname" class="form-control input-sm" placeholder="Last Name" value="${attribs.lname}"> 
                           </div>
                           
                     </div>
                     <div class="col-md-3">
                           <div class="form-group">
                              <label for="fn" id='efn' >First Name*</label>                              
                              <input type=text id="fname" name="fname" class="form-control input-sm" placeholder="First Name" value="${attribs.fname}"> 
                           </div>
                           
                     </div>
                     
                     <div class="col-md-1">
                           <div class="form-group">
                              <label for="ag" id='eag' >Age*</label>
                              <input type='number' id="age" name="age" class="form-control input-sm" placeholder="Age"  min="21" value="${attribs.age}"> 
                           </div>
                           
                     </div>
                     </div>
                     <div class="row"> 
                     <div class="col-md-4">
                           <div class="form-group">
                              <label for="ad" id='ead'>Address*</label>
                              <input type=text id="address" name="address" class="form-control input-sm" placeholder="Address" value="${attribs.address}"> 
                           </div>
                           
                     </div>
                     <div class="col-md-4">
                           <div class="form-group">
                              <label for="tl" id='etl'> City</label>
                              <input type=text id="city" name="city" class="form-control input-sm" placeholder="Job Title" value="${attribs.city}"> 
                           </div>
                           <div id='etl'>
                           
                           </div>
                     </div>
                     
                <%--  <div class="col-md-3">
                 	<div class="form-group">
					<label for="ad" id="ead">Select Club*</label>
						<select name="selectClub" class="form-control input"> 
						     <option value="" selected>Select Club</option>
							<c:forEach items="${address}" var="item">							 
							 <option value="${item.bname}">${item.bname}</option>
							 </c:forEach>
						</select>							
					</div>
				    </div> --%>
				    
                     
                     
                     </div>
                     <div class="row"> 
                     <div class="col-md-2">
					<label for="city">State </label>
					<div class="form-group">
						<select name="state" class="form-control input-sm"> 
						     <option >${attribs.state}</option>
							<c:forEach items="${states}" var="state">							 
							 <option value="${state}">${state.id}</option>
							 </c:forEach>
						</select>							
					</div>
				    </div>
				    
                     <div class="col-md-3">
                           <div class="form-group">
                              <label for="tl" id='etl'> Zip</label>
                              <input type=text id="zip" name="zip" class="form-control input-sm" placeholder="Job Title" value="${attribs.zip}"> 
                           </div>
                           <div id='etl'>
                           
                           </div>
                     </div>
    
                     
                     <div class="col-md-3">
                           <div class="form-group">
                              <label for="tel" id='etel'>Telephone*</label>
                              <input type=text id="tel" name="tel" class="form-control input-sm" placeholder="Telephone" value="${attribs.tel}"> 
                           </div>
                           
                     </div>
                      
                     </div>
                    <div class="row"> 
                    
                    <div class="col-md-3">
                 	<div class="form-group">
					<label for="ad" id="ead">Select Camp*</label>
						<select name="selectClub" class="form-control input"> 
						     <option value="" selected>Select Camp</option>
							<c:forEach items="${address}" var="item">							 
							 <option value="${item.bname}">${item.bname}</option>
							 </c:forEach>
						</select>							
					</div>
				    </div>
                    
                    <div class="col-md-3">
                           <div class="form-group">
                           <label for="subscription" id='subscription'>Subscription Type</label>
                              <select name="subscription" id="subscription" class="form-control input-sm">
                                                  <option value="Anual Subscription" >Annual Subscription $250</option>  
                                                  <option value="Monthly Subscription" >Monthly Subscription $28</option>
                                                  <option value="7 Day Free Trial" >7 Day Free Trial</option>                                                  
                                                  <option value="${attribs.subscription}" selected>${attribs.subscription}</option>                                           
                                                 </select>                       
                           </div>                           
                     </div>
                     
                     <div class="col-md-2">
                           <div class="form-group">
                              <label for="cd" id='eag' >Credit Card</label>                               
                              <input type='number' id="card" name="card" class="form-control input-sm" placeholder="Credit/debit card"   min="900000" value="${attribs.card}"> 
                           </div>                           
                     </div>
                     </div>
                     
                     <div class="row">
                     
                    <%--  <div class="col-md-3">
                           <div class="form-group">
                              <label for="website" id='website' >web site</label>                               
                              <input type='text' id="website" name="website" class="form-control input-sm" placeholder="enter website"  value="${attribs.website}"> 
                           </div>                           
                     </div>
                     
                     </div>--%>
                     
                     <div class="row">
                     <div class="col-md-8">
                     <div class="form-group">
                     <label for="background" id='background' >Biography</label>			
				     <textarea class="form-control" id="background" name="background"  rows="5" placeholder="${attribs.background}"></textarea>						
					 </div>
					 </div> 
                                <div class="col-md-8" >
		                           	    <div class="form-group">                       
					                   <button type="submit" name="submit" id="submit" class="btn btn-primary" >Submit</button>
					                   <a class="btn btn-primary" id="profilelink" onclick="document.forms['profile'].submit()">Cancel</a>
					                   </div>
                                  </div> 
                           </div>      
              		</div>
       		</div>         
           
       	 </form>
        
    <form id="profile" method="post" action="profile">
	<input type="hidden" name="id" value="${attribs.id}">
	</form>
   
  <footer  style="background-color: #DAF7A6; position: relative; bottom:0;width:100%;" >						
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
	
</html>

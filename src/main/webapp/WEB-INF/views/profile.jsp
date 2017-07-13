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
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <!-- <script>
    window.history.forward();
    </script> 
     -->
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
								<li class="active"><a href="#">Profile</a></li>	
								<li>
								<li role="presentation" class="pull-right">
									<form class="navbar-form navbar-right" role="search"  action="LookupMembers" method="post">
										    <div class="input-group add-on">
										      <input type="hidden" name="id" value="${attribs.id}"/>
										      <input type="text" class="form-control" placeholder="Find Members by Name" name="LookupMembers" id="LookupMembers" SIZE='20'>
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
										      </div>
										    </div>
									 </form>									
						        </li>
						        <c:if test="${fn:containsIgnoreCase(attribs.roles, 'super') || fn:containsIgnoreCase(attribs.roles, 'admin')}">
						        <li><a  id="adminlink" onclick="document.forms['admin'].submit()">Administrator </a></li>
						        </c:if>
						        <li class="pull-right"><a href="logout" id="logout">${attribs.lname} | Logout</a></li>
						        
																			  						
							</ul>
						</div>
					</div>
					</div>						
				</div>
			</div>				
	</header>
	
	<div class="container">
	
	
	<form id="resetpassword" method="post" action="admin">
	<input type="hidden" name="id" value="${attribs.id}">
	</form>
	
	<form id="admin" method="post" action="admin">
	<input type="hidden" name="id" value="${attribs.id}">
	</form>
	
	<form id="userEdits" method="post" action="userEdits">
	<input type="hidden" name="id" value="${attribs.id}">
	</form>
		
			<div>
				<h1 style="color: #9A0D1A">Welcome to the club 				
				</h1>
				
				<p style="color: #008000">${msg} </p>
				<h2 style="color: #008000">${message}</h2>
				<h2 style="color: #9A0D1A">${success} </h2>
				<h2 style="color: #FF0000">${error} </h2>
				<h2 style="color: #008000">${email} </h2>
				
			</div>
			

		
		<div class="row">
		
		<div class="col-md-6">
		<table class="table table-hover table-bordered" > 
						<tr style="background-color: #bce8f1;">
                    	 	<td>Date</td>
						     <td>
						    
						     <span class="fa fa-calendar" style="font-size:18px;color:blue; padding-top: 2px;">
					         Date <%= df.format(new java.util.Date()) %>
					         </span>
						     
						      </td>
                    	 </tr>
                    	 <tr>
                    	    <td>Name </td> <td><span style="color:red" class="glyphicon glyphicon-user"></span> <c:out value="${attribs.fname}"/> <c:out value="${attribs.lname}"/></td>
                    	 </tr>                    	 
                    	 <tr>
                    	    <td>Contact Info</td> <td><span style="color:red" class="fa fa-phone fa"></span> <c:out value="${attribs.tel}"/>  <span style="color:red" class="fa fa-envelope fa"></span> <c:out value="${attribs.emailAddress}"/></td>
                    	 </tr>
                    	 
                    	 <tr>
                    	    <td>Address </td> <td><span style="color:red" class="glyphicon glyphicon-home"></span> <c:out value="${attribs.address}"/> <c:out value="${attribs.city}"/> <c:out value="${attribs.state}"/> <c:out value="${attribs.zip}"/></td>
                    	 </tr>
                    	 <tr>
                    	  
                    	  <tr>
                    	    <td>
                    	    Membership Type 
                    	    </td> 
	                    	    <td>
	                    	           <form class="col-md-10" action="changeSubscriptionType" method="post">
										    <div class="input-group add-on">
										      <input type="hidden" name="id" value="${attribs.id}"/>
										      <select name="subscription" id="subscription" class="form-control input">

                                                  <option value="Anual Subscription" >Annual Subscription $250</option>  
                                                  <option value="Monthly Subscription" >Monthly Subscription $28</option>
                                                  <option value="7 Day Free Trial" >7 Day Free Trial</option>                                                                                                 
                                                  <option value="" selected>${attribs.subscription}</option>                                           
                                             </select> 
										      <div class="input-group-btn" class="col-md-2">
										         <button class="btn btn-success" type="submit"  title="assign roles">Change </button>
										      </div>
										    </div>
									 </form>
									 
								   <tr>
                    	    
	                    	    <%-- <td>
	                    	      <c:if test="${empty attribs.selectClub}">
	                    	           <form class="col-md-10" action="addAddress" method="post">
										    <div class="input-group add-on">
										      <input type="hidden" name="id" value="${attribs.id}"/>
										      <select name="selectClub" class="form-control input"> 
						     <option value="" selected>Select Club</option>
							<c:forEach items="${address}" var="item">							 
							 <option value="${item.bname}">${item.bname}</option>
							 </c:forEach>
						</select>
										      <div class="input-group-btn" class="col-md-2">
										         <button class="btn btn-success" type="submit"  title="assign roles">Change </button>
										      </div>
										    </div>
									 </form>		
							 <p class="text-danger"> please update your club</p>  	
							 </c:if>
							 <c:out value="${attribs.selectClub}"/>
                    	    </td>	 --%>	
							   		
                    	    
                    	 </tr> 
                    	 
                    	 <tr>
                    	    <td>
                    	 Sports Camp   
                    	    </td> 
	                    	    <td>
	                    	      <c:if test="${empty attribs.selectClub}">
	                    	           <form class="col-md-10" action="addAddress" method="post">
										    <div class="input-group add-on">
										      <input type="hidden" name="id" value="${attribs.id}"/>
										      <select name="selectCamp" class="form-control input"> 
						     <option value="" selected>Select Camp</option>
							<c:forEach items="${address}" var="item">							 
							 <option value="${item.bname}">${item.bname}</option>
							 </c:forEach>
						</select>
										      <div class="input-group-btn" class="col-md-2">
										         <button class="btn btn-success" type="submit"  title="assign roles">Change </button>
										      </div>
										    </div>
									 </form>		
							 <p class="text-danger"> please update your camp</p>  	
							 </c:if>
							 <c:out value="${attribs.selectClub}"/>
                    	    </td>		
							   		
                    	    
                    	 </tr> 
                    	 
    		  </table>
    		  </div>
    		  <div class="col-md-5"> 
    		  
    		  				<c:choose>
							    <c:when test="${not empty attribs.background}">
							       <h3 class="text-info">${attribs.fname}'s Biography 
							      <br>${attribs.background}</h3> 
							    </c:when>							       
							    <c:otherwise>
							    <div class="col-md-6-">	
							    <form class="col-md-10" action="writeBio" method="post">
							    <input type="hidden" name="id" value="${attribs.id}"/>
		                     	<label for="background" id='background' class="text-danger">Please Write a Biography</label>			
								<textarea class="form-control" id="background" name="background"  rows="5" placeholder="Write a short Bio"></textarea>						
								<br>
								<div class="form-group">
									<button type="submit" name="submit" class="btn btn-primary" >Submit </button>
									<button type="reset" class="btn btn-primary" role="button">Reset</button>
								</div>
								</form>
							    </div> 
							     </c:otherwise>
							</c:choose>
    		 				
    		    </div>
    		    
    		<%--    <div class="pull-right">
			<div class="text-info">
			<h3 >
			Club Locations			
			</h3>
			<c:forEach items="${address}" var="item">
			<div>
			<c:out value="${item.bname}"/><br>
			<c:out value="${item.city}"/><br>
			<c:out value="${item.state}"/><br>
			<c:out value="${item.zip}"/>
			<c:out value="${item.tel}"/>
			</div><br>			
			</c:forEach>
			</div>
			</div> --%>
    		 
    		  
		</div>
		
		       <a class="btn btn-danger" id="edata" onclick="document.forms['userEdits'].submit()">Update Profile </a>
		       <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#show">Reset Password</button>
		       <form class="col-md-3" action="Lookupcity" method="GET">
										    <div class="input-group add-on">										      
										      <input type="text" class="form-control" placeholder="Look-up by City or Zip" name="Lookupcity" id="Lookupcity" SIZE='14'>
										      <input type="hidden" name="id" value="${attribs.id}">
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search" title="Enter City or Zip"></i></button>
										      </div>
										    </div>
									 </form>
			 
	</div>
	<br>
	<div id="show" class="collapse">
	<%@include file="getpswd.jsp" %>
	</div>
  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	 
 <footer  style="background-color: #f2dede; position: fixed; bottom:0;width:100%;" >						
				<div class="col-lg-8 col-lg-offset-2">
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
	
</html>
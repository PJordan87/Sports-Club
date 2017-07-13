<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.io.*,java.util.*" %>
<%java.text.DateFormat dft = new java.text.SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a "); %>
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
	<header style="background-color: #DAF7A6;">		
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
								<li><a href="signups">Sign up</a></li>
								<li><a href="services">Look-Ups</a></li>
								<li class="active"><a href="#">test page</a></li>
								<li>
								<form class="navbar-form navbar-right" role="search"  action="lookcity" method="post">
										    <div class="input-group add-on">										     
										      <input type="text" class="form-control" placeholder="lookup city" name="lookcity" id="LookupMembers" SIZE='20'>
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
										      </div>
										    </div>
									 </form>	
								</li>				
							</ul>
						</div>
					</div>						
				</div>
			</div>				
	</header>
	
	<div class="container">
		 
			<div>
				<h1 style="color: #008000">Welcome to sports club</h1>
				<h3 style="color: #008000">${msg} <br> ${msg2}</h3>			</div>
		<div class="col-md-5">
		
		<form id="test" action="testpost" method="post" class="bs-example form-horizontal">
							<fieldset>
								<legend class="text-center">sports club test Page </legend><br>								
									<div class="form-group">
										<label for="userNameInput" class="col-lg-3 control-label">Enter your Details</label>
										<div class="col-lg-9">
										<input type="text" class="form-control" name="emailAddress" id="emailAddress" placeholder="what is my email" />
										<br>
										<input type="text" class="form-control" name="fname" id="fname" placeholder="what is your name" />
										
										
										</div>
									</div>
						   			<div class="col-lg-9 col-lg-offset-3">									
									<button class="btn btn-primary">Submit</button>
									</div>	
							</fieldset>
						</form>
		<div class="pull-right">
			<div class="text-info">
			<h3 >${success} <br>
			Club Locations			
			</h3>
			<c:forEach items="${address}" var="item">
			<div>
			<a title="Delete location" href="deleteClub?id=<c:out value='${item.id}'/>"><span class="glyphicon glyphicon-trash"></span> <c:out value="${item.bname}"/></a>                    	     
			<br>
			<c:out value="${item.city}"/><br>
			<c:out value="${item.state}"/><br>
			<c:out value="${item.zip}"/>
			<c:out value="${item.tel}"/>
			</div><br>			
			</c:forEach>
			</div>
			</div>
		</div>
	</div>
   
		
	<footer  style="background-color: #ff6600; position: fixed; bottom:0;width:100%;" >						
				<div class="col-md-5 col-md-offset-5">
				<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li><a href="index">Home</a></li>
								<li><a href="about">About Us</a></li>																
								<li><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li><a href="login">login</a></li>	
								<li class="active"><a href="#">tests page</a></li>							
						        
							</ul>
							
						</div>
						</div>
		
	</footer>
  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
</html>

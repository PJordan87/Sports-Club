<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<header  style="background-color: #051834;">		
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
								<li class="active"><a href="about">About Us</a></li>																
								<li><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li><a href="services">Look-Ups</a></li>
								<li><a href="login">login</a></li>		
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		
	</header>
	<div class="container">	
	<br>
	
	        
			<div class="row">		
			<div class="col-md-10">
			<h3 class="text-success" >About Sports Club</h3><br>				
			<p >
			The Sports Club introduces what began as an opportunity to bring immensely popular sports to the front door of millions. The Sports Club has evolved and expanded to a network of over 150 clubs catering to over half a million members across eight states and two countries (including Switzerland!). Dedicated to offering our members the best possible experience, we have proudly been at the forefront of fitness for over four decades while still maintaining that familiar, neighborhood feel. We provide not only the opportunity to get in the best shape of your life, but the opportunity to go Pro in the Sports Camp of your choosing. Each sports camp offers its own unique diverse training, with different activities included. Are you up to the challenge?
			</p>
			</div>
			
			
			<div class="pull-right">
			<div class="text-info">
			<h3 >${success} <br>
			Camp Locations			
			</h3>
			<c:forEach items="${address}" var="item">
			<div>
			
			
			<c:out value="${item.bname}"/>                   	     
			<br>
			<c:out value="${item.city}"/><br>
			<c:out value="${item.state}"/>
			<c:out value="${item.zip}"/><br>
			tel <c:out value="${item.tel}"/>
			</div><br>			
			</c:forEach>
			</div>
			</div>
			<%-- <table class="table table-hover table-bordered">
                    <thead style="background-color: #ff6600;">
                    <tr > 
                        <th>Id</th>
                        <th>Name </th>
                        <th>Address</th>
                        <th>City</th> 
                        <th>State</th> 
                        <th>ZIP</th> 
                        <th>Telephone</th>	
                                                                   	
                    </tr>
                    </thead>
                    <tbody  >
                     <c:forEach items="${users}" var="item">
                        <tr class="text-success">
                           <th><c:out value="${item.id}"/></th>
                           <th>
                           <a title="Delete location" href="deleteClub?id=<c:out value='${item.id}'/>"><span class="glyphicon glyphicon-trash"></span> <c:out value="${item.bname}"/></a>                    	     
							    
                           </th>
                            <th><c:out value="${item.address}"/></th>
                            
                            <th><c:out value="${item.city}"/></th>
							<th><c:out value="${item.state}"/> 							
							</th>
							
							<th><c:out value="${item.zip}"/></th>
                    	    <th><c:out value="${item.tel}"/></th> 					                	
                           </tr>
                           </c:forEach>
                    </tbody>
                </table> --%>
			
			
			
			
			</div>
						
			    <div class="panel-body">				
				    <a class="btn btn-primary" href="signups">Sign up » </a>
			        <a class="btn btn-primary" href="login">Login » </a>
		
				</div>
           </div>
		
<footer  style="background-color: #ff6600; position: relative; bottom:0;width:100%;" >						
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




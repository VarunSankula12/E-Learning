<%@page import="com.codebook.Connections.studentDao"%>
<%@page import="com.codebook.instructor.instructorDao"%>
<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="java.util.Base64"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.io.*,java.sql.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <style>
    body {
  background-color: #f4f4f4;
}

.card {
  margin-top: 20px;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<title>StudyLab - Free Bootstrap 4 Template by Colorlib</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="css/animate.css">
	
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">

	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="css/jquery.timepicker.css">

	
	<link rel="stylesheet" href="css/flaticon.css">
	<link rel="stylesheet" href="css/style.css">
        
</head>
<body>
  
  
    
    <script type="text/javascript">  
        function validateuser(){   
        
        var cardNumber=document.myform.cardNumber.value;
       
        var expiryDate=document.myform.expiryDate.value; 
        var cvv=document.myform.cvv.value; 
        var submit=document.myform.submit.value;

        if (cardNumber===""){
            Swal.fire("Card number cannot be blank");            
            return false;
        }
       if (!/^\d{16}$/.test(cardNumber)) {
            Swal.fire("Card number must be a 16-digit number not alphabets or special characters");
            return false;
            }

        if (expiryDate===''){
            Swal.fire("Expiry date should not be empty");          
            return false;
            }
            if (!/^(0[1-9]|1[0-2])\/\d{2}$/.test(expiryDate)) {
                Swal.fire("Card expiry date must be in the format MM/YY");
                return false;
                }
        if (cvv===''){
            Swal.fire("Cvv should not be empty");          
            return false;
            }
            if (!/^\d{3,4}$/.test(cvv)) {
            Swal.fire("CVV must be a 3 or 4-digit number");
             return false;
            }
            
    }  
    
    </script>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html"><span>Study</span>Lab</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto col-6">
					<li class="nav-item"><a href="Student-Dashboard.jsp" class="nav-link">Home</a></li>
                                        <li class="nav-item dropdown active">
                          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            COURSE
                          </a>
                          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="course.jsp">COURSES</a>
                            <a class="dropdown-item" href="mycourses.jsp">MY COURSES</a>
                          </div>
                        </li>
					<li class="nav-item"><a href="Student-Quiz.jsp" class="nav-link">Quiz</a></li>
					
					<li class="nav-item"><a href="Student-result.jsp" class="nav-link">Result</a></li>
					<li class="nav-item"><a href="Student-Feedback.jsp" class="nav-link">Feedback</a></li>
					<li class="nav-item"><a href="Student-Profile.jsp" class="nav-link">Profile</a></li>
					<li class="nav-item"><a href="../index.html" class="nav-link">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	<section class="hero-wrap hero-wrap-1" style="background-image: url('images/bg_2.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<div class="row justify-content-center pb-4">
					<div class="col-md-12 heading-section text-center ftco-animate">
						<span class="subheading"></span>
					  <h2 class="mb-4"></h2>
				  </div>
			</div>
		</div>
	</div>
</section>
	<div class="text-white">
		<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="fa fa-chevron-right"></i></a></span>
			<span class="mr-2"><a href="Student-login.jsp">Student <i class="fa fa-chevron-right"></i></a></span>
			<span class="mr-2"><a href="Student-Dashboard.jsp">Student Dashboard <i class="fa fa-chevron-right"></i></a></span>
			<span class="mr-2"><a href="course.jsp">Course <i></i></a></span></p>
	</div>
		
     
 <%
                    String coursename=request.getParameter("coursename");
                    String insname=request.getParameter("instructor_name");
                    
                %>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <div class="card">
          <div class="card-header">
            <h3 class="text-center">Make a Payment</h3>
          </div>
          <div class="card-body">
            <form method="POST" id="myform" onsubmit="return validateuser()" action="subscribeAction.jsp?coursename=<%= coursename%>&instructor_name=<%= insname%>"" name="myform">
              <div class="mb-3">
                <label for="cardNumber" class="form-label">Card Number</label>
                <input type="text" class="form-control" id="cardNumber" placeholder="Enter card number">
              </div>
              <div class="mb-3">
                <label for="expiryDate" class="form-label">Expiry Date</label>
                <input type="text" class="form-control" id="expiryDate" placeholder="MM/YYYY">
              </div>
              <div class="mb-3">
                <label for="cvv" class="form-label">CVV</label>
                <input type="password" class="form-control" id="cvv" placeholder="Enter CVV">
              </div>
               
              <div class="mb-3">
		<input type="submit" value="Buy" class="btn btn-dark">
                
	     </div>
            
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

              
              
          <div class="row justify-content-center pb-4">
            <div class="col-md-12 heading-section text-center ftco-animate">
                <span class="subheading"></span>
              <h2 class="mb-4"></h2>
          </div>
    </div>

	
	<footer class="ftco-footer ftco-no-pt">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md pt-5">
					<div class="ftco-footer-widget pt-md-5 mb-4">
						<h2 class="ftco-heading-2">About</h2>
						<p>A E-Learning platform where anyone can login and access the courses they wish for and from anywhere they can access and make their dreams come true...</p>
						<ul class="ftco-footer-social list-unstyled float-md-left float-lft">
							<li class="ftco-animate"><a href="#"><span class="fa fa-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span class="fa fa-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span class="fa fa-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md pt-5">
					<div class="ftco-footer-widget pt-md-5 mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Help Desk</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Customer Care</a></li>
							<li><a href="#" class="py-2 d-block">Legal Help</a></li>
							<li><a href="#" class="py-2 d-block">Services</a></li>
							<li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
							<li><a href="#" class="py-2 d-block">Refund Policy</a></li>
							<li><a href="#" class="py-2 d-block">Call Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md pt-5">
					<div class="ftco-footer-widget pt-md-5 mb-4">
						<h2 class="ftco-heading-2">Recent Courses</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">AWS</a></li>
							<li><a href="#" class="py-2 d-block">MySql-Database</a></li>
							<li><a href="#" class="py-2 d-block">Web Development</a></li>
							<li><a href="#" class="py-2 d-block">JAVA Programming</a></li>
							<li><a href="#" class="py-2 d-block">Android Development</a></li>
							<li><a href="#" class="py-2 d-block">Power-BI</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md pt-5">
					<div class="ftco-footer-widget pt-md-5 mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon fa fa-map-marker"></span><span class="text">#2nd Floor, Siris Rd, Near L.B Nagar Metro Station Pillar No, A1662, Snehapuri Colony, Hyderabad, Telangana 500074</span></li>
								<li><a href="#"><span class="icon fa fa-phone"></span><span class="text">85558 87986</span></a></li>
								<li><a href="#"><span class="icon fa fa-paper-plane"></span><span class="text">codebook@gmail.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved by CodeBook.
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
					</div>
				</div>
			</div>
		</footer>
		
		

		<!-- loader -->
		<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


		<script src="js/jquery.min.js"></script>
		<script src="js/jquery-migrate-3.0.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.easing.1.3.js"></script>
		<script src="js/jquery.waypoints.min.js"></script>
		<script src="js/jquery.stellar.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/jquery.magnific-popup.min.js"></script>
		<script src="js/jquery.animateNumber.min.js"></script>
		<script src="js/bootstrap-datepicker.js"></script>
		<script src="js/scrollax.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
		<script src="js/google-map.js"></script>
		<script src="js/main.js"></script>
		
	</body>
	</html>

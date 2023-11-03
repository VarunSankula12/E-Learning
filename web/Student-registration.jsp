<!DOCTYPE html>
<html lang="en">
<head>
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
        <script type="text/javascript">  
            
        function validateuser(){  
            
        var name=document.myform.name.value;
        var mobile=document.myform.mobile.value;
        var email=document.myform.email.value;
        var radio=document.myform.radio.value;
        var dob=document.myform.dob.value;
        var password=document.myform.password.value;
        var cpassword=document.myform.cpassword.value;  
        var file=document.myform.file.value;
        
        var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id
        var letter = /[a-z]/;
        var upper = /[A-Z]/;
        var number = /[0-9]/;

        if (name===""){ 
            Swal.fire('Name Cannot be empty');
                     
          return false;  
        }
        if(mobile===""){
            Swal.fire("Provide Mobile number");
            return false;
        }
        if(mobile.length!==10){
            Swal.fire("Missing length of Mobile number");
            return false;
        }
         if(isNaN(mobile)){
            Swal.fire("Invalid Mobile number");
            return false;
        }
        if (email===""){
            Swal.fire("E-mail cannot be empty");           
            return false;
        }
        if(!email.match(emailpattern)){
            Swal.fire("Invalid Email format");             
            return false;
        }
       
        if (radio===""){
            Swal.fire("gender cannot be blank");            
            return false;
        }
        if (dob===""){
           Swal.fire("Date Of birth cannot be blank");            
            return false;
        }
        
        if (password===''){
           Swal.fire("password should not be empty");          
            return false;
            }
        
        if (!letter.test(password)) {
            Swal.fire("Please make sure password includes a lowercase letter.");
                return false;
            }
        if (!number.test(password)) {
            Swal.fire("Please make sure Password Includes a Digit");
                return false;
            }
        if (!upper.test(password)) {
            Swal.fire("Please make sure password includes an uppercase letter.");
                return false;
            } 
             if (cpassword===''){
           Swal.fire(" confirm password should not be empty");          
            return false;
            }
        if(cpassword!==password){
            Swal.fire("password and confirm password must match");            
            return false;
        } 
         if (file===''){
           Swal.fire("please upload the file it should not be empty");          
            return false;
            }
        
        
    }  
    </script>
         
</head>
<body>
    <script>
        var successMessage = '${sessionScope.success}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("success"); %>
        }
          
    </script>
    <script>
        var successMessage = '${sessionScope.warning}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'warning',
                title: 'Failed',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("warning"); %>
        }
          
    </script>
    <script>
        var successMessage = '${sessionScope.failed}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'error',
                title: 'Failed!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("failed"); %>
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
        
					<li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="student/about.jsp" class="nav-link">About</a></li>
					<li class="nav-item"><a href="Admin-login.jsp" class="nav-link">Admin</a></li>
					<li class="nav-item active"><a href="Student-login.jsp" class="nav-link">Student</a></li>
					<li class="nav-item"><a href="Instructor-login.jsp" class="nav-link">Instructor</a></li>
					<li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li>
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
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="fa fa-chevron-right"></i></a></span><span class="mr-2"><a href="Student-login.jsp">Student <i class="fa fa-chevron-right"></i></a></span><span class="mr-2"><a href="Student-registration.jsp">Student registration<i></i></a></span></p>
		</div>
		<div class="row justify-content-center pb-4">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<span class="subheading"></span>
			  <h2 class="mb-4"></h2>
		  </div></div>

	
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrapper">
						<div class="row no-gutters">
							<div class="col-lg-8 col-md-7 order-md-last d-flex align-items-stretch">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4">Student Registration Page</h3>
                                                                        <form method="POST" id="myform" name="myform" onsubmit="return validateuser()" action="Student_RegAction.jsp" class="contactForm" enctype="multipart/form-data">
										<div class="row">
                                            <div class="col-md-12">
												<div class="form-group">
													<label class="label" for="name">Full Name</label>
													<input type="text" class="form-control" name="name" id="name" placeholder="name">
												</div>
											</div>
                                            <div class="col-md-12">
												<div class="form-group">
													<label class="label" for="name">Mobile Number</label>
													<input type="phone" class="form-control" name="mobile" id="mobile" placeholder="98480*****">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="email">Email Address</label>
													<input type="email" class="form-control" name="email" id="email" placeholder="Email">
												</div>
											</div>
                                                                                    <div class="col-md-12">
												<div class="form-group">
                                                                                                    <label class="label" for="radio">Gender</label> <br>
                                                                                                        <div class="form-check form-check-inline">
                                                                                                        <input class="form-check-input" type="radio" name="radio" id="radio" value="Male">
                                                                                                        <label class="form-check-label" for="inlineRadio1">Male</label>
                                                                                                          </div>

                                                                                                           <div class="form-check form-check-inline">
                                                                                                             <input class="form-check-input" type="radio" name="radio" id="radio" value="Female" />
                                                                                                             <label class="form-check-label" for="inlineRadio2">Female</label>
                                                                                                            </div>
                                                                                                        <div class="form-check form-check-inline">
                                                                                                             <input class="form-check-input" type="radio" name="radio" id="radio" value="Others" />
                                                                                                             <label class="form-check-label" for="inlineRadio2">Others</label>
                                                                                                            </div>
                                                                                                        
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="email">DOB</label>
													<input type="date" class="form-control" name="dob" id="dob" placeholder="Date Of Birth">
												</div>
											</div>
											
                                            
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="password">Password</label>
													<input type="password" class="form-control" name="password" id="password" placeholder="password">
												</div>
											</div>
                                            <div class="col-md-12">
												<div class="form-group">
													<label class="label" for="password">Confirm Password</label>
													<input type="password" class="form-control" name="cpassword" id="cpassword" placeholder="password">
												</div>
											</div>
                                            <div class="col-md-12">
												<div class="form-group">
                                                    <label class="label" for="file">Profile picture</label>
													<input type="file" class="form-control" name="file" id="file">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<input type="submit" value="Register" class="btn btn-primary">
													<div class="submitting"></div>
                                                    <label>To redirect to login page --> click <a href="Student-login.jsp">|here|</a></label>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="col-lg-4 col-md-5 d-flex align-items-stretch">
								<div class="info-wrap bg-primary w-100 p-md-5 p-4">
									<h3>Aspiring To Study</h3>
									<p class="mb-4">Please Register and Login to Select your intrested courses.</p>
									<div class="dbox w-100 d-flex align-items-start">
										<div class="icon d-flex align-items-center justify-content-center">
											<span class="fa fa-hand-o-right"></span>
										</div>
										<div class="text pl-3">
											<p><span>Web Development</span></p>
										</div>
									</div>
									<div class="dbox w-100 d-flex align-items-center">
										<div class="icon d-flex align-items-center justify-content-center">
											<span class="fa fa-hand-o-right"></span>
										</div>
										<div class="text pl-3">
											<p><span>Back-End Technologies</span></p>
										</div>
									</div>
									<div class="dbox w-100 d-flex align-items-center">
										<div class="icon d-flex align-items-center justify-content-center">
											<span class="fa fa-hand-o-right"></span>
										</div>
										<div class="text pl-3">
											<p><span>Data Visualization</span></p>
										</div>
									</div>
									<div class="dbox w-100 d-flex align-items-center">
										<div class="icon d-flex align-items-center justify-content-center">
											<span class="fa fa-hand-o-right"></span>
										</div>
										<div class="text pl-3">
											<p><span>Android Development</span></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<section class="ftco-section">
			<div class="container">
			   <div class="row justify-content-center pb-4">
				   <div class="col-md-12 heading-section text-center ftco-animate">
					   <span class="subheading"></span>
					   </div>
					   </div>
					   </div>
                
					   </section>
	
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
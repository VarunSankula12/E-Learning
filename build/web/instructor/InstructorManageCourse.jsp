<%@page import="com.codebook.instructor.instructorDao"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.sql.*,java.io.*"%>
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
function showDeleteConfirmation(courseName) {
  Swal.fire({
    title: "Are you sure?",
    text: "This action cannot be undone.",
    icon: "warning",
    showCancelButton: true,
    confirmButtonText: "Delete",
    cancelButtonText: "Cancel",
    confirmButtonColor: "#d33",
    cancelButtonColor: "#3085d6"
  }).then((result) => {
    if (result.isConfirmed) {
      // Encode the collegeName value for the URL
      var encodedCourseName = encodeURIComponent(courseName);
      
      // Create the anchor tag with the encoded parameter
      var deleteLink = document.createElement("a");
      deleteLink.href = "InstructorRemoveCourses.jsp?coursename=" + encodedCourseName;
      
      // Simulate clicking the link to trigger the redirect
      document.body.appendChild(deleteLink); // Append the link to the body
      deleteLink.click();
      
      // Clean up by removing the link from the body
      document.body.removeChild(deleteLink);
    }
  });
}
</script>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html"><span>Study</span>Lab</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto col-8">
					<li class="nav-item"><a href="Instructor-Dashboard.jsp" class="nav-link">HOME</a></li>
                        <li class="nav-item dropdown active">
                          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            COURSE
                          </a>
                          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="Instructor-AddCourse.jsp">ADD COURSE</a>
                            <a class="dropdown-item" href="InstructorManageCourse.jsp">MANAGE COURSES</a>
                          </div>
                        </li>
					<li class="nav-item"><a href="Instructor-View-Students.jsp" class="nav-link">VIEWSTUDENTS</a></li>
					<li class="nav-item"><a href="Instructor-Feedback.jsp" class="nav-link">FEEDBACK</a></li>
                    <li class="nav-item"><a href="Instructor-Profile.jsp" class="nav-link">PROFILE</a></li>
					<li class="nav-item"><a href="Instructor-AddTest.jsp" class="nav-link">ADDTEST</a></li>
                    <li class="nav-item"><a href="../index.html" class="nav-link">LOGOUT</a></li>
				
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
			<p class="breadcrumbs"><span class="mr-2"><a href="../index.html">Home <i class="fa fa-chevron-right"></i></a></span>
                <span class="mr-2"><a href="Instructor-login.html">Instructor <i class="fa fa-chevron-right"></i></a></span>
                <span class="mr-2"><a href="Instructor-Dashboard.jsp">Instructor Dashboard <i class="fa fa-chevron-right"></i></a></span>
                <span class="mr-2"><a href="InstructorManageCourse.jsp">Instructor ManageCourse<i></i></a></span></p>
		</div>
		<div class="row justify-content-center pb-4">
			<div class="col-md-12 heading-section text-center ftco-animate bg-primary">
				<span class="subheading"></span>
			  <h2 class="mb-4">Instructor-ManageCourses</h2>
		  </div></div>
	
          <div class="row justify-content-center pb-4">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<span class="subheading"></span>
			  <h2 class="mb-4"></h2>
		  </div></div>

          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-striped">
                <thead class="thead-dark">
                  <tr>
                    <th>S.No</th>
                    <th>Course Name</th>
                    <th>Course Video</th>
                    <th>Duration</th>
                    <th>Fees</th>
                    <th>Manage</th>
                  </tr>
                </thead>
                <tbody>                         
                  
<%
                int count=1;
                String coursename="";
                bean b=new bean();
                String email=(String)session.getAttribute("email");
                b.setEmail(email);
                ResultSet rs=instructorDao.InstructorCourses(b);
                while(rs.next()){
               coursename=rs.getString("coursename");
%>
                    
                  <tr class="table-success">
                    <td><%= count%></td>
                    <td><%= coursename%></td>
                    <td><a href=<%= rs.getString("url")%>>Watch Video</a></td>
                    <td><%= rs.getString("duration")%></td>
                    <td><%= rs.getString("coursefee")%></td>
                   
    <td>
        <a class="btn btn-success" href="Instructor-ManageCourse-UpdateForm.jsp?coursename=<%= java.net.URLEncoder.encode(rs.getString("coursename"), "UTF-8") %>" >Edit</a>
  <a href="#" class="btn btn-danger" onclick="showDeleteConfirmation('<%= coursename %>')"><i class="bi bi-trash3 larger-icon"></i>Remove</a>
    </td>
                  </tr>

                 <%
                     count++;
                     }
                 %>

                </tbody>
              </table>
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

<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream,java.sql.*"%>
<%@page import="com.codebook.admin.*"%>
<%@page import="com.codebook.Connections.bean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" name="viewport">
  <title>Dashboard &mdash; Stisla</title>

  <link rel="stylesheet" href="../dist/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="../dist/modules/ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="../dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">

  <link rel="stylesheet" href="../dist/modules/summernote/summernote-lite.css">
  <link rel="stylesheet" href="../dist/modules/flag-icon-css/css/flag-icon.min.css">
  <link rel="stylesheet" href="../dist/css/demo.css">
  <link rel="stylesheet" href="../dist/css/style.css">
  
</head>

<body>
     <script>
        var successMessage = '${sessionScope.authorize}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("authorize"); %>
        }
    </script>
    <script>
        var successMessage = '${sessionScope.authorizeFailed}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("authorizeFailed"); %>
        }
    </script>
    <script>
        var successMessage = '${sessionScope.unauthorize}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("unauthorize"); %>
        }
    </script>
    <script>
        var successMessage = '${sessionScope.unauthorizeFailed}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("unauthorizeFailed"); %>
        }
    </script>
  <div id="app">
    <div class="main-wrapper">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <form class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="ion ion-navicon-round"></i></a></li>
            <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="ion ion-search"></i></a></li>
          </ul>
         
        </form>
        <ul class="navbar-nav navbar-right">
          
          <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg">
            <i class="ion ion-android-person d-lg-none"></i>
            <div class="d-sm-none d-lg-inline-block">Hi, Varun Sankula</div></a>
            <div class="dropdown-menu dropdown-menu-right">
             
              <a href="../../index.html" class="dropdown-item has-icon">
                <i class="ion ion-log-out"></i> Logout
              </a>
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
              <a href="Admin-Dashboard.jsp">CodeBook</a>
          </div>
          <div class="sidebar-user">
            <div class="sidebar-user-picture">
              <img alt="image" src="../dist/img/avatar/avatar-1.jpeg">
            </div>
            <div class="sidebar-user-details">
              <div class="user-name">Varun Sankula</div>
              <div class="user-role">
                Administrator
              </div>
            </div>
          </div>
          <ul class="sidebar-menu">
            <li>
                <a href="Admin-Dashboard.jsp"><i></i><span>Dashboard</span></a>
            </li>

            <li class="active">
              <a href="#" class="has-dropdown"><i></i><span>Instructor Management</span></a>
              <ul class="menu-dropdown">
                <li><a href="View-Pending-Instructors.jsp"><i class="ion ion-ios-circle-outline"></i> View Pending Instructors</a></li>
                <li class="active"><a href="Manage-Instructors.html"><i class="ion ion-ios-circle-outline"></i> Manage Instructors</a></li>
              </ul>
            </li>
            <li>
              <a href="#" class="has-dropdown"><i></i><span>Course Management</span></a>
              <ul class="menu-dropdown">
                <li><a href="ViewCourses.jsp"><i class="ion ion-ios-circle-outline"></i>View Courses</a></li>
                <li><a href="Manage-Courses.jsp"><i class="ion ion-ios-circle-outline"></i>Manage Courses</a></li>
              </ul>
            </li>
            
            <li>
              <a href="ViewStudents.jsp"><i></i><span>View Students</span></a>
              
            </li>
            <li>
              <a href="ViewFeedback.jsp"><i></i><span>View Feedback</span></a>
              
            </li>
            </ul>
          
        </aside>
      </div>
      <div class="main-content">
        <section class="section">
          <h1 class="section-header">
            <div>Manage Instructors</div>
          </h1>
         
          <div class="container mt-5">
            <h3></h3>
            <table id="instructor-table" class="table table-bordered">
              <thead>
                <tr>
                    <th>S.No</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone Num</th>
                    <th>Experience</th>
                    <th>Status</th>
                    <th>Permission</th>
                    <th>Decision</th>
                </tr>
              </thead>
              <tbody>
               
                  <%
    
bean b = new bean();
int count=0;String resume=null;
ResultSet rs = adminDao.Approved_Instructors(b);
while (rs.next()) {

        Blob resume1=rs.getBlob("upload_resume");
     InputStream inputStream = resume1.getBinaryStream();

                     ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                     byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                         outputStream.write(buffer, 0, bytesRead);
                                         }
                        resume = Base64.getEncoder().encodeToString(outputStream.toByteArray());
                        count++;
%>
<tr>
    <td><%= count %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("mobile") %></td>
    <td><%= rs.getString("experience") %></td>
    <td><%=rs.getString("status") %></td>
    <td><%=rs.getString("permission") %></td>
  <td>
   <a  class="btn btn-success" href="Authorized.jsp?email=<%= rs.getString("email")%>" >Authorized</a>
   <a  class="btn btn-danger" href="Unauthorized.jsp?email=<%= rs.getString("email")%>" >Unauthorized</a>
  </td>
    
</tr>

<%
}
rs.close(); 
%>
                  
                <!-- Add more rows for other instructors here -->
              </tbody>
            </table>
           </div>
          
                
          
        </section>
      </div>
      <footer class="main-footer">
        
        <div class="footer-right"></div>
      </footer>
    </div>
  </div>

  <script src="../dist/modules/jquery.min.js"></script>
  <script src="../dist/modules/popper.js"></script>
  <script src="../dist/modules/tooltip.js"></script>
  <script src="../dist/modules/bootstrap/js/bootstrap.min.js"></script>
  <script src="../dist/modules/nicescroll/jquery.nicescroll.min.js"></script>
  <script src="../dist/modules/scroll-up-bar/dist/scroll-up-bar.min.js"></script>
  <script src="../dist/js/sa-functions.js"></script>
  
  <script src="../dist/modules/chart.min.js"></script>
  <script src="../dist/modules/summernote/summernote-lite.js"></script>

  
  <script src="../dist/js/scripts.js"></script>
  <script src="../dist/js/custom.js"></script>
  <script src="../dist/js/demo.js"></script>
  <script>
    // JavaScript code to handle button clicks
    $(document).ready(function () {
      $(".accept-btn").click(function () {
        $(this).closest("tr").find(".status").text("Authorized");
      });
  
      $(".reject-btn").click(function () {
        $(this).closest("tr").find(".status").text("Unauthorized");
      });
    });
  </script>
</body>
</html>






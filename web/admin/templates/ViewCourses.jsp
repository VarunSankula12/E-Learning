<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
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

            <li>
              <a href="#" class="has-dropdown"><i></i><span>Instructor Management</span></a>
              <ul class="menu-dropdown">
                <li><a href="View-Pending-Instructors.jsp"><i class="ion ion-ios-circle-outline"></i> View Pending Instructors</a></li>
                <li><a href="Manage-Instructors.jsp"><i class="ion ion-ios-circle-outline"></i> Manage Instructors</a></li>
              </ul>
            </li>
            <li class="active">
              <a href="#" class="has-dropdown"><i></i><span>Course Management</span></a>
              <ul class="menu-dropdown">
                <li class="active"><a href="ViewCourses.jsp"><i class="ion ion-ios-circle-outline"></i>View Courses</a></li>
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
            <div>Course Table</div>
            </h1>
          
            <div class="container mt-5">
                <h3>All Courses</h3>
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>S.no</th>
                      <th>Course Name</th>
                      <th>Category</th>
                      <th>Course Video URL</th>
                      <th>Instructor Name</th>
                      <th>Course Fee</th>
                      <th>Duration</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%
    
bean b = new bean();
int count=0;
ResultSet rs = adminDao.ShowSelectedCourses(b);
while (rs.next()) {
count++;
%>
<tr>
    <td><%= count %></td>
    <td><%= rs.getString("coursename") %></td>
    <td><%= rs.getString("category") %></td>
    <td><a href=<%= rs.getString("url") %>>Watch Video</a></td>
    <td><%= rs.getString("email")%></td>
    <td><%= rs.getString("coursefee") %></td>
    <td><%=rs.getString("duration") %></td>
</tr>

<%
}
rs.close(); 
%>  
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
</body>
</html>
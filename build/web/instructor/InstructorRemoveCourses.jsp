<%@page import="com.codebook.Connections.studentDao"%>
<%@page import="com.codebook.instructor.instructorDao"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<%
    int rowCount=0;
    String Course="";
    String CourseQuiz="";
    String CourseFeedback="";
    String CourseSubscription="";
    String mail=(String)session.getAttribute("email");
    String ins_name=(String)session.getAttribute("name");
    bean b=new bean();
    b.setCoursename(request.getParameter("coursename"));
    b.setEmail(mail);
    b.setName(ins_name);
    ResultSet rs=instructorDao.ValidCourse(b);
    if(rs.next()){
        if(instructorDao.DeleteCourse(b)){
          Course="Course Deleted";
        }
        if(instructorDao.DeleteCourseQuiz(b)){
         CourseQuiz="Quiz Deleted";
        }
        if(studentDao.DeleteCourseFeedback(b)){
          CourseFeedback="Feedback Deleted";
           }
        if(studentDao.DeleteCourseSubscription(b)){
         CourseSubscription="Subscription Deleted";
         
          }
 }
         String name=Course+","+CourseQuiz+","+CourseFeedback+","+CourseSubscription;
        String encodedCourseName = request.getParameter("coursename");
        String decodedCourseName = java.net.URLDecoder.decode(encodedCourseName, "UTF-8");
         request.getSession();
         session.setAttribute("success", name+" !");
         response.sendRedirect("InstructorManageCourse.jsp");
%>

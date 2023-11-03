<%@page import="com.codebook.instructor.instructorDao"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<%
    
    String mail=(String)session.getAttribute("email");
    bean b=new bean();
     b.setCoursename(request.getParameter("coursename"));
    b.setUrl(request.getParameter("url"));
    b.setCoursefee(request.getParameter("coursefee"));
    b.setDuration(request.getParameter("duration"));
    b.setEmail(mail);
   
    int rowCount=instructorDao.UpdatingCourse(b);
    if(rowCount>0){
    request.getSession();
    session.setAttribute("success", "Updating Course Successful!");
    response.sendRedirect("InstructorManageCourse.jsp");
    }else{
     request.getSession();
    session.setAttribute("failed", "Failed to Update Course!");
    response.sendRedirect("InstructorManageCourse.jsp");
    }
    
    
%>




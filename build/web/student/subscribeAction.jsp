<%@page import="com.codebook.Connections.studentDao"%>
<%@page import="com.codebook.instructor.instructorDao"%>
<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="java.util.Base64"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.io.*,java.sql.*"%>

<%
    String status="";
    bean b=new bean();
    String mail=(String)session.getAttribute("semail");
    b.setName(request.getParameter("instructor_name"));
    b.setCoursename(request.getParameter("coursename"));
    b.setEmail(mail);
    String coursename=request.getParameter("coursename");
    ResultSet rs=studentDao.subscriptionValidation(b);
    if(rs.next()){
    request.getSession();
    session.setAttribute("already", " You have already Subscribed this "+coursename+" course!");
    response.sendRedirect("course.jsp");
    }else{
    status=studentDao.Subscription(b);
    if(status=="subscribe"){
    request.getSession();
    session.setAttribute("success",  "Your "+coursename+ "  purchase  is successful!");
    response.sendRedirect("mycourses.jsp");
    }else{
    request.getSession();
    session.setAttribute("failed", "Your "+coursename+ "  purchase failed!");
    response.sendRedirect("course.jsp");
    }
    }
   
%>
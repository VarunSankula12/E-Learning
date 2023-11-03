<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="java.util.Base64"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.io.*,java.sql.*"%>

<%
    bean b=new bean();
    b.setCoursename(request.getParameter("coursename"));
    int rowCount =adminDao.Rejecting_Courses(b);
    if(rowCount>0){
    request.getSession();
    session.setAttribute("remove", "Rejected!");
    response.sendRedirect("Manage-Courses.jsp");
    }else{
    request.getSession();
    session.setAttribute("removeFailed", "Failed due to internal cause!");
    response.sendRedirect("Manage-Courses.jsp");
    }

        
    

%>


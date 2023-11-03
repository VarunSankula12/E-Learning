<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="java.util.Base64"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.io.*,java.sql.*"%>

<%
    bean b=new bean();
    b.setCoursename(request.getParameter("coursename"));
    int rowCount =adminDao.Accepting_Course(b);
    if(rowCount>0){
    request.getSession();
    session.setAttribute("changeStatus", "Accepted!");
    response.sendRedirect("Manage-Courses.jsp");
    }else{
    request.getSession();
    session.setAttribute("changeStatusFailed", "Failed due to internal cause!");
    response.sendRedirect("Manage-Courses.jsp");
    }
%>


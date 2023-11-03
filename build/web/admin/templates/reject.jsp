<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="java.util.Base64"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.io.*,java.sql.*"%>

<%
    bean b=new bean();
    b.setEmail(request.getParameter("email"));
        
    int rowCount = adminDao.Rejecting_Instructor(b);
    if(rowCount>0){
    request.getSession();
    session.setAttribute("rejected", "Rejected!");
    response.sendRedirect("View-Pending-Instructors.jsp");
    }else{
    request.getSession();
    session.setAttribute("rejectionFailed", "Failed due to internal cause!");
    response.sendRedirect("View-Pending-Instructors.jsp");
    }

        
    

%>


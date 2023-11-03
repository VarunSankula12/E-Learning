<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="java.util.Base64"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.io.*,java.sql.*"%>

<%
    bean b=new bean();
    b.setEmail(request.getParameter("email"));
        
    int rowCount = adminDao.Authorizing_Instructor(b);
    if(rowCount>0){
    request.getSession();
    session.setAttribute("authorize", "Authorized!");
    response.sendRedirect("Manage-Instructors.jsp");
    }else{
    request.getSession();
    session.setAttribute("authorizeFailed", "Failed due to internal cause!");
    response.sendRedirect("Manage-Instructors.jsp");
    }

        
    

%>


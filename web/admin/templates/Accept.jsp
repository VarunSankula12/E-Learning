<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="java.util.Base64"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.io.*,java.sql.*"%>

<%
    bean b=new bean();
    b.setEmail(request.getParameter("email"));
        
    int rowCount = adminDao.Accepting_Instructor(b);
    if(rowCount>0){
    request.getSession();
    session.setAttribute("success", "Accepted!");
    response.sendRedirect("View-Pending-Instructors.jsp");
    }else{
    request.getSession();
    session.setAttribute("acceptanceFailed", "Failed to Accept due to internal cause!");
    response.sendRedirect("View-Pending-Instructors.jsp");
    }

        
    

%>


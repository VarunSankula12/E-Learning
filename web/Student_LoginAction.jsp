<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.Connections.studentDao"%>
<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<%
    String semail=request.getParameter("email");
   bean b=new bean();
    b.setEmail(semail);
    b.setPassword(request.getParameter("password"));
    ResultSet rs=null;
    rs=studentDao.Getter(b);
    if(rs.next()){
        rs=studentDao.Validation(b);
        if(rs.next()){
        session.setAttribute("semail",semail);
        request.getSession();
    session.setAttribute("success", "Login Successful!");
    response.sendRedirect("student/Student-Dashboard.jsp");
    }else{
    request.getSession();
    session.setAttribute("failed", "Wrong Credentials..!");
     response.sendRedirect("Student-login.jsp");
     }
    }else{
     request.getSession();
    session.setAttribute("failed", "User not yet Registered..!");
     response.sendRedirect("Student-login.jsp");
    }
    
    
%>
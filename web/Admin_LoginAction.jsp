<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<%
  
    bean b=new bean();
    b.setEmail(request.getParameter("email"));
    b.setPassword(request.getParameter("password"));
     ResultSet rs=adminDao.Getter(b);
    try
    {
   
    if(rs.next()){
    String mail=rs.getString("email");
    String pass=rs.getString("password");
    if(mail.equals(request.getParameter("email")) && pass.equals(request.getParameter("password"))){
     request.getSession();
    session.setAttribute("success", "Login Successful!");
    response.sendRedirect("admin/templates/Admin-Dashboard.jsp");
    }else{
    request.getSession();
    session.setAttribute("wrong", "Wrong Credentials..!");
    response.sendRedirect("Admin-login.jsp");
    }    
    }else{
    request.getSession();
    session.setAttribute("failed", "User not Exists..!");
    response.sendRedirect("Admin-login.jsp");
     }
    
   }
    catch(Exception e)
    {
    out.println(e);
    }

%>



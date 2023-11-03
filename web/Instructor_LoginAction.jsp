<%@page import="com.codebook.admin.adminDao"%>
<%@page import="com.codebook.instructor.instructorDao"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<%
  try{
    bean val=new bean();
    val.setEmail(request.getParameter("email"));
    val.setPassword(request.getParameter("password"));
    ResultSet rs=instructorDao.Getter(val);
   boolean k=rs.next();
   
   if(k==true){
   String ins_name=rs.getString("name");
   String Iemail=rs.getString("email");
   String Ipassword=rs.getString("password");
     if(Iemail.equals(request.getParameter("email")) && Ipassword.equals(request.getParameter("password")))
   
       {
        if(rs.getString("status").equalsIgnoreCase("Accepted")){
            request.getSession();
             session.setAttribute("success", "Login Successful!");
            session.setAttribute("email", Iemail);
            session.setAttribute("name", ins_name);
            response.sendRedirect("instructor/Instructor-Dashboard.jsp");
        }else if(rs.getString("status").equalsIgnoreCase("Rejected")){
                request.getSession();
             session.setAttribute("rejected", "Your Application is Rejected!");
             response.sendRedirect("Instructor-login.jsp");
         }else{
             request.getSession();
             session.setAttribute("notAccepted", "Your Application is not yet Accepted!");
             response.sendRedirect("Instructor-login.jsp");
        }
       }else{
        request.getSession();
             session.setAttribute("wrong", "You entered Wrong Credentials!");
             response.sendRedirect("Instructor-login.jsp");
        } 
    }else{
         request.getSession();
             session.setAttribute("notRegistered", "You are not yet Registered!");
             response.sendRedirect("Instructor-login.jsp");
    }
    
   
    }catch(Exception e){
    out.println(e);
    }



%>
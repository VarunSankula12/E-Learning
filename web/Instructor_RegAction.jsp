<%-- 
    Document   : Student_RegAction.jsp
    Created on : 2 Aug 2023, 16:31:13
    Author     : Aakhi
--%>

<%@page import="com.codebook.Connections.Dynamicimage"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.codebook.instructor.instructorDao"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<%
    
     bean b=new bean();
     boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
       
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);
        for(FileItem item: items){
        String fieldName=item.getFieldName();
        String fieldValue = item.getString();
         if (fieldName.equals("file")) {
            Blob image=Dynamicimage.getBlobResume(item);
            b.setBlob(image);
            } 
            if (fieldName.equals("resume")) {
            Blob image=Dynamicimage.getBlobResume(item);
            b.setBlobResume(image);
            } 
        
        
    }
     
  
    for (FileItem item : items) {
        if (item.isFormField()) {
            String fieldName = item.getFieldName();
            String fieldValue = item.getString(); 
            
            if (fieldName.equals("name")) {
                b.setName(fieldValue);
            } else if (fieldName.equals("mobile")) {
                b.setMobile(fieldValue);
            } else if (fieldName.equals("email")) {
                b.setEmail(fieldValue);
            } else if (fieldName.equals("specialization")) {
                b.setSpecialization(fieldValue);
            } else if (fieldName.equals("experience")) {
                b.setExperience(fieldValue);
            } else if (fieldName.equals("password")) {
                b.setPassword(fieldValue);
            } else if (fieldName.equals("cpassword")) {
                b.setConfirmPassword(fieldValue);
            } 
        }
    }
    
   
    ResultSet rs=instructorDao.Getter(b);
    if(rs.next()){
    request.getSession();
    session.setAttribute("exists", "User Already Exists!");
    response.sendRedirect("Instructor-registration.jsp");
    }else{
    try{
    String status=instructorDao.Setter(b);
    if(status=="success"){
    request.getSession();
    session.setAttribute("success", "Registration Successful!");
    String email=request.getParameter("email");
    session.setAttribute("email", email);
    response.sendRedirect("Instructor-login.jsp");
    }else{
    request.getSession();
    session.setAttribute("failed", "Insertion Failed!");
    response.sendRedirect("Instructor-registration.jsp");
    }
    }
    catch(Exception e)
    {
    out.println(e);
    }
    }
    }
    

    
%>

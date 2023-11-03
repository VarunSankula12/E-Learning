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
            }  if (fieldName.equals("name")) {
                b.setName(fieldValue);
            } else if (fieldName.equals("mobile")) {
                b.setMobile(fieldValue);
            } else if (fieldName.equals("email")) {
                b.setEmail(fieldValue);
            } else if (fieldName.equals("specialization")) {
                b.setSpecialization(fieldValue);
            } else if (fieldName.equals("experience")) {
                b.setExperience(fieldValue);
            }
        
        
    }
     
  
  
    int rowCount=instructorDao.UpdatingProfile(b);
    if(rowCount>0){
    request.getSession();
    session.setAttribute("success", "Profile Updation Successful!");
    response.sendRedirect("Instructor-Profile.jsp");
    }else{
    request.getSession();
    session.setAttribute("failed", "Profile Updation Failed!");
    response.sendRedirect("Instructor-Profile.jsp");
    }
    
    
    }
%>


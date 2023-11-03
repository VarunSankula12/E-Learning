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
    
    String mail=(String)session.getAttribute("email");
    bean b=new bean();
    b.setEmail(mail);
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
            }  if (fieldName.equals("insname")) {
                b.setName(fieldValue);
            } else if (fieldName.equals("coursename")) {
                b.setCoursename(fieldValue);
            } else if (fieldName.equals("category")) {
                b.setCategory(fieldValue);
            } else if (fieldName.equals("url")) {
                b.setUrl(fieldValue);
            } else if (fieldName.equals("coursefee")) {
                b.setCoursefee(fieldValue);
            }else if (fieldName.equals("duration")) {
                b.setDuration(fieldValue);
            }
             
            
        
        
    }
     
  
  
     ResultSet rs=instructorDao.Getter(b);
    if(rs.next()){
    if(rs.getString("permission").equals("Authorized")){
    ResultSet result=instructorDao.ValidCourse(b);
    if(result.next()){
    request.getSession();
    session.setAttribute("exists", "You Already Uploaded this course. Delete that course in order to add again!");
    response.sendRedirect("Instructor-AddCourse.jsp");
        out.println("You already Uploaded this Course...Delete that course in order to add again..");
    }else{
        String status=instructorDao.Addcourse(b);
    if(status=="success"){
    request.getSession();
    session.setAttribute("success", "Adding Course Successful!");
    response.sendRedirect("Instructor-AddCourse.jsp");
    }else{
    request.getSession();
    session.setAttribute("failed", "Failed to Add Course!");
    response.sendRedirect("Instructor-AddCourse.jsp");
    }
    
    }
    
    }}else{
    request.getSession();
    session.setAttribute("notAuthorized", "You can't add course since your not Authorized!");
    response.sendRedirect("Instructor-AddCourse.jsp");
    }
    
    }
    
    
%>




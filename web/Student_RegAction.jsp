<%@page import="com.codebook.Connections.studentDao"%>
<%@page import="com.codebook.Connections.Dynamicimage"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.codebook.instructor.instructorDao"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="java.sql.*,java.io.*"%>
<%
    
    
     boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {
        // Create a new file upload handler
        DiskFileItemFactory factory = new DiskFileItemFactory();
       
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);
     Blob image = Dynamicimage.getBlob(items); 
     
   bean b=new bean();
       b.setBlob(image);
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
            } else if (fieldName.equals("radio")) {
                b.setGender(fieldValue);
            } else if (fieldName.equals("dob")) {
                b.setDob(fieldValue);
            } else if (fieldName.equals("password")) {
                b.setPassword(fieldValue);
            } else if (fieldName.equals("cpassword")) {
                b.setConfirmPassword(fieldValue);
            } 
        }
    }
    
   
    ResultSet rs=studentDao.Getter(b);
    if(rs.next()){
    request.getSession();
    session.setAttribute("warning", "User Already Exists!");
    response.sendRedirect("Student-registration.jsp");
    }else{
    try{
    String status=studentDao.Setter(b);
    if(status=="success"){
    request.getSession();
    session.setAttribute("success", "Registration Successful!");
    String email=request.getParameter("email");
    session.setAttribute("email", email);
    response.sendRedirect("Student-registration.jsp");
    }else{
    request.getSession();
    session.setAttribute("failed", "Registration Failed..!");
    response.sendRedirect("Student-registration.jsp");
    }
    }
    catch(Exception e)
    {
    out.println(e);
    }
    }
    }

    
%>

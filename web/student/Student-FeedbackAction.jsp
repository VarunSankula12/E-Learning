<%@page import="com.codebook.Connections.object"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.Connections.studentDao"%>
<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<%

        bean b=new bean();
        b.setName(request.getParameter("instructor_name"));
        b.setCoursename(request.getParameter("coursename"));
        b.setFeedback(request.getParameter("feedback"));
        b.setRating(request.getParameter("rating"));
        String mail=(String)session.getAttribute("semail");
        b.setEmail(mail);
        
        String coursename=request.getParameter("coursename");
             String status=studentDao.StudentFeedback(b);
        if(status=="success"){
         request.getSession();
    session.setAttribute("FeedbackSubmissionSuccess",coursename+ " Feedback Successfully Submitted!");
    response.sendRedirect("mycourses.jsp");
        }else{
         request.getSession();
    session.setAttribute("FeedbackSubmissionFailed"," Failed to give Feedback for "+coursename+" !");
    response.sendRedirect("mycourses.jsp");
        }
    
       

%>

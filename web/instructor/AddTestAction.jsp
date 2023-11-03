<%@page import="java.util.Enumeration"%>
<%@page import="java.util.*"%>
<%@page import="com.codebook.instructor.instructorDao"%>
<%@page import="com.codebook.Connections.bean"%>
<%@page import="com.codebook.Connections.connectionFactory"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>

<%
    
    String qname="";
    int options=1;
        int count=0;
       bean b=new bean();
       HashMap<String,LinkedList<String>> map=new HashMap<>();
       LinkedList<String> question=new LinkedList<>();
       
       Enumeration<String> paramNames = request.getParameterNames();
    while (paramNames.hasMoreElements()) {
        String paramName = paramNames.nextElement();
        String[] paramValues = request.getParameterValues(paramName);
        for (String paramValue : paramValues) {
        if(paramName.equalsIgnoreCase("question_")){
            question.add(paramValue+",");
            
        }
        if(paramName.equals("option__"+options) || paramName.equals("correctAnswer_")){
        if(map.containsKey("option__"+options)){
            map.get("option__"+options).add(paramValue);
       }else{
        LinkedList<String> list=new LinkedList<>();
        list.add(paramValue);
        map.put("option__"+options, list);
        
        }
         
        }
    }
    if(!paramName.equalsIgnoreCase("questionCount")&& !paramName.equalsIgnoreCase("question_") && !paramName.equalsIgnoreCase("coursename")){
        options++;
        }
       
    }
    String ques=question.toString().trim();
    String opt=map.toString().trim();
    String mail=(String)session.getAttribute("email");
    b.setEmail(mail);
    b.setCoursename(request.getParameter("coursename"));
    ResultSet rs=instructorDao.ValidCourse(b);
    if(rs.next()){
        b.setName(rs.getString("instructor_name"));
        b.setCoursename(request.getParameter("coursename"));
        b.setList(question);
        b.setOptions(map);
        String status=instructorDao.QuizInsertion(b);
        if(status=="success")
        request.getSession();
    session.setAttribute("success", "Adding Quiz Successful!");
        response.sendRedirect("Instructor-AddTest.jsp");
    }else{
    request.getSession();
    session.setAttribute("failed", "Adding Quiz Failed!");
        response.sendRedirect("Instructor-AddTest.jsp");
    }
%>

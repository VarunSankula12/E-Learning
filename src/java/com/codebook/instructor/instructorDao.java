
package com.codebook.instructor;
import com.codebook.Connections.bean;
import com.codebook.Connections.connectionFactory;
import com.codebook.Connections.studentDao;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class instructorDao {
    
    public static String Setter(bean b)
   {
       
        String status="";
        try{
        Connection con=connectionFactory.getconnection();
        PreparedStatement ps=con.prepareStatement("insert into instructors(name,mobile,email,specialization,experience,password,confirm_password,upload_image,upload_resume) values(?,?,?,?,?,?,?,?,?)");
        ps.setString(1, b.getName());
        ps.setString(2, b.getMobile());
        ps.setString(3, b.getEmail());
        ps.setString(4, b.getSpecialization());
        ps.setString(5, b.getExperience());
        ps.setString(6, b.getPassword());
        ps.setString(7, b.getConfirmPassword());
        ps.setBlob(8, b.getBlob());
        ps.setBlob(9, b.getBlobResume());
        int rowCount=ps.executeUpdate();
        
        if(rowCount>0)
        {
            status="success";
        }
        else
        {
           status="failed";
        }
        
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
     return status;
   }
   public static ResultSet Getter(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from instructors where email=?");
      ps.setString(1, b.getEmail());
      rs=ps.executeQuery();
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return rs;
   }
   
   
   public static int UpdatingProfile(bean b){
        int rowCount=0;
    try {
       Connection connection =connectionFactory.getconnection();
        String query = "UPDATE instructors SET name=?,mobile=?,email=?,specialization=?,experience=?,upload_image=?,upload_resume=? WHERE email='"+b.getEmail()+"'";
       PreparedStatement ps= connection.prepareStatement(query);
       ps.setString(1, b.getName());
       ps.setString(2, b.getMobile());
       ps.setString(3, b.getEmail());
       ps.setString(4, b.getSpecialization());
       ps.setString(5, b.getExperience());
       if(b.getBlob().length()==0){
           ResultSet rs=instructorDao.Getter(b);
           if(rs.next()){
           b.setBlob(rs.getBlob("upload_image"));
           }
       }
       if(b.getBlobResume().length()==0){
           ResultSet rs=instructorDao.Getter(b);
           if(rs.next()){
           b.setBlobResume(rs.getBlob("upload_resume"));
           }
       }
       ps.setBlob(6, b.getBlob());
       ps.setBlob(7, b.getBlobResume());
       
        rowCount=ps.executeUpdate();
       
    } catch (Exception e) {
        e.printStackTrace();
    } 
    return rowCount;
     }
   
   
   public static String Addcourse(bean b)
   {
       
        String status="";
        try{
        Connection con=connectionFactory.getconnection();
        PreparedStatement ps=con.prepareStatement("insert into courses(instructor_name,coursename,category,url,coursefee,duration,email,upload_image) values(?,?,?,?,?,?,?,?)");
        ps.setString(1, b.getName());
        ps.setString(2, b.getCoursename());
        ps.setString(3, b.getCategory());
        ps.setString(4, b.getUrl());
        ps.setString(5, b.getCoursefee());
        ps.setString(6, b.getDuration());
        ps.setString(7,b.getEmail());
        ps.setBlob(8, b.getBlob());
        
        int rowCount=ps.executeUpdate();
        
        if(rowCount>0)
        {
            status="success";
        }
        else
        {
           status="failed";
        }
        
        }
        catch(Exception e)
        {
            status=e.getMessage();
        }
     return status;
   }
     
   
    public static ResultSet InstructorCourses(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from courses WHERE email=? or coursename='"+b.getCoursename()+"'");
       ps.setString(1, b.getEmail());
      rs=ps.executeQuery();
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return rs;
   }
    
    public static ResultSet ValidCourse(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from courses WHERE email=? && coursename=?");
       ps.setString(1, b.getEmail());
       ps.setString(2, b.getCoursename());
      rs=ps.executeQuery();
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return rs;
   }
    
    
     public static boolean DeleteCourse(bean b){
       int rowCount=0;
       boolean val=false;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("delete from courses WHERE instructor_name=? && coursename=?");
       ps.setString(1, b.getName());
       ps.setString(2, b.getCoursename());
      rowCount=ps.executeUpdate();
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       if(rowCount>0){
           val=true;
       }
       return val;
   }
    
    public static int UpdatingCourse(bean b){
        int rowCount=0;
    try {
       Connection connection =connectionFactory.getconnection();
        String query = "UPDATE courses SET coursename= ?,url=?,coursefee=?,duration=? WHERE email=? && coursename ='"+b.getCoursename()+"'";
       PreparedStatement ps= connection.prepareStatement(query);
       ps.setString(1, b.getCoursename());
       ps.setString(2, b.getUrl());
       ps.setString(3, b.getCoursefee()); 
       ps.setString(4, b.getDuration());
       ps.setString(5, b.getEmail());
        rowCount=ps.executeUpdate();
       
    } catch (Exception e) {
        System.out.println(e);
    } 
    return rowCount;
     }
   
    public static ResultSet DisplayCourses(bean b){
       ResultSet rs=null;
       String status="Accepted";
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from courses");
      rs=ps.executeQuery();
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return rs;
   }
    
    

public static String QuizInsertion(bean b) {
    LinkedList<String> list = new LinkedList<String>();
    LinkedList<String> option=new LinkedList<String>();
    HashMap<String, LinkedList<String>> options = b.getOptions();
    int val = 3;
    String status = "";

    try {
        Connection con = connectionFactory.getconnection();
        PreparedStatement ps = con.prepareStatement("insert into quiz (instructor_name, coursename, questions, options) values (?, ?, ?, ?)");
        ps.setString(1, b.getName());
        ps.setString(2, b.getCoursename());
        list = b.getList();

        StringBuilder allQuestions = new StringBuilder();
        StringBuilder allOptions = new StringBuilder();
        for (String question : list) {
            allQuestions.append(question).append("\n");
             
        }
         for (HashMap.Entry<String, LinkedList<String>> entry : options.entrySet()) {
            String question = entry.getKey();
            LinkedList<String> opt = entry.getValue();

            allOptions.append(String.join(",", opt)).append(",");
        }


        ps.setString(3, allQuestions.toString());
        ps.setString(4, allOptions.toString());

        int rowCount = ps.executeUpdate();
        if (rowCount > 0) {
            status = "success";
        } else {
            status = "failed";
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return status;
}


public static ResultSet DisplayQuiz(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from quiz where instructor_name=? && coursename=?");
       ps.setString(1, b.getName());
       ps.setString(2, b.getCoursename());
      rs=ps.executeQuery();
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return rs;
   }

public static boolean DeleteCourseQuiz(bean b){
       boolean val=false;
       int rowCount=0;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("delete from quiz where coursename=? && instructor_name=?");
       ps.setString(1, b.getCoursename());
       ps.setString(2, b.getName());
       rowCount=ps.executeUpdate();
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       if(rowCount>0){
         val=true;  
       }
       return val;
   }
    
}
package com.codebook.admin;
import com.codebook.Connections.bean;
import com.codebook.Connections.connectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class adminDao {
    public static ResultSet Getter(bean b){
        ResultSet rs=null;
        try{
            
            Connection connection=connectionFactory.getconnection();
            PreparedStatement ps=connection.prepareStatement("Select * from admin where email=?");
            ps.setString(1,b.getEmail());
            rs=ps.executeQuery();
            
        }catch(Exception e){
            System.out.println(e);
        }
        return rs;
    }
    
    public static ResultSet Getter_Instructor(bean b){
        ResultSet rs=null;
        String pending="pending";
        String rejected="Rejected";
        try{
            
            Connection connection=connectionFactory.getconnection();
            PreparedStatement ps=connection.prepareStatement("Select * from instructors where status=? or status=?");
            ps.setString(1, pending);
            ps.setString(2,rejected);
            rs=ps.executeQuery();
            
        }catch(Exception e){
            System.out.println(e);
        }
        return rs;
    }
    
    
     public static int Accepting_Instructor(bean b){
        int rowCount=0;

    try {
       Connection connection =connectionFactory.getconnection();
        String query = "UPDATE instructors SET status = 'Accepted' WHERE email =?";
       PreparedStatement ps= connection.prepareStatement(query);
       ps.setString(1, b.getEmail());
        rowCount=ps.executeUpdate();
       
    } catch (Exception e) {
        System.out.println(e);
    } 
    return rowCount;
     }
     
     
     public static ResultSet Approved_Instructors(bean b){
        ResultSet rs=null;
        String a="Accepted";
        try{
            
            Connection connection=connectionFactory.getconnection();
            PreparedStatement ps=connection.prepareStatement("Select * from instructors where status=?");
            ps.setString(1, a);
            rs=ps.executeQuery();
            
        }catch(Exception e){
            System.out.println(e);
        }
        return rs;
    }
     
      public static ResultSet Total_Instructors(){
        ResultSet rs=null;
        try{
            
            Connection connection=connectionFactory.getconnection();
            PreparedStatement ps=connection.prepareStatement("Select * from instructors");
            rs=ps.executeQuery();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return rs;
    }
     
     public static int Rejecting_Instructor(bean b){
        int rowCount=0;

    try {
       Connection connection =connectionFactory.getconnection();
        String query = "UPDATE instructors SET status = 'Rejected' WHERE email =?";
       PreparedStatement ps= connection.prepareStatement(query);
       ps.setString(1, b.getEmail());
        rowCount=ps.executeUpdate();
       
    } catch (Exception e) {
        System.out.println(e);
    } 
    return rowCount;
     }
     
    public static ResultSet ShowCourses(bean b){
       ResultSet rs=null;
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
     
   
    
    public static ResultSet ShowSelectedCourses(bean b){
       ResultSet rs=null;String status="Accepted";
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from courses WHERE status=?");
       ps.setString(1, status);
      rs=ps.executeQuery();
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return rs;
   }
    
      public static int Accepting_Course(bean b){
        int rowCount=0;

    try {
       Connection connection =connectionFactory.getconnection();
        String query = "UPDATE courses SET status = 'Accepted' WHERE coursename =?";
       PreparedStatement ps= connection.prepareStatement(query);
       ps.setString(1, b.getCoursename());
        rowCount=ps.executeUpdate();
       
    } catch (Exception e) {
        System.out.println(e);
    } 
    return rowCount;
     }
    
    public static int Rejecting_Courses(bean b){
        int rowCount=0;

    try {
       Connection connection =connectionFactory.getconnection();
        String query = "UPDATE courses SET status = 'Rejected' WHERE coursename=?";
       PreparedStatement ps= connection.prepareStatement(query);
       ps.setString(1, b.getCoursename());
        rowCount=ps.executeUpdate();
       
    } catch (Exception e) {
        System.out.println(e);
    } 
    return rowCount;
     }
    
     public static int Authorizing_Instructor(bean b){
        int rowCount=0;

    try {
       Connection connection =connectionFactory.getconnection();
        String query = "UPDATE instructors SET permission = 'Authorized' WHERE email =?";
       PreparedStatement ps= connection.prepareStatement(query);
       ps.setString(1, b.getEmail());
        rowCount=ps.executeUpdate();
       
    } catch (Exception e) {
        System.out.println(e);
    } 
    return rowCount;
     }
     
      public static int Unauthorizing_Instructor(bean b){
        int rowCount=0;

    try {
       Connection connection =connectionFactory.getconnection();
        String query = "UPDATE instructors SET permission = 'Unauthorized' WHERE email =?";
       PreparedStatement ps= connection.prepareStatement(query);
       ps.setString(1, b.getEmail());
        rowCount=ps.executeUpdate();
       
    } catch (Exception e) {
        System.out.println(e);
    } 
    return rowCount;
     }
      
      
      public static ResultSet ViewStudents(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from students");
      rs=ps.executeQuery();
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return rs;
   }
      
      
      public static ResultSet ShowSubscribedCourses(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from courses where coursename=? && instructor_name=?");
       ps.setString(1, b.getCoursename());
       ps.setString(2, b.getName());
      rs=ps.executeQuery();
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return rs;
   }
    
}
     
    
    
    
   
    
    



package com.codebook.Connections;
import java.sql.*;
import java.io.*;
public class studentDao 
{
   public static String Setter(bean b)
   {
       
        String status="";
        try{
            
        Connection con=connectionFactory.getconnection();
        PreparedStatement ps=con.prepareStatement("insert into students(student_name,student_mobile,student_email,student_gender,student_dob,password,confirm_password,upload_image)values(?,?,?,?,?,?,?,?)");
        ps.setString(1, b.getName());
        ps.setString(2, b.getMobile());
        ps.setString(3, b.getEmail());
        ps.setString(4, b.getGender());
        ps.setString(5, b.getDob());
        ps.setString(6, b.getPassword());
        ps.setString(7, b.getConfirmPassword());
        ps.setBlob(8, b.getBlob());
        int rowCount=ps.executeUpdate();
        if(rowCount>0){
            status="success";
        }else{
           status="failed";
        }
        
        }
        catch(Exception e){
            status=e.getMessage();
        }
     return status;
   }
   public static ResultSet Getter(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from students where student_email=?");
      ps.setString(1, b.getEmail());
      rs=ps.executeQuery();
       }
       catch(Exception e){
           System.out.print(e);
       }
       return rs;
   }
   
   public static ResultSet Total_Students(){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from students");
      rs=ps.executeQuery();
       }
       catch(Exception e){
           e.printStackTrace();
       }
       return rs;
   }
   
   public static ResultSet Validation(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from students where student_email=? && password=?");
      ps.setString(1, b.getEmail());
      ps.setString(2, b.getPassword());
      rs=ps.executeQuery();
       }
       catch(Exception e){
           System.out.print(e);
       }
       return rs;
   }
  
   public static String Subscription(bean b)
   {
       
        String status="";
        try{
            
        Connection con=connectionFactory.getconnection();
        PreparedStatement ps=con.prepareStatement("insert into subscription(instructor_name,coursename,student_email)values(?,?,?)");
        ps.setString(1, b.getName());
        ps.setString(2, b.getCoursename());
        ps.setString(3, b.getEmail());
        int rowCount=ps.executeUpdate();
        if(rowCount>0){
            status="subscribe";
        }else{
           status="not subscribed";
        }
        
        }
        catch(Exception e){
            System.out.println(e);
        }
     return status;
   }
   
   public static ResultSet subscriptionValidation(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from subscription where instructor_name=? && coursename=? && student_email=?");
      ps.setString(1, b.getName());
      ps.setString(2, b.getCoursename());
      ps.setString(3, b.getEmail());
      rs=ps.executeQuery();
       }
       catch(Exception e){
           System.out.print(e);
       }
       return rs;
   }
   
   
   public static ResultSet subscriber(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from subscription where student_email=?");
      ps.setString(1, b.getEmail());
      rs=ps.executeQuery();
       }
       catch(Exception e){
           System.out.print(e);
       }
       return rs;
   }
   
   public static ResultSet ViewStudents(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from subscription where instructor_name=?");
      ps.setString(1, b.getName());
      rs=ps.executeQuery();
       }
       catch(Exception e){
           System.out.print(e);
       }
       return rs;
   }
   
   
   public static boolean DeleteCourseSubscription(bean b){
       boolean val=false;
       int rowCount=0;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("delete from subscription WHERE coursename=? && instructor_name=?");
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
   
   
   
    public static ResultSet Results(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from subscription where student_email=? && instructor_name=?");
       ps.setString(1, b.getEmail());
      ps.setString(2, b.getName());
      rs=ps.executeQuery();
       }
       catch(Exception e){
           System.out.print(e);
       }
       return rs;
   }
   
   
    public static String StudentFeedback(bean b)
   {
       
        String status="";
        try{
            
        Connection con=connectionFactory.getconnection();
        PreparedStatement ps=con.prepareStatement("insert into feedback(instructor_name,coursename,feedback,student_email,rating)values(?,?,?,?,?)");
        ps.setString(1, b.getName());
        ps.setString(2, b.getCoursename());
        ps.setString(3, b.getFeedback());
        ps.setString(4, b.getEmail());
        ps.setString(5, b.getRating());
        int rowCount=ps.executeUpdate();
        if(rowCount>0){
            status="success";
        }else{
           status="failed";
        }
        
        }
        catch(Exception e){
            System.out.println(e);
        }
     return status;
   }
   
    public static ResultSet Feedback(bean b){
       ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from feedback where student_email=? &&instructor_name=? && coursename=?");
      ps.setString(1, b.getEmail());
      ps.setString(2, b.getName());
      ps.setString(3, b.getCoursename());
      rs=ps.executeQuery();
       }
       catch(Exception e){
           System.out.print(e);
       }
       return rs;
   }
    
    public static ResultSet DisplayFeedback(bean b){
         ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from feedback where instructor_name=?");
       ps.setString(1, b.getName());
       rs=ps.executeQuery();
       }
       catch(Exception e){
           System.out.print(e);
       }
       return rs;
    }
    
    public static ResultSet DisplayCourseFeedback(bean b){
         ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from feedback where coursename=? && instructor_name=?");
       ps.setString(1,b.getCoursename());
       ps.setString(2, b.getName());
       rs=ps.executeQuery();
       }
       catch(Exception e){
           System.out.print(e);
       }
       return rs;
    }
    
    public static ResultSet AllFeedback(bean b){
         ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from feedback");
       rs=ps.executeQuery();
       }
       catch(Exception e){
           System.out.print(e);
       }
       return rs;
    }
    
      public static ResultSet GivenFeedback(bean b){
         ResultSet rs=null;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from feedback where student_email=?");
       ps.setString(1, b.getEmail());
       rs=ps.executeQuery();
       }
       catch(Exception e){
           System.out.print(e);
       }
       return rs;
    }
    
    
    public static boolean DeleteCourseFeedback(bean b){
       boolean val=false;
       int rowCount=0;
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("delete from feedback WHERE coursename=? && instructor_name=?");
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
    
    
     public static int UpdatingStudentProfile(bean b){
        int rowCount=0;
    try {
       Connection connection =connectionFactory.getconnection();
        String query = "UPDATE students SET student_name=?,student_mobile=?,student_email=?,student_gender=?,student_dob=?,upload_image=? WHERE student_email='"+b.getEmail()+"'";
       PreparedStatement ps= connection.prepareStatement(query);
       ps.setString(1, b.getName());
       ps.setString(2, b.getMobile());
       ps.setString(3, b.getEmail());
       ps.setString(4, b.getGender());
       ps.setString(5, b.getDob());
       if(b.getBlob().length()==0){
           ResultSet rs=studentDao.Getter(b);
           if(rs.next()){
           b.setBlob(rs.getBlob("upload_image"));
           }
       }
       ps.setBlob(6, b.getBlob());
       
        rowCount=ps.executeUpdate();
       
    } catch (Exception e) {
        e.printStackTrace();
    } 
    return rowCount;
     }
     
     
     public static ResultSet SearchCourses(bean b){
       ResultSet rs=null;String status="Accepted";
       try{
       Connection con=connectionFactory.getconnection();
       PreparedStatement ps=con.prepareStatement("Select * from courses WHERE status=? && coursename=?");
       ps.setString(1, status);
       ps.setString(2, b.getCoursename());
      rs=ps.executeQuery();
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return rs;
   }
     
    
}

package com.codebook.Connections;
import java.sql.*;
import java.util.*;
public class bean {
  private String name,mobile,email,gender,dob,password,confirm_password,specialization,experience,image,coursename,category,url,coursefee,duration,feedback,rating;
  private String question,answer;
  private Blob pic,resume;
   LinkedList<String> list=null;
   private HashMap<String, LinkedList<String>> options;
  public void setName(String name)
   {
       this.name=name;
   }
   public String getName()
   {
             return name; 
   }
   public void setMobile(String mobile)
   {
       this.mobile=mobile;
   }
   public String getMobile()
   {
             return mobile; 
   }
    public void setEmail(String email)
   {
       this.email=email;
   }
   public String getEmail()
   {
             return email; 
   }
   public void setSpecialization(String specialization)
   {
       this.specialization=specialization;
   }
   public String getSpecialization()
   {
       return specialization;
   }
   public void setExperience(String experience)
   {
       this.experience=experience;
   }
   public String getExperience()
   {
       return experience;
   }
   public void setGender(String gender)
   {
       this.gender=gender;
   }
   public String getGender()
   {
             return gender; 
   }
   public void setDob(String dob)
   {
       this.dob=dob;
   }
   public String getDob()
   {
             return dob; 
   }
   public void setPassword(String password)
   {
       this.password=password;
   }
   public String getPassword()
   {
             return password; 
   }
   public String getConfirmPassword()
   {
             return confirm_password; 
   }
   public void setConfirmPassword(String confirm_password)
   {
       this.confirm_password=confirm_password;
   }
   public void setImage(String image)
   {
       this.image=image;
   }
   public String getImage()
   {
             return image; 
   }
   public void setBlob(Blob pic)
   {
       this.pic=pic;
   }
   public Blob getBlob()
   {
             return pic; 
   }
   public void setBlobResume(Blob resume)
   {
       this.resume=resume;
   }
   public Blob getBlobResume()
   {
             return resume; 
   }
 
   public void setCoursename(String coursename)
   {
       this.coursename=coursename;
   }
   public String getCoursename()
   {
             return coursename; 
   }
   public void setCategory(String category)
   {
       this.category=category;
   }
   public String getCategory()
   {
             return category; 
   }
   public void setUrl(String url)
   {
       this.url=url;
   }
   public String getUrl()
   {
             return url; 
   }
   public void setCoursefee(String coursefee)
   {
       this.coursefee=coursefee;
   }
   public String getCoursefee()
   {
             return coursefee; 
   }
   public void setDuration(String duration)
   {
       this.duration=duration;
   }
   public String getDuration()
   {
             return duration; 
   }
   public void setFeedback(String feedback)
   {
       this.feedback=feedback;
   }
   public String getFeedback()
   {
             return feedback; 
   }
   public void setRating(String rating)
   {
       this.rating=rating;
   }
   public String getRating()
   {
             return rating; 
   }
     public void setQuestion(String question)
   {
       this.question=question;
   }
   public String getQuestion()
   {
             return question; 
   }
     public void setAnswer(String answer)
   {
       this.answer=answer;
   }
   public String getAnswer()
   {
             return answer; 
   }
   public void setList(LinkedList<String> list)
   {
       this.list=list;
   }
   public LinkedList<String> getList()
   {
             return list; 
   }
   
    public HashMap<String, LinkedList<String>> getOptions() {
    return options;
    }

    public void setOptions(HashMap<String, LinkedList<String>> options) {
    this.options = options;
    }

}

    
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.Properties"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>Form Submission</title>
</head>
<body>
     
    <%
    

    try {
      

        String name = request.getParameter("name");
        String email=request.getParameter("email");
       
        String messsage = request.getParameter("message");
        String subject = request.getParameter("subject");
        
           String fromemail = "projects@codebook.in";
            final String ToEmail = "projects@codebook.in";
          final String senderPassword = "frwqvhawrnsxetyk"; 


            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.ssl.protocols", "TLSv1.2");

            Session esession = Session.getInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(ToEmail, senderPassword);
                }
            });

            MimeMessage message = new MimeMessage(esession);
            message.setFrom(new InternetAddress(fromemail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(ToEmail));
            message.setSubject("Contact Query");
           message.setText("Name: " + name + "\n"
               + "Email: " + email + "\n"
               + "Message: " + messsage + "\n"
               + "Subject: " + subject);

            Transport.send(message);

            session.setAttribute("success", "Email sent Successfully");
            response.sendRedirect("contact.jsp");
      
        
    } catch (Exception e) {
        out.println("Exception: " + e.getMessage());
    }
    %>
</body>
</html>
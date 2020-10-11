package com.login;


import java.io.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
/**
 *
 * @author TARUN SHARMA
 */
public class send {
    public static void send(String to, String sub ,String mess){
        Properties props = new Properties();
        
         props.put("mail.smtp.auth", "true");
          props.put("mail.smtp.starttls.enable", "true");
          props.put("mail.smtp.host", "smtp.gmail.com");
        // below mentioned mail.smtp.port is optional 
        props.put("mail.smtp.port", "587");		
       
       String user ="yormail@example.com";
       String pass = "yourpassword";
       
        Session session = Session.getInstance(props,new javax.mail.Authenticator()
        {
            protected PasswordAuthentication getPasswordAuthentication()
            {
  	 	         return new PasswordAuthentication(user,pass); 
            }
        });
        try {
 
     	      /*  Create an instance of MimeMessage, 
     	          it accept MIME types and headers 
     	      */
     
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.setRecipient(Message.RecipientType.TO,new InternetAddress(to));
            message.setSubject(sub);
            message.setText(mess);
     
            /* Transport class is used to deliver the message to the recipients */
           
            Transport.send(message);
        }
        catch(Exception e) {
    	     e.printStackTrace();
        }
    }
    
}

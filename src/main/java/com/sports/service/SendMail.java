package com.sports.service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
 
public class SendMail {
 
       public synchronized void sendMails(String toEmail, String subject,  String msg) {
 
    	   final String fromEmail = "phillipjordan316@gmail.com";
           final String password = "chynise07";

           Properties props = new Properties();
           props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
           props.put("mail.smtp.port", "587"); //TLS Port
           props.put("mail.smtp.auth", "true"); //enable authentication
           props.put("mail.smtp.starttls.enable", "true"); 
 
               Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                           protected PasswordAuthentication getPasswordAuthentication() {
                               return new PasswordAuthentication(fromEmail,password);
                           }
                       });
 
               try {
 
                   Message message = new MimeMessage(session);
                   message.setFrom(new InternetAddress(fromEmail));
                   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(toEmail));
                   message.setSubject(subject);
                   message.setText(msg);
 
                   Transport.send(message);
 
                   System.out.println("Mail sent succesfully!");
 
               } catch (MessagingException e) {
                   throw new RuntimeException(e);
               }
               notifyAll();  
           }
       }
 
package com.gamewarrior.Game.Warrior.service;

import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

@Service
public class EmailImpl implements Email{
    private final String EMAIL ="sinchanuhara@gmail.com";
    private final String PASSWORD = "hupnxhjihdsuihpp";
    private final Integer OTPLENGTH =6;

    @Override
    public String sendEmail(String to, String subject, String message) throws MessagingException {
        //host
        String host = "smtp.gmail.com";

        //get the system properties
        Properties properties = System.getProperties();

        //host set
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        Session session=Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL, PASSWORD);
            }
        });

        session.setDebug(true);

        MimeMessage mimeMessage = new MimeMessage(session);


        mimeMessage.setFrom(EMAIL);
        mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(message);
        Transport.send(mimeMessage);

        System.out.println("Email sent....");

        return message;
    }

    @Override
    public String sendOtpEmail(String email) throws MessagingException {
        String subject = "Validation Otp";
        String otp = generateOtp();
        String message = "Your verification code is "+otp+"\nThis otp is valid for 10 minutes only.";

        return sendEmail(email, subject, message);
    }

    @Override
    public String sendGreetingEmail(String email) throws MessagingException {
        String subject = "Greeting! Verified Successfully";
        String message = "Hi user!, \nYour email id "+email+" is successfully verified. Now you can login.";

        return sendEmail(email, subject, message);
    }

    private String generateOtp(){
        StringBuilder stringOtp = new StringBuilder("");
        Random random = new Random();

        for(int i=0; i<OTPLENGTH; i++){
            stringOtp.append(random.nextInt(10));
        }
        return stringOtp.toString();
    }
}

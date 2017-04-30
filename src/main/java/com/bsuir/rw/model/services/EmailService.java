package com.bsuir.rw.model.services;

import com.bsuir.rw.model.domain.Tickets;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;

/**
 * Created by USER on 18.04.2017.
 */
public class EmailService {
    static final String ENCODING = "UTF-8";

    public void sendMultiEmail(String subject, String emailTo,Tickets ob) {
        String attachment = "d:/"+ob.getTicketNumber()+".pdf";
        Properties emailSettings = getEmailSettings();

        String fromEmail = emailSettings.getProperty("mail.from");
        final String user = emailSettings.getProperty("mail.user");
        final String password = emailSettings.getProperty("mail.password");

        // Get the default Mail Session object.
        Session mailSession = Session.getDefaultInstance(emailSettings, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            Message message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
            message.setSubject(subject);


            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent("К письму прикреплены электронные проездные документы (билеты) Вашего заказа в формате PDF.",
                    "text/plain; charset="+ENCODING+"");
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);

            MimeBodyPart attachmentBodyPart = new MimeBodyPart();
            DataSource source = new FileDataSource(attachment);
            attachmentBodyPart.setDataHandler(new DataHandler(source));
            try {
                attachmentBodyPart.setFileName(MimeUtility.encodeText(source.getName()));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            multipart.addBodyPart(attachmentBodyPart);

            message.setContent(multipart);

            // Send Email
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }


    public void sendEmail(String emailTo,String subject,String body) {
        String attachment = "d:/ITextTest.pdf";
        Properties emailSettings = getEmailSettings();

        String fromEmail = emailSettings.getProperty("mail.from");
        final String user = emailSettings.getProperty("mail.user");
        final String password = emailSettings.getProperty("mail.password");

        // Get the default Mail Session object.
        Session mailSession = Session.getDefaultInstance(emailSettings, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            Message message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
            message.setSubject(subject);
            message.setText(body);

            // Send Email
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private Properties getEmailSettings() {
     /*   ResourceBundle bundle=null;
        bundle = ResourceBundle.getBundle("email");*/

        InputStream stream = null;

        String emailSettingsPath = "settings/email.properties";
        stream = Thread.currentThread().getContextClassLoader().getResourceAsStream(emailSettingsPath);

        Properties emailSettings = new Properties();
        try {
            emailSettings.load(stream);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                stream.close();
            } catch (IOException e) {
            }
        }

        return emailSettings;
    }
}

package com.bsuir.rw.model.services;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Created by USER on 18.04.2017.
 */
public class EmailService {
    public void sendEmail(String emailTo, String subject, String body) {
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

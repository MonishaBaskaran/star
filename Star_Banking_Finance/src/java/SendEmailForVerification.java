import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmailForVerification {
    //generating verfication 6-digit code 
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
    public boolean sendEmail(registeredUser user) {
        boolean test = false;

        //sending email to registered user
        String toEmail = user.getEmail();
        String fromEmail = "monisha610baskar@gmail.com";
        String password = "bicmgepahugivjgs";

        try {

            // your host email smtp server details
            Properties pr = new Properties();
               pr.put("mail.smtp.auth", "true");
              pr.put("mail.smtp.starttls.enable", "true");
              pr.put("mail.smtp.host", "smtp.gmail.com");
              pr.put("mail.smtp.port", "587");
 
            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            //set email message details
            Message mess = new MimeMessage(session);

    		//set from email address
            mess.setFrom(new InternetAddress(fromEmail));
    		//set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
    		
    		//set email subject
            mess.setSubject("User Email Verification");
            
    		//set message text
            mess.setText("Registered successfully.Please verify your account using this code: " + user.getCode());
            //send the message
            Transport.send(mess);
            
            test=true;
            
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

        return test;
    }
}

    


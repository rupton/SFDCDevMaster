public with sharing class EmailManager {
	
    public static void sendMail(String address, String subject, String message){
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        email.setSubject(subject);
        email.setToAddresses(toAddresses);
        email.setPlainTextBody(message);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    }
}
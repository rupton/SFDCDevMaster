public class TwilioSMSGen1{
    String account = 'ACf0e68c0cae9130ac43b54c343774e3af';
    String token = '1908701c5f7453306956090e05e97a56';
    
    public void sendSMS(String message, String numberTo){
        TwilioRestClient client = new TwilioRestClient(account, token);       
        Map<String,String> params = new Map<String,String> {
                'To'   => numberTo,
                'From' => '+15403223169',
                'Body' => message
            };
        TwilioSMS sms = client.getAccount().getSMSMessages().create(params);
    }
}
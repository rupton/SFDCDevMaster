@RestResource(urlMapping='/Account/*')
global class AccountManager {
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        
        return [SELECT Id, Name,
               	(SELECT Id, Name FROM Contacts)
                FROM Account
                WHERE Account.id=:accountId
               ];
    }

}
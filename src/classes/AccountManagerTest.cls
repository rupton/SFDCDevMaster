@isTest
public class AccountManagerTest {
	
    public static List<Account> testAccounts;
    

    public static Account createAccount(){
        Account acct = new Account(name='Test1');
        insert acct;
        return acct;
    }
    @isTest
    public static void testAccountManager(){
        Account mAccount = createAccount();
        System.debug('** Account Manager Test ** ' + mAccount.Id);
        Id accountId = mAccount.Id;
        RestRequest recrequest = new RestRequest();
        recrequest.requestURI='https://nyccct-dev-ed.my.salesforce.com/services/apexrest/Account/' +
            accountId;
        recRequest.httpMethod = 'GET';
        RestContext.request = recrequest;
        Account retAccount = AccountManager.getAccount();
        System.assertEquals(accountId, retAccount.Id);
    }
}
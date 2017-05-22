@IsTest
public class AccountProcessorTest {

    @IsTest
    public static void testAccountProcessorService(){
        List<Id> testIds = new List<Id>();
        for(Integer i = 0; i < 10; i++){
            Account acct = new Account(name='TestAccount ' + i);
            insert acct;
            Contact contact = new Contact(Firstname='Test', LastName='Contact ' + i);
            contact.AccountId=acct.Id;
            insert contact;
            testIds.add(Id.valueOf(acct.Id));
        }
		Test.setMock(HttpCalloutMock.class, new AccountProcessorMock());
        Test.startTest();
        	AccountProcessor.countContacts(testIds);
        Test.stopTest();
    }
}
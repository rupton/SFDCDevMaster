@isTest
public class AddPrimaryContactTest {

    @isTest
    public static void testAddPrimaryContact(){
        List<Account>insertedCAAccounts = new List<Account>();
        List<Account>insertedNYAccounts = new List<Account>();
        for(Integer stateCount = 0; stateCount<50; stateCount++){
            Account testAccount = new Account(name='TestCA ' + stateCount, BillingState='CA');
            insertedCAAccounts.add(testAccount);
        }
        for(Integer stateCount = 0; stateCount<50; stateCount++){
            Account testAccount = new Account(name='TestNY ' + stateCount, BillingState='NY');
            insertedCAAccounts.add(testAccount);
        }
        insert insertedCAAccounts;
        insert insertedNYAccounts;
        Contact testContactCA = new Contact(FirstName='Test', LastName='ContactCA', Languages__c='English');
        Contact testContactNY = new Contact(FirstName='Test', LastName='ContactNY', Languages__c='English');
        insert testContactCA;
        insert testContactNY;
        AddPrimaryContact primaryContactCA = new AddPrimaryContact(testContactCA, 'CA');
        AddPrimaryContact primaryContactNY = new AddPrimaryContact(testContactNY, 'NY');
        Test.startTest();
            System.enqueueJob(primaryContactCA);
        	System.enqueueJob(primaryContactNY);
        Test.stopTest();
        List<Account> changedAccountsCA = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account 
                                          WHERE BillingState='CA'];
        System.debug('** AddPrimaryContactTest.apxc ** Changed Accounts CA Size= ' + changedAccountsCA.size());
        for(Account changedAccountCA: changedAccountsCA){
        	List<Contact> assignedContactsCA = changedAccountCA.Contacts;
        	System.debug('** AddPrimaryContactTest.apxc ** Changed Contacts CA Size= ' + assignedContactsCA.size());
            System.assert(assignedContactsCA.size()>0);
        }
        List<Account> changedAccountsNY = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account 
                                          WHERE BillingState='NY'];
		System.debug('** AddPrimaryContactTest.apxc ** Changed Accounts NY Size= ' + changedAccountsNY.size());
        for(Account changedAccountNY: changedAccountsNY){
        	List<Contact> assignedContactsNY = changedAccountNY.Contacts;
        	System.debug('** AddPrimaryContactTest.apxc ** Changed Contacts NY Size= ' + assignedContactsNY.size());
            System.assert(assignedContactsNY.size()>0);
        }
        
    }
}
/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest(SeeAllData=true)
private class TestArchiveAccountSerializer {

    static testMethod void testSingleSerialization() {
		String queryBase = 'SELECT ';
		String queryString ='';
		String queryTail = ' FROM ACCOUNT LIMIT 1';
		String finalQuery = '';
        Account mAccount = new Account(name='myTestAccount');
       	Schema.DescribeSObjectResult result = mAccount.getSObjectType().getDescribe();
       	Map<String, SObjectField> fResults = result.fields.getMap();
       	//build dynamic query string
       	for(String s : fResults.keySet()){
       		SObjectField field = fResults.get(s);
       		Schema.DescribeFieldResult res = field.getDescribe();
       		System.debug('Field name: ' + res.getName());
       		queryString += res.getName() +',';
       	}
       finalQuery = queryBase + queryString.substring(0,queryString.length()-1)+ queryTail;
       System.debug(finalQuery);
       
       List<Account> mAccounts = Database.query(finalQuery);
       //convert to JSON
       String resultJSON = JSON.serializePretty(mAccounts,false);
       System.debug(resultJSON);
    }
    
    static testMethod void testAllSerialization(){
    	String queryBase = 'SELECT ';
		String queryString ='';
		String queryTail = ' FROM ACCOUNT';
		String finalQuery = '';
        Account mAccount = new Account(name='myTestAccount');
       	Schema.DescribeSObjectResult result = mAccount.getSObjectType().getDescribe();
       	Map<String, SObjectField> fResults = result.fields.getMap();
       	//build dynamic query string
       	for(String s : fResults.keySet()){
       		SObjectField field = fResults.get(s);
       		Schema.DescribeFieldResult res = field.getDescribe();
       		System.debug('Field name: ' + res.getName());
       		queryString += res.getName() +',';
       	}
       finalQuery = queryBase + queryString.substring(0,queryString.length()-1)+ queryTail;
       System.debug(finalQuery);
       
       List<Account> mAccounts = Database.query(finalQuery);
       //convert to JSON
       String resultJSON = JSON.serializePretty(mAccounts,false);
       System.debug(resultJSON);
    	
    }
}
@isTest
public class RandomScreenListTest{
	public static testMethod void testRandomRest(){
        // create and insert a test flight
        Flight__c flight = new Flight__c();
        flight.Flight_Date__c = Date.today();
        flight.Flight_Number__c = 99;
        flight.Total_Passengers__c = 149;
       	insert flight;
        
        RestRequest req = new RestRequest();
        // change this for your instance
        req.requestURI = 'https:/na15.salesforce.com/services/apexrest/screeninglist/';
    	// build the request
        req.httpMethod = 'GET';
        req.addParameter('flightNumber', '99');
        req.addParameter('date', '7/10/2013');
        req.addParameter('rands', '5');
        RestContext.request = req;       
        System.debug('Preparing the call');
        Test.startTest();
        	List<Integer> testList = RandomScreeningList.getRandomList();
        Test.stopTest();
        System.assert(testList.size()==5);
        for(Integer i =0; i < 5; i++){
            //assert no rand is greater than limit determined by Flight__c.Total_Passengers__c
            System.assert(testList[i] < 149);
        }
    }
}
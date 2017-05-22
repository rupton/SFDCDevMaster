@RestResource(urlMapping='/screeninglist/*')
global class RandomScreeningList{
	@HttpGet
        global static List<Integer> getRandomList(){
        	//define list of selected passengers
            List<Integer>selected = new List<Integer>();
            RestRequest request = RestContext.request;
            Map<String, String>params = request.params;
            Decimal flightNumber = Decimal.valueOf(params.get('flightNumber'));
            Date flightDate = Date.parse(params.get('date'));
            Integer numberOfRands = Integer.valueOf(params.get('rands'));
            System.debug('Number: ' + flightNumber + ' Date: ' + flightDate + ' Rands: '+ numberOfRands);
            Flight__c flight = [Select Flight_Number__c, Flight_Date__c, Total_Passengers__c FROM Flight__c
                               where Flight_Number__c= :flightNumber];
  
            if(flight != null){
            	Integer upperLimit = Integer.valueOf(flight.Total_Passengers__c);
                System.debug(upperLimit);
				selected = new RandomScreen().randomWithLimit(upperLimit,numberOfRands);
            }
        	return selected;
        }
}
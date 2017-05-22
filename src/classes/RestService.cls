@RestResource(urlMapping='/myservice/*')
global class RestService{

    @HttpGet
        global static List<Merchandise__c> getMerchandiseByDescription(){        	
            RestRequest request = RestContext.request;
            Map<String, String>params = request.params;
            String searchString = params.get('searchString');
            searchString = '%'+ searchString +'%';
            List<Merchandise__c> matched = [select name, description__c, quantity__c from Merchandise__c where name like :searchString];
       	
            return matched;
        }
}
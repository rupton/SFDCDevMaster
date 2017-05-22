@RestResource(urlmapping='/resttest1/*')
global class APEXRestTest1{
	@HttpGet
    global static List<Merchandise__c> getMerchandiseByName(){
    	System.RestRequest req = RestContext.request;
        Map<String, String>params = req.params;
        String searchString = params.get('searchString');
        searchString= '%'+searchString+'%';
        List<Merchandise__c>merch = [select name, description__c, quantity__c from Merchandise__c where name like :searchString];
        return merch;
    }

}
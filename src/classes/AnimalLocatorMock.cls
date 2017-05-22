global class AnimalLocatorMock implements HttpCalloutMock{
    global HttpResponse respond(HTTPRequest request){
        
        HttpResponse response =  new HttpResponse();
        response.setStatus('200');
        response.setBody('{\"animal\":{\"id\":0,\"name\":\"\",\"eats\":\"\",\"says\":\"\"}}');
        return response;
    }
}
global class AccountProcessorMock implements HttpCalloutMock{
	
    global HttpResponse respond(HttpRequest req){
        HttpResponse res = new HttpResponse();
        res.setHeader('content-type', 'application/json');
        res.setBody('{"Status":"Success"}');
        res.setStatusCode(200);
        return res;
    }
}
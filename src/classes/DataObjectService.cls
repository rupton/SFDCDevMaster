public class DataObjectService {
  
    public static final String BASESERVICEENDPOINT = 'https://blooming-anchorage-1503.herokuapp.com'; //upgrade to custom setting

  public static String updateObject(String jsonString){
    System.debug('*****json passed in ' + jsonString);
    Http connection = new Http();    
    HttpRequest req = new HttpRequest();
        req.setEndpoint(BASESERVICEENDPOINT + '/api/v1/echoobject');
    req.setMethod('POST');
    req.setHeader('Content-Type','application/json');
    req.setBody(jsonString);
    HttpResponse response = connection.send(req);
    System.debug(response.getBody());
    return response.getBody();  
  }

  public static String selectObjects(){
    Http connection = new Http();    
    HttpRequest req = new HttpRequest();
        req.setEndpoint(BASESERVICEENDPOINT + '/api/v1/echoobject');
    req.setMethod('GET');
    HttpResponse response = connection.send(req);
    System.debug(response.getBody());
    return response.getBody();  
  }

  public static String updateObjectById(String jsonString, String Id){
    System.debug('*****json passed in ' + jsonString);
    Http connection = new Http();    
    HttpRequest req = new HttpRequest();
        req.setEndpoint(BASESERVICEENDPOINT + '/api/v1/echoobject/' + Id);
    req.setMethod('POST');
    req.setHeader('Content-Type','application/json');
    req.setBody(jsonString);
    HttpResponse response = connection.send(req);
    System.debug(response.getBody());
    return response.getBody();  
  }

    public static String createObject(String jsonString){
    System.debug('*****json passed in ' + jsonString);
    Http connection = new Http();    
    HttpRequest req = new HttpRequest();
        req.setEndpoint(BASESERVICEENDPOINT + '/api/v1/echoobject/');
    req.setMethod('POST');
    req.setHeader('Content-Type','application/json');
    req.setBody(jsonString);
    HttpResponse response = connection.send(req);
    System.debug(response.getBody());
    return response.getBody();  
  }
    
  public static Integer deleteObject(String Id){
    Http connection = new Http();    
    HttpRequest req = new HttpRequest();
        req.setEndpoint(BASESERVICEENDPOINT + '/api/v1/deleteobject/' + Id);
    req.setMethod('POST');
    req.setHeader('Content-Type','application/json');
    HttpResponse response = connection.send(req);
    System.debug(response.getBody());
    return 200;  
  }

  public static String returnOrder(String jsonString){
    System.debug('*****json passed in ' + jsonString);
    Http connection = new Http();    
    HttpRequest req = new HttpRequest();
        req.setEndpoint(BASESERVICEENDPOINT + '/api/v1/returnitem');
    req.setMethod('POST');
    req.setHeader('Content-Type','application/json');
    req.setBody(jsonString);
    HttpResponse response = connection.send(req);
    System.debug(response.getBody());
    return response.getBody();  
  }

  public static String checkWarranty(String jsonString){
    System.debug('*****json passed in ' + jsonString);
    Http connection = new Http();    
    HttpRequest req = new HttpRequest();
        req.setEndpoint(BASESERVICEENDPOINT + '/api/v1/checkwarranty');
    req.setMethod('POST');
    req.setHeader('Content-Type','application/json');
    req.setBody(jsonString);
    HttpResponse response = connection.send(req);
    System.debug(response.getBody());
    return response.getBody();  
  }
}
public class GeoGet{
    
    HttpResponse res;
    HttpRequest req;
    Map<String, Double>coords = new Map<String, Double>();

    @future(callout=true)
    public static void getAsyncGeoCoord(ID id){
        System.debug('Passed in ID: ' + id);
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        Volunteer_Opportunity__c event = [select Id, Address__c, City__c,state__c,Location__Latitude__s, Location__Longitude__s from Volunteer_Opportunity__c where Id =: id ];
        String parms = EncodingUtil.urlEncode(event.Address__c+','+ event.City__c +',' + event.State__c, 'UTF-8');
        req.setEndpoint('http://maps.google.com/maps/api/geocode/json?address=' + parms + '&sensor=true');
        Http http = new Http();
        HttpResponse res = http.send(req);
        GResponse jsonResponse = (GResponse) JSON.deserialize(res.getBody(), GeoGet.GResponse.class);
        if(jsonResponse.status == 'OK'){
            LatLng latLong = jsonResponse.results[0].geometry.location;                       
            event.Location__Latitude__s = latLong.lat;
            event.Location__Longitude__s = latLong.lng;
            update event;
        }
    }   
    public class GResponse{
        public String status;
        public AddressComponents[] results;
    }
    public class AddressComponents{
        public String formatted_address;
        public GGeometry geometry;
    }
    public class GGeometry {
    public LatLng location;
}
    public class LatLng{
        public Double lat, lng;
    }
}
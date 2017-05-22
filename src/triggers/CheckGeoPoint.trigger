trigger CheckGeoPoint on Volunteer_Opportunity__c (after insert, after update) {
    
    for (Volunteer_Opportunity__c opp : Trigger.new){
        if(opp.Location__Latitude__s == null || opp.Location__Longitude__s == null){
            GeoGet.getAsyncGeoCoord(opp.id);
        }
    }
}
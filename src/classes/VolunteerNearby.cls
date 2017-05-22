global with sharing class VolunteerNearby {

    public VolunteerNearby() { 
        // empty constructor
    } 
    
    @RemoteAction
    global static List<Volunteer_Opportunity__c> findNearby(String city) {
       // List<Case> cases = [Select Id, Case_Address__c from Case where Case_City__c = :city limit 10];
        List<Volunteer_Opportunity__c> opps = [select Id, address__c, city__c from Volunteer_Opportunity__c where city__c  = :city];
        System.debug('Size of matched Volunteer_Opportunity__c: ' + opps.size());
        return opps;
    }
}
trigger SendConfirmationEmail on Session_Speaker__c (after insert) {
	List<ID> speakerIds = new List<ID>();
    for(Session_Speaker__c speaker : trigger.new){
        speakerIds.add(speaker.id);
    }
    
    List<Session_Speaker__c> sessionSpeakers = [
        SELECT
        	Session__r.Name,
        	Session__r.Session_Date__c,
        	Speaker__r.First_Name__c,
        	Speaker__r.Last_Name__c,
        	Speaker__r.email__c
        FROM Session_Speaker__c where ID in :speakerIds
    ];
    
    for(Session_Speaker__c s: sessionSpeakers){
        if(s.speaker__r.email__c !=null){
            String message = 'You have been registered for the following session \n' +
                s.Session__c + ' : ' + s.session__r.Name;
            EmailManager.sendMail(s.speaker__r.email__c, 'New Speaking Assignment', message);
        }
    }
}
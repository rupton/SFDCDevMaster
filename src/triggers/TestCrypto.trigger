trigger TestCrypto on Volunteer_Opportunity__c (before insert, before update) {
    for(Volunteer_Opportunity__c opp: Trigger.new){
        Blob key = Crypto.generateAesKey(128);
     	Blob cypher = Crypto.encryptWithManagedIV('AES128', key, Blob.valueOf(opp.Description__c));  
        opp.EncyptedValue__c = EncodingUtil.base64Encode(cypher);
        List<Attachment>attachments = opp.attachments;
        System.debug('You have ' + attachments.size());
    }
}
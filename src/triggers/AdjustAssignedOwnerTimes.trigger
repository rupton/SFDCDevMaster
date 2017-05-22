trigger AdjustAssignedOwnerTimes on Case (after insert, after update) {
    System.debug('Starting Trigger');
    List<Case_Owner__c> ownerList = new List<Case_Owner__c>();
    if(trigger.isAfter){
        for(Case c: trigger.new){
            //create related Case_Owner__c
            Case_Owner__c cOwner = new Case_Owner__c();
            cOwner.Assigned_To__c = c.OwnerId;
            cOwner.Assigned_Date__c = Date.today();
            System.debug('Case ID: ' + c.Id);
            cOwner.Case__c = c.Id;
            ownerList.add(cOwner);
        }
        System.debug('ownerList size: ' + ownerList.size());
        try{
            insert ownerList;
        }catch(Exception e){
            System.debug(e);
        }
    }else if(Trigger.isUpdate){
        Map<Id,Case_Owner__c>updateMap = new Map<Id,Case_Owner__c>([SELECT Id, Case__c, Assigned_To__c, Assigned_Date__c, Reassigned_Date__c from Case_Owner__c where Case__c in: Trigger.oldMap.keySet()]);
        //the only other option is after update
        for(Case_Owner__c cOwner: updateMap.values()){
            Case mCase = Trigger.oldMap.get(cOwner.case__c);
            if(cOwner.Assigned_To__c != mCase.ownerId){
                System.debug('The assignee has changed');
            }
        }
    }
}
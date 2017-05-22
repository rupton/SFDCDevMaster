trigger DeleteUnknownCaseTrigger on Case (after update) {
   
    List<Case> lstCaseToDelete = new List<Case>();
    for(Case c : trigger.new) {
        if(c.QUEUE_UNKNOWN_DELETE__c == TRUE){
            Case cDel = new Case(Id=c.Id);
            lstCaseToDelete.add(cDel);
        }
    }
    delete lstCaseToDelete;
}
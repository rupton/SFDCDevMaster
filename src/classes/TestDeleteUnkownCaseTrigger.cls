@isTest
public class TestDeleteUnkownCaseTrigger{
    static testMethod void validateTrigger() {
        Date myDate = date.newInstance(2013, 6, 1);
        
        Case c = new Case(
        OwnerId = '00Gi00000013ZRbEAM',
        Status = 'New',
        Subject = 'Test Case',
        Description = 'Case Description'
        );
        c.Estimated_Complete_Date__c = myDate;
        System.debug(c.Estimated_Complete_Date__c);
        System.debug(c.OwnerId);
        System.debug(c.QUEUE_UNKNOWN_DELETE__c);
        insert c;
     }
}
@isTest
public class TestRejectDoubleBooking {

    static testmethod void TestSingleBooking(){
        Datetime now = System.now();
        Speaker__c speaker = new Speaker__c(first_name__c='John', last_name__c='Smith');
        insert speaker;
        
        Session__c session = new Session__c(Name='Some Session', Session_Date__c=now);
        insert session;
        
        Session_Speaker__c assignment = new Session_Speaker__c(session__c=session.id, speaker__c=speaker.id);
        
		Database.SaveResult result = Database.insert(assignment);
        System.assert(result.isSuccess());
    }
    static testmethod void TestDoubleBooking(){
        Datetime now = System.now();
        List<Session_Speaker__c> testSessions = new List<Session_Speaker__c>();
        Speaker__c speaker = new Speaker__c(first_name__c='John', last_name__c='Smith');
        insert speaker;
        
        Session__c session1 = new Session__c(Name='Some Session', Session_Date__c=now);
        insert session1;
        Session__c session2 = new Session__c(Name='Conflict Session', Session_Date__c=now);
        insert session2;
        
        Session_Speaker__c assignment1 = new Session_Speaker__c(session__c=session1.id, speaker__c=speaker.id);
        insert assignment1;
        Session_Speaker__c assignment2 = new Session_Speaker__c(session__c=session2.id, speaker__c=speaker.id);
        //testSessions.add(assignment1);
       // testSessions.add(assignment2);
        System.assertEquals(session1.Session_Date__c, session2.Session_Date__c);
        //System.assert(testSessions.size() == 2);
        Database.SaveResult result = Database.insert(assignment2);
        //system.assertEquals(assignment1.id, assignment2.id);
        //for(Database.SaveResult result: results){
            System.assert(result.isSuccess());
       // }
        
    }
}
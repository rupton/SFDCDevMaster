@isTest
public class LeadProcessorTest {

    @testSetup
    static void setup(){
        List<Lead> testLeads = new List<Lead>();
        for(Integer i = 0; i < 200; i++){
            Lead mLead = new Lead(FirstName='Test', LastName='Lead ' + i);
            mLead.LeadSource = 'Web';
            mLead.Company ='Test Corp USA';
            testLeads.add(mLead);
        }
        insert testLeads;
    }
    
    static testmethod void testBatch(){
        Test.startTest();
         LeadProcessor proc = new LeadProcessor();
         Id batchId = Database.executeBatch(proc);
        Test.stopTest();
        //assert test results
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource='Dreamforce']);
    }
}
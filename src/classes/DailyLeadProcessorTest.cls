@isTest
public class DailyLeadProcessorTest{
	@testSetup
    public static void setup(){
        List<Lead> leadsToAdd = new List<Lead>();
        for(Integer leadAddCount = 0; leadAddCount < 200; leadAddCount++){
            Lead leadToAdd = new Lead(LastName='TestLead' + leadAddCount, Company='Test Co', Status='Open - Not Contacted');
            leadsToAdd.add(leadToAdd);
        }
        insert leadsToAdd;
    }
    
    @isTest
    public static void testDailyLeadProcessor(){
        Test.startTest();
        String jobId = System.schedule('Daily Lead Processor', '0 0 0 15 3 ? 2022', new DailyLeadProcessor());
        Test.stopTest();
    }
}
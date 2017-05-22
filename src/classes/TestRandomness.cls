@isTest
public class TestRandomness{
	
    private static ApexRandomNumberExample randGen = new ApexRandomNumberExample();
   
    public static testMethod void testRandomList(){
	    List<Integer> testResults = randGen.randomWithLimit(139, 15);
        System.assertEquals(testResults.size(), 15);
        for(Integer i: testResults){
            System.assert(i < 139);
            System.debug(i);
        }
    }
    
    public static testMethod void testSingleRandom(){
        Integer testResult = randGen.randomWithLimit(234);
        System.assert(testResult < 234);
        System.debug(testResult);
    }
}
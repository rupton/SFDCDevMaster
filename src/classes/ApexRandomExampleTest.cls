@isTest
public class ApexRandomExampleTest{

    public static testMethod void testRandom(){
        ApexRandomNumberExample tester = new ApexRandomNumberExample();
        Integer result1 = tester.randomWithLimit(15);
        System.assert(result1 < 15);
        System.debug(result1);
        
        List<Integer>result2 = tester.randomWithLimit(15, 5);
        System.assertEquals(result2.size(),5);
        for(Integer i : result2){
			System.assert(i < 15);
        }
    }
}
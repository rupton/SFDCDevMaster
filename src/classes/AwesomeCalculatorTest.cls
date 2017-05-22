@isTest
public class AwesomeCalculatorTest {

    public static testMethod void testCallout(){
        Test.setMock(System.WebServiceMock.class, new CalculatorCalloutMock());
        Double x = 1.0;
        Double y = 3.0;
        Double result = AwesomeCalculator.add(x, y);
        System.assertEquals(3.0, result);
    }
}
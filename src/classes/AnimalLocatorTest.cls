@istest
public class AnimalLocatorTest{

    @istest
    public static void testMethod1(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('AnimalStaticMock');
        mock.setStatus('202');
        Test.setMock(HttpCalloutMock.class, mock);
        String response = AnimalLocator.getAnimalNameById(1);
        
    }
    
    @istest
    public static void testMethod2(){

        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String response = AnimalLocator.getAnimalNameById(1);
    }
}
@isTest
private class TestVerifyDate {
	
	

	@isTest static void test_method_one() {
		// Implement test code
		Date date1 = date.newInstance(2017,1,1);
		Date date2 = date.newInstance(2017,1,14);
		Date result = VerifyDate.checkDates(date1, date2);
		system.assertEquals(date2, result);
	}
	
	@isTest static void test_method_two() {
		// Implement test code
		
		Date date1 = date.newInstance(2017,1,1);
		Date date2 = date.newInstance(2017,2,14);
		Date result = VerifyDate.checkDates(date1, date2);
		system.assertNotEquals(date2, result);


	}
	
}
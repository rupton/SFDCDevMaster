@isTest
private class TestRestrictContactByName {
	
	@isTest static void test_method_one() {
		// Implement test code
		Contact cont = new Contact();
		cont.firstname = 'ryan';
		cont.lastname = 'INVALIDNAME';

		test.startTest();

		Database.SaveResult results = Database.insert(cont, false);

		test.stopTest();

		system.assertEquals('" is not allowed for DML', results.getErrors()[0].getMessage());

	}
	
	
	
}
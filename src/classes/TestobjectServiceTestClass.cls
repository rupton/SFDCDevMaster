@isTest
private class TestobjectServiceTestClass {
	
	@isTest static void test_method_one() {
		String requestBody = '{"node1":"value","node2":"value","node3":"value","node4":"value","arrayx":[{"subval":"value"},{"subval":"value"},{"subval":"value"}]}';
		Integer result = TestObjectService.selectAllObjects(requestBody);
		System.debug(result);
	}	
}
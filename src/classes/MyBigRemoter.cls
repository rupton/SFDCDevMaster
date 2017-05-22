global with sharing class MyBigRemoter {
	@RemoteAction
    global static String sayHello(String helloTo) {
        return 'Hello ' + helloTo + ' from the Grandparent.';
    }
    
    global MyBigRemoter(){}
}
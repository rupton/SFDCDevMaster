public with sharing class RandomContactFactory {
	public RandomContactFactory() {
		
	}

	public static List<Contact> generateRandomContacts(Integer i, String s){
		List<Contact> contacts = new List<Contact>();

		//create i number of contacts
		for(integer j = 0; j<i; j++){
			Contact con = new Contact(firstName = 'test'+j,
				lastName = s
				);
			contacts.add(con);
		}
		return contacts;

	}
}
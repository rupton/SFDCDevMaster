global class AccountProcessor {
	@future
    global static void countContacts(List<ID> accountIds){
    	Map<String, Integer> contactRelationMap = new Map<String,Integer>();
        Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Number_of_Contacts__c FROM Account WHERE Id in :accountIds]);
        List<Account> updatedAccounts = new List<Account>();
        List<AggregateResult> contactRelations = [
            SELECT AccountId, count(ContactId)
            FROM AccountContactRelation
            GROUP By AccountId
        ];
        //build the result map
        for( AggregateResult contactRelation : contactRelations){
            Id idVal = (Id)contactRelation.get('AccountId');
            Integer numberOfContacts = (Integer)contactRelation.get('expr0');
            contactRelationMap.put(idVal,numberOfContacts);
        }
        //build the updatedAccountList
        for(Id accountId : accountIds){
            Account mAccount = accountMap.get(accountId);
            mAccount.Number_of_Contacts__c = contactRelationMap.get('numberOfContacts');
            updatedAccounts.add(mAccount);
        }
       //update accounts with Number of Contacts
       update updatedAccounts;
    }
}
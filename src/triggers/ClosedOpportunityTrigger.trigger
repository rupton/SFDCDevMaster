trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

	List<Task> tList = new List<Task>();
	for(Opportunity opp: trigger.new){
		if(opp.stagename =='Closed Won'){
			//system.debug('Closed won found');
			
			Task t = new Task();
			t.subject = 'Follow Up Test Task';
			t.whatId = opp.Id;
			tList.add(t);
		}
	}

	insert tList;
}
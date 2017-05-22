global class ScheduleTest implements Schedulable {
	global void execute(SchedulableContext sc) {
		//MyBatchClass b = new MyBatchClass();
		//database.executebatch(b);
		System.debug('Test Message, schedule class is working properly');
		Task t = new Task();
		t.WhoId = [select Id, name from user where name='Ryan Upton'][0].id;
	}
}
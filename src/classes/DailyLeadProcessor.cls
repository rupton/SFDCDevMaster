global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx){
        List<Lead> dailyLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource='' OR LeadSource = null LIMIT 200];
        System.assert(dailyLeads.size() !=0);
        for(Lead dailyLead : dailyLeads){
            dailyLead.LeadSource='Dreamforce';
            System.debug('** DailyLeadProcessor.apxc ** Lead: ' + dailyLead.Id + ' updated ');
        }
        update dailyLeads;
    }	
}
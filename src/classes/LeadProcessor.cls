global class LeadProcessor implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext ctx){
        return Database.getQueryLocator(
        	'SELECT FirstName, LastName, LeadSource FROM Lead' 
        );
    }      
    global void execute(Database.BatchableContext cts, List<Lead> scope){
        List<Lead> updatedLeads = new List<Lead>();
        for(Lead mLead :scope){
            mLead.Old_Leadsource__c = mLead.LeadSource;
            mLead.LeadSource = 'Dreamforce';
            updatedLeads.add(mLead);
        }
        update updatedLeads;
    }   
    global void finish(Database.BatchableContext ctx){
        AsyncApexJob job = [
            SELECT Id, status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob WHERE id = :ctx.getJobId()
        ];
        String message = 'Your job ' + job.Id + ' has completed \n You ran ' + job.TotalJobItems +
            ' and processed ' + job.JobItemsProcessed +' .\n Job Status: ' + job.Status;
        EmailManager.sendMail('ryanjupton@gmail.com', 'Lead Batch Update', message);
    }

}
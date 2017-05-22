@isTest(SeeAllData=true)
public class TestSomething
{
 static testMethod void testCreateAssetonClosedWon(){
    	System.debug('Alerting on --------> Starting the TestCreateAssetonClosedWon ');
        List<OpportunityLineItem> insertOl = new List<OpportunityLineItem>{};
        Account a = [select Id from Account limit 1];
        System.debug('Alerting on --------> Account a -'+a);
        PricebookEntry pbID = [select Id from PricebookEntry where isactive = true limit 1];
        System.debug('Alerting on --------> PricebookEntry a -'+pbID);
        List<Opportunity> opp = new List<Opportunity>{};
        
        for(Integer i=0;i<200;i++){
        	Opportunity o = new Opportunity();
        	o.AccountId = a.Id;
        	o.Name = 'test';
        	o.StageName = '0-Prospecting';
        	o.CloseDate = date.today();
        	opp.add(o);
       
        }
        	insert opp;
        	System.debug('Alerting on --------> Opportunity opp insert');
        	
        	for(Integer j=0;j<opp.size();j++){
        		OpportunityLineItem ol = new OpportunityLineItem();

			      	ol.OpportunityId = opp[j].Id;
      				ol.Quantity = 1;
       				ol.UnitPrice = 2.00;
	        		ol.PricebookEntryId = pbId.Id;
	        		insertOl.add(ol); 
        	}
        		insert insertOl;
        		System.debug('Alerting on --------> LineItem ol insert '+insertOl);
        	
        	for(Integer ou=0;ou <opp.size();ou++){
        		opp[ou].StageName = '8-Closed';
        		System.debug('Alerting on --------> Opportunity Stagel opp '+opp[ou].StageName+' - '+opp[ou].ID);
        	}
        	Test.startTest();
        	update opp;
        	Test.stopTest();
        
}
}
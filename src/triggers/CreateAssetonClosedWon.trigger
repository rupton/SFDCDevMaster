trigger CreateAssetonClosedWon on Opportunity (after update) {
 Set<id> opSet = new Set<id>(); 
 
     for(Opportunity o:Trigger.new)
     	opSet.add(o.id); 
     	System.debug('Alerting on --------> Starting the CreateAssetonClosedWon Trigger');
     	Map<id, OpportunityLineItem> owners = new Map<id, OpportunityLineItem>([Select UnitPrice, Quantity, PricebookEntry.Product2Id, PricebookEntry.Product2.Name, Description From OpportunityLineItem 
                                      where OpportunityId in :opSet]);     	
     
 
     for(Opportunity o:Trigger.new)
      //if(o.isWon == true && o.HasOpportunityLineItem == true){
      if(Trigger.isUpdate){
      	if(o.stageName == 'closed Won' && o.HasOpportunityLineItem == true){
         Asset[] ast = new Asset[]{};
         Asset a = new Asset();
     //    for(OpportunityLineItem ol: OLI){
            a = new Asset();
            a.AccountId = o.AccountId;
            //a.Product2Id = owners.get(o.Id).PricebookEntry.Product2Id; 
            a.Quantity = owners.get(o.Id).Quantity;
            a.Price =  owners.get(o.Id).UnitPrice;
            a.PurchaseDate = o.CloseDate;
            a.Status = 'Purchased';
            a.Description = owners.get(o.Id).Description;
            a.Name = owners.get(o.Id).PricebookEntry.Product2.Name;
            ast.add(a);
     //  }
      update owners.get(o.id); 
      insert ast;
     	}
      }
}
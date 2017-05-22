global with sharing class SSEQuadstarConsumerCtrl{
    global SSEQuadstarConsumerCtrl() {
        
    }

    @remoteAction
    global static void createOrder(){
       // String acctId = '001j000000HKdpD';
        Account c = [Select Id from Account where Name = 'Jake Garret'];
    String acctId = c.Id;
        /*try{
            User u = [Select Id, AccountId from User where Id = :UserInfo.getUserId()];
            if(u.AccountId != null){ acctId = u.AccountId; }
        }
        catch(Exception e){}*/

        PriceBook2 pb = [Select Id from PriceBook2 where Name = 'Quadstar'];

        Order o = new Order();
        o.PriceBook2Id = pb.Id;
        o.Name = 'iPhone 6 Order';
        o.AccountId = acctId;
        o.Status = 'Draft';
        o.EffectiveDate = Date.today();
        insert o;

        OrderItem oi = new OrderItem();
        //No Id as it would break after Trialforce
    Product2 p = [Select Id from Product2 where Name = 'Internet Plus' Limit 1];
    PricebookEntry pe = [Select Id from PricebookEntry where Pricebook2Id = :pb.Id And Product2Id = :p.Id];
        oi.PriceBookEntryId = pe.Id;
        oi.OrderId = o.Id;
        oi.Quantity = 1;
        oi.UnitPrice = 343.90;
        insert oi; 

    }
}
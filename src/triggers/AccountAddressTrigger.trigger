trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account acct : Trigger.new){
        if( acct.Match_Billing_Address__c == true && acct.BillingPostalCode != ''){
            acct.ShippingPostalCode = acct.BillingPostalCode;
        }
    }
}
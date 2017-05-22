public class AddPrimaryContact implements Queueable{
    private Contact mContact {set;get;}
    private String mState;
    
    public AddPrimaryContact(Contact mContact, String mState){
        this.mContact = mContact;
        this.mState = mState;       	 
    }
    public void execute(QueueableContext ctx){
        Integer nameCounter = 0;
        List<Account> updatedAccounts = [
            SELECT Id, Name, BillingState 
            FROM Account WHERE BillingState=:mState 
            LIMIT 200
        ];
        System.assert(updatedAccounts.size()>0);
        System.debug(updatedAccounts.size());
        for(Account updatedAccount: updatedAccounts){
            Contact clonedContact = mContact.clone(false,true,false,false);
            clonedContact.LastName = clonedContact.LastName + ': ' + nameCounter;
            clonedContact.Languages__c = 'English';
            clonedContact.AccountId = updatedAccount.Id;
            insert clonedContact;
            System.debug('**AddPrimaryContact.apxc** Added new contact: ' +clonedContact.Id+ ' to account: ' + updatedAccount.Name+':'+updatedAccount.Id);
            nameCounter++;
        }
    }
}
public with sharing class fieldSetExtension {

    public Contact ContactForAcc {get;set;} 
    public fieldSetExtension(ApexPages.StandardController controller) {
         ContactForAcc = new Contact();
        lstCon = new List<Contact>();
    }
    
  
  public String AccountId {get;set;}  
  Public List<Contact> lstCon {get;set;}
    
    public List<Schema.FieldSetMember> getFields() {
        return SObjectType.Contact.FieldSets.properNames.getFields();
    }
    
  public PageReference redirectUser(){
   AccountId  = ContactForAcc.AccountId;
   
        if(AccountId != null)
        {
            String query= 'Select ';
            for(Schema.FieldSetMember f : this.getFields()) {
            query+= f.getFieldPath() + ', ';
            }
            query+= 'id from Contact where Accountid =: AccountId';
            lstcon = Database.query(query);
        }
        
        return null;
    }
}
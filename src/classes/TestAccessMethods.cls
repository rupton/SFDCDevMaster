public class TestAccessMethods {


   public integer prop {
      get { return prop; }
      set { prop = value; }
   }
    
    public List<Account> mAccount{
        get;
        set{ mAccount = [SELECT Id, Name FROM Account];}
    }

}
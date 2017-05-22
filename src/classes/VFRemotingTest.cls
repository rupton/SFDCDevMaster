public class VFRemotingTest{
       @RemoteAction
       public static String getAssetExpand(String assetID)
       {
           List<Account> aList = [SELECT ID, Name from Account];
           if(aList.size() >0)
           {
               return JSON.serialize(aList);
           }
           else
               return null;
       }
}
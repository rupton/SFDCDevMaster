//TODO:This autogenerated class includes the basics for a Registration
//Handler class. You will need to customize it to ensure it meets your needs and
//the data provided by the third party.

global class AutocreatedRegHandler1481158420210 implements Auth.RegistrationHandler{
global boolean canCreateUser(Auth.UserData data) {
    //TODO: Check whether we want to allow creation of a user with this data
    //Set<String> s = new Set<String>{'usernamea', 'usernameb', 'usernamec'};
    //if(s.contains(data.username)) {
        //return true;
    //}
    return false;
}

    global User createUser(Id portalId, Auth.UserData data){
        User u = [SELECT ID FROM User Where Other_Salesforce_Org_Username__c = : data.username];
        return u;
    }

    /**
    *   Once Users are related, after that whenever user will return, this method wil be executed.
    *   If needed, we can perform any information needed.
    *   In this blog , we are not going to perform any operation in this method.
    */
    global void updateUser(Id userId, Id portalId, Auth.UserData data){
       //No Operation
    }
}
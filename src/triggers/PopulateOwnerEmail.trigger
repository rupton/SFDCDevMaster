trigger PopulateOwnerEmail on Account (before insert, before update) {
    Map<Id, String>emailMap = new Map<Id, String>();
    for(Account a: Trigger.new){
        User user = [select id, name, email from user where id =:a.ownerId];
        emailMap.put(user.Id, user.email);
    }
    System.debug('Email Map: ' + emailMap);
}
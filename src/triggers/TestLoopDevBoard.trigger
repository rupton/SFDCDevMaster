trigger TestLoopDevBoard on Opportunity (before insert) {
Map<Id, User> ownerMap = new Map<Id, User>{};                        //mapping
List<Id>owners = new List<Id>();
    for(Opportunity o: trigger.new){
    	owners.add(o.ownerId);
    }
    for(User u: [SELECT Id, User.ManagerId FROM User WHERE Id IN : owners]){
        ownerMap.put(u.id, u);
    }
    
}
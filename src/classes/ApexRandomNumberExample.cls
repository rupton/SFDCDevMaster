public class ApexRandomNumberExample{
/*
AggregateResult numAccounts = [select count(id) from Account];
System.debug('There are ' + numAccounts.get('expr0') + ' accounts');
for(Integer i = 0;  i < 100; i++){
    Integer rand = Math.round(Math.random() * 100);
    System.assert((Math.mod(rand,50))<30);
}
*/
    public Integer randomWithLimit(Integer upperLimit){
        Integer rand = Math.round(Math.random()*100);
        return Math.mod(rand, upperLimit);
    }
    
    public List<Integer> randomWithLimit(Integer upperLimit, Integer numberOfRands){
		List<Integer>selected = new List<Integer>();        
		for (Integer i =0; i< numberOfRands; i++){
			Integer rand = Math.mod(Math.round(Math.random()*1000),upperLimit);
			selected.add(rand);
		}	       	
 		return selected;
     }
}
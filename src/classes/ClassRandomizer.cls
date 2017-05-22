public class ClassRandomizer{
	
    public Integer randWithLimit(Integer limits){
        
        Integer rand = Math.mod(Math.round((Math.random() *100)), limits);        
        return rand;
    }
    
    public List<Integer> randomsWithLimit(Integer limits){
        List<Integer>selected = new List<Integer>();
        for(Integer i = 0; i < limits; i++){
            selected.add(Math.mod(Math.round((Math.random() *100)), limits)); 
        }
        
        return selected;
    }
}
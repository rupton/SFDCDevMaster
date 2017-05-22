public class ConditionalController{
    public integer count=1; 
 
    public String message{
     	get;
        set{
         message = value;   
        }
    }
    public ConditionalController(){
     	message = 'Hello world';   
    }
    public integer getCount()
   {
      return count;
   }
 
   public void setCount(integer value)
   {
        this.count=value;
   }
}
public class RenderTest{
	
    public Account m_account{get; set;}
    public double value{get; set;}
    public Boolean checkMe{set;}
    
    public RenderTest(ApexPages.StandardController controller){
        m_account = (Account)controller.getRecord();
    }
    
    public PageReference testVal(){
        return null;
    }
    
    public Boolean getCheckMe(){
        if(value > 1000){
            return true;
        }else{
            return false;
        }
    }
}
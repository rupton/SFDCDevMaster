public class AjaxDemo {

    private String currTime;
   	private integer records = 0;
    private List<Integer>recordList = new List<integer>();
    public String getCurrTime()
    {
        return currTime;
    }
    public Integer getRecords(){
        return recordList.size();
    }
    public void setRecords(){
        recordList.add(15);
    }
    public void setCurrTime()
    {
        currTime = System.now().format('EEEE, MMMM d, yyyy - hh:mm:ss');
    }
}
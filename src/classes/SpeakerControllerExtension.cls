public class SpeakerControllerExtension {
    public Integer counter {get; set;}
    public blob picture {get; set;}
    public String errorMessage {get; set;}
    private final Speaker__c speaker;
    private final ApexPages.StandardController controller;
    
    public SpeakerControllerExtension(ApexPages.StandardController controller){
        this.speaker = (Speaker__c)controller.getRecord();
        this.controller = controller;
        counter = 0;
    }
    
    public void increment(){
        counter++;
    }
    
    public PageReference save(){
        errorMessage = '';
        try{
            upsert speaker;
            if(picture != null){
                Attachment photoAttachment = new Attachment();
                photoAttachment.body = picture;
                photoAttachment.Name = 'Speaker Profile Pic ' + speaker.id;
                photoAttachment.parentId = speaker.id;
                photoAttachment.ContentType = 'Application/jpg';
                insert photoAttachment;
                speaker.Picture_Path__c = '/servlet/servlet.FileDownload?file=' + photoAttachment.id;
                update speaker;
                return new ApexPages.StandardController(speaker).view();
            }
        }catch(Exception ex){
            errorMessage = ex.getMessage();
        }
        return null;
    }
    
}
public class ViperController {

    private String objName{get; set;}
    private ViperObject__c viperObj;  
    private ViperField__c viperField;
    private List<ViperField__c> addedFields;
    private integer records =0;
    
    public ViperController(){
		viperObj = new ViperObject__c();
        viperField = new ViperField__c();
        addedFields = new List<ViperField__c>();
        records = addedFields.size();
    }
    public void createObject(){
        if(viperObj.name != null){
            insert viperObj;
        }
        for(ViperField__c field: addedFields){
            field.ViperObjectParent__c = viperObj.id;
        }
        insert addedFields;
        System.debug('***** Using JSON: ' + buildJson());
    }
    public void addField(){
        System.debug('Added new field');
        addedFields.add(viperField);
        records = addedFields.size();
        viperField = new ViperField__c();
    }
    public Integer getRecords(){
        return records;
    }
    public List<ViperField__c> getAddedFields(){
        return addedFields;
    }
    public ViperObject__c getViperObj(){
        return viperObj;
    }
    public ViperField__c getViperField(){
        return viperField;
    }
    /*@RemoteAction
    global static String createNewObject(String jsonString){
        return DataObjectService.createObject(jsonString);
    }*/
    private String buildJson(){
    	String id = String.valueOf(viperObj.id);
    	Jsongenerator generator = JSON.createGenerator(true);
    	generator.writeStartObject();
    	generator.writeStringField('ObjectName', id.substring(0,2)+viperObj.Name);
    	generator.writeFieldName('fields');
    	generator.writeStartArray();
    	for(ViperField__c field: addedFields){
    		generator.writeFieldName(field.Name);
    	}
    	generator.writeEndArray();
    	generator.writeFieldName('values');
    	generator.writeStartArray();
    	for(ViperField__c field: addedFields){
    		generator.writeFieldName(field.field_value__c);
    	}
    	generator.writeEndArray();
    	generator.writeEndObject();
    	return generator.getAsString();
    }
}
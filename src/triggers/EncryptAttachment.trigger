trigger EncryptAttachment on Attachment (before insert) {
    Blob key = Crypto.generateAesKey(128);  
    for(Attachment attach : Trigger.new){
        //check if we should encrypt
        attach.body=(Crypto.encryptWithManagedIV('AES128', key, attach.body));
    }
}
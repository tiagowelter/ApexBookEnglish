trigger CarTrigger on Car__c (after insert, after update) {
    //List to store the Car objects that will be processed
    List<Car__c> carros = new List<Car__c>();
  
    //Determines if it's an after insert or update trigger just to demonstrate how to differentiate when to insert and when to update
    if (Trigger.isInsert) {
      carros = Trigger.new;
    } else if (Trigger.isUpdate) {
      carros = Trigger.new;
    }
  
    //Sends an email to the owner of the Car record after insertion or update
    for (Car__c c : carros) {
      Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
      email.setToAddresses(new String[] {c.Owner.Email});
      email.setSubject('Information about your car: ' + c.Name);
      email.setPlainTextBody('Your car registration ' + c.Name + ' has been updated. Check the updated information on the Salesforce platform.');
      Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
    }
}
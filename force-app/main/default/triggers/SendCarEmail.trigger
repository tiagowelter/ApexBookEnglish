trigger SendCarEmail on Car__c (after insert) {
    // Create a list of email message objects
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

    // Loop through all the new records inserted
    for (Car__c c : Trigger.new) {
        // Create a new email message
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        // Set the recipient email address
        email.setToAddresses(new String[] {c.Owner.Email});
        
        // Set the subject of the email message
        email.setSubject('New Car Inserted');
        
        // Set the body of the email message
        email.setPlainTextBody('A new car has been inserted with the following model: ' + c.Brand__c);
        
        // Add the email message to the list
        emails.add(email);
    }

    // Send all the email messages in batch
    Messaging.sendEmail(emails);
}
trigger PartTrigger on Part__c (after insert) {
    List<Task> tasks = new List<Task>();
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
    
    for (Part__c  part: Trigger.new) {
        
        // Creates a task related to the "Reminder" record
        Task task = new Task();
        task.Subject = 'Reminder: Review inserted part ' + part.Name;
        task.ActivityDate = System.today();
        task.WhatId = part.Id;
        tasks.add(task);
        
        // Sends an email to the user who added the record
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new List<String>{part.Owner.Email});
        mail.setSubject('New registered car part: ' + part.Name);
        mail.setPlainTextBody('New registered car part: ' + part.Name + '\nDate: ' + System.today());
        mails.add(mail);
    }
    
    // Insert tasks and send emails
    insert tasks;
    Messaging.sendEmail(mails);
}
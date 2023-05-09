@isTest
private class SendEmailToAccountOwnerTest {

    @testSetup
    static void createTestData() {
        // Test account creation
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        // User creation to associate with the test account
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
                          EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='standarduser@testorg.com');
        insert u;
        
        // Association of created user to test account
        acc.OwnerId = u.Id;
        update acc;
    }

    @isTest
    static void testSendEmailToAccountOwner() {
        // Creating the test opportunity associated with the account created in testSetup
        Account acc = [SELECT Id, OwnerId FROM Account WHERE Name = 'Test Account'];
        Opportunity opp = new Opportunity(Name = 'Test Opportunity', StageName = 'Prospecting', 
                                          CloseDate = Date.today().addDays(30), AccountId = acc.Id);
        insert opp;
        
        // Verification that the email was sent correctly
        Test.startTest();
        String usrEmail = [SELECT Email FROM User WHERE Id = :acc.OwnerId  LIMIT 1].Email;
        
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.ToAddresses = new String[] {usrEmail};
        message.subject = 'New Opportunity Added';
        message.setPlainTextBody('A new opportunity has been added to your account ' + acc.Name);

        Messaging.SingleEmailMessage[] messages = new List < Messaging.SingleEmailMessage > {message};
        Messaging.SendEmailResult[] sentEmails = Messaging.sendEmail(messages);
        Test.stopTest();
        
        System.assertEquals(1, sentEmails.size(), 'An email should have been sent');

    }
}
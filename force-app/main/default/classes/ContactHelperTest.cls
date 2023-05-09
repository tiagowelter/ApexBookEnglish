@isTest
private class ContactHelperTest {
    @isTest
    static void testUpdateContactEmail() {
        // Create a contact record
        Contact testContact = new Contact();
        testContact.LastName = 'Test';
        testContact.Email = 'test@example.com';
        insert testContact;

        // Calls the normal class method and checks if the email has been updated
        ContactHelper.updateContactEmail(testContact.Id, 'newemail@example.com');
        testContact = [SELECT Id, Email FROM Contact WHERE Id = :testContact.Id];
        System.assertEquals('newemail@example.com', testContact.Email);
    }
}
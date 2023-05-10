@isTest
private class PartTriggerTest {
	static testMethod void testCarPartTrigger() {
		
        // Creates a test "Part" record
		Test.startTest();
        Part__c part = new Part__c ();
		part.Name = 'Test Car Part';
		insert part;
        Integer emailLimit = Limits.getEmailInvocations();
        Test.stopTest();

		// Checks if the task was created
		Task task = [SELECT Id, Subject, Description, ActivityDate, WhatId FROM Task WHERE WhatId = :part.Id];
		System.assertNotEquals(null, task);
		System.assertEquals('Reminder: Review inserted part '+part.Name, task.Subject);
		
		// Check if the email was sent
		System.assertEquals(1,emailLimit);
	}
}
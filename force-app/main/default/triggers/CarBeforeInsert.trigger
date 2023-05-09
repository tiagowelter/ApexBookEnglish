trigger CarBeforeInsert on Car__c (before insert) {
    for (Car__c c : Trigger.new) {
      // Validation of completion of mandatory fields
      if (c.Brand__c == null || c.YearOfManufacture__c == null) {
        c.addError('All fields are mandatory');
      }
    }
}
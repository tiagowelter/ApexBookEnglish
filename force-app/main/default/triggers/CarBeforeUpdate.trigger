trigger CarBeforeUpdate on Car__c (before update) {
    for (Car__c c : Trigger.new) {
      if (c.Price__c < 0) {
        c.Price__c.addError('The price of the car cannot be negative.');
      }
    }
}
@isTest
private class TestAccountRetriever {
  @testSetup
  static void createAccounts() {
    List<Account> accountsToInsert = new List<Account>();
    for(Integer i=1; i<=5; i++){
        accountsToInsert.add(new Account(Name='Account '+i));
    }
    insert accountsToInsert;
  }

  @isTest
  static void testDebugAccounts() {
    AccountRetriever accRet = new AccountRetriever();
    accRet.debugAccounts();
    // checking that the list of accounts is not null and has at least one record
    System.assertNotEquals(null, accRet.accounts);
    System.assertNotEquals(0, accRet.accounts.size());
  }
}
/*
Example of code execution in Execute Anonymous:

BankAccountV3 account1 = new BankAccountV3(1, 'Current account', 1000);
System.debug(account1.accountNumber); // 1
System.debug(account1.name); // Current account
System.debug(account1.balance); // 1000
*/

public class BankAccountV3 {
  public Integer accountNumber;
  public String name;
  public Decimal balance;

  public BankAccountV3(Integer accountNumber, String name, Decimal balance) {
    this.accountNumber = accountNumber;
    this.name = name;
    this.balance = balance;
  }
}

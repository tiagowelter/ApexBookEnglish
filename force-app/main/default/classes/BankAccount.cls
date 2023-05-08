/*
Example of code execution in Execute Anonymous:
      // Instantiating object account1
      BankAccount account1 = new BankAccount();
      account1.name = "James McGill";
      account1.address = "Street ABC, 123";
      account1.balance = 1000;

      // Instantiating object account2
      BankAccount account2 = new BankAccount();
      account2.name = "Walter White";
      account2.address = "Street DEF, 456";
      account2.balance = 2000;

      // Performing banking operations
      account1.deposit(500);
      System.debug(account1.balance); // 1500

      account2.withdraw(500);
      System.debug(account2.balance); // 1500
*/

public class BankAccount {
   public String name;
   public String address;
   public Integer balance;
   
   public void deposit(Integer value) {
      balance += value;
   }
   
   public void withdraw(Integer value) {
      balance -= value;
   }
}
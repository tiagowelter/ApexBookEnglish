public class BankAccountV2 {
   public String Name;
   public Integer Balance;
   
   public void Deposit(Integer value) {
      Balance = Balance + value;
   }
   
   public Integer CheckBalance() {
      return Balance;
   }
}
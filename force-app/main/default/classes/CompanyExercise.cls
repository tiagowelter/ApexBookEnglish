public class CompanyExercise {
    Map<String, Integer> employees;
 
    public CompanyExercise() {
      employees = new Map<String, Integer>();
    }
 
    public void addEmployee(String name, Integer salary) {
      employees.put(name, salary);
    }
 
    public void displayEmployees() {
       for (String name : employees.keySet()) {
          System.debug(name + ': ' + employees.get(name));
       }
    }
 }
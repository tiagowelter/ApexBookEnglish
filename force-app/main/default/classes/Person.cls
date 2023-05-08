/*
Example of code execution in Execute Anonymous:
  Person person1 = new Person("Jesse Pinkman", 30);
  Person person2 = new Person("Hank Schrader", 25);

  // Instantiating the person object
  Person person3 = new Person("Gustavo Fring", 30);

  // Using the getNome method
  System.debug(person3.getNome()); // Gustavo Fring

  // Using the setNome method
  person3.setNome("Jane Margolis");
  System.debug(person3.getNome()); // Jane Margolis
*/

public class Person {
  private String name;
  private Integer age;
  
  public Person(String name, Integer age) {
    this.name = name;
    this.age = age;
  }
  
  public String getName() {
    return name;
  }
  
  public void setName(String name) {
    this.name = name;
  }
  
  public Integer getAge() {
    return age;
  }
  
  public void setAge(Integer age) {
    this.age = age;
  }
}
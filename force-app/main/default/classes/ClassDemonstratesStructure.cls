public with sharing class ClassDemonstratesStructure {

    //PRIMITIVE TYPES
    public static void primitiveTypes () {
        Integer num = 10;
        String name = 'John';
        Boolean trueOrFalse = true;

        system.debug('The value of the variable num is '+num);
        system.debug('The value of the variable name is '+name);
        system.debug('The value of the variable trueOrFalse is '+trueOrFalse);
    }

    public static void primitiveTypesInteger() {
        Integer age;
        age = 35;

        system.debug('The value of the variable age is '+age);
    }

    public static void primitiveTypesDouble() {
        double valueNum = 1.23456;

        system.debug('The value of the variable valueNum is '+valueNum);
    }

    public static void primitiveTypesLong() {
        Long numberOfContracts = 100000;

        system.debug('The value of the variable numberOfContracts is '+numberOfContracts);
    }

    public static void primitiveTypesDate() {
        Date today = Date.today();
        System.debug('Today date: ' + today);
    }

    public static void primitiveTypesDatetime() {
        DateTime actualDate= DateTime.now(); 
        System.debug('Current date and time: ' + actualDate); 
        
        DateTime futureDate= actualDate.addDays(7); 
        System.debug('Date and time 7 days from now: ' + futureDate);
    }

    public static void primitiveTypesString() {
        String name = 'John Smith';

        system.debug('The value of the variable name is '+name);
    }

    public static void primitiveTypesID() {
        Id recordId = '001D000000I8mUOIAZ';

        system.debug('The value of the variable recordId is '+recordId);
    }

    public static void primitiveTypesBoolean() {
        Boolean isValid = true; 

        if (isValid) { 
           System.debug('The value is true'); 
        } else { 
           System.debug('The value is false'); 
        }
    }

    public static void primitiveTypessObject() {
        Account myAccount = new Account();
        myAccount.Name = 'Exemple Account';
        myAccount.Industry = 'Technology';
        
        SObject genericObject = myAccount;

        system.debug('The value of the variable genericObject is '+genericObject);
    }

    //COLEÇÔES
    public static void collectionsList() {
        List<Integer> listIntegers = new List<Integer>();
        listIntegers.add(1);
        listIntegers.add(2);
        listIntegers.add(3);
        
        System.debug(listIntegers);
    }

    public static void collectionsSet() {
        Set<String> namesSet = new Set<String>();
        namesSet.add('John');
        namesSet.add('Ananya');
        namesSet.add('Pedro');
        namesSet.add('John');
        
        System.debug(namesSet); // Output: {John, Ananya, Pedro}
    }

    public static void collectionsMap() {
        Map<String, Integer> ageByName = new Map<String, Integer>();
        ageByName.put('John', 30);
        ageByName.put('Ananya', 25);
        ageByName.put('Pedro', 35);
        
        System.debug(ageByName);
    }
    
    public static void collectionsMapRetrievingValue() {
        Map<String, Integer> ageByName = new Map<String, Integer>();
        ageByName.put('John', 30);
        ageByName.put('Ananya', 25);
        ageByName.put('Pedro', 35);
        
        Integer ageAnanya  = ageByName.get('Ananya');
        
        System.debug('Ananya s age is '+ ageAnanya );
    }

    public static void collectionsMapRetrievingValueWhitError() {
        Map<String, Integer> ageByName = new Map<String, Integer>();
        ageByName.put('John', 30);
        ageByName.put('Ananya', 25);
        ageByName.put('Pedro', 35);
        
        Integer ageWalter = ageByName.get('Walter');
        
        System.debug('Walter s age is '+ ageWalter);
    }

    public static void collectionsMapRetrievingValueWhitoutError() {
        Map<String, Integer> ageByName = new Map<String, Integer>();
        ageByName.put('John', 30);
        ageByName.put('Ananya', 25);
        ageByName.put('Pedro', 35);
        
        Integer ageWalter = 0;
        
        if (ageByName.containsKey('Walter')) {
            ageWalter = ageByName.get('Walter');
            System.debug('Walter s age is ' + ageWalter);
        } else {
            System.debug('There is no information about Walter \'s age');
        }
    }

    //ENUMS
    public enum eNumsPriority {
        High,
        Medium,
        Low
    }
    
    public class eNumsTask {
        public eNumsPriority eNumsPriority { get; set; }
    }

    //CONDITIONAL
    public static void simpleIfConditionals() {
        Integer num = 10;

        if (num > 5) {
          System.debug('Num is greater than 5');
        }
    }

    public static void conditionalsIfElseElseIf() {
        Integer age = 25;

        if (age < 18) {
            System.debug('You are underage');
        } else if (age >= 18 && age <= 30) {
            System.debug('You are a young adult');
        } else {
            System.debug('You are an adult');
        }
    }

    public static void conditionalsIfElse() {
        Integer age = 20;

        if (age >= 18) {
            System.debug('This person is of legal age.');
        } else {
            System.debug('This person is a minor.');
        }
    }

    public static void conditionalsIfElseElseIf2() {
        Integer score = 70;

        if (score >= 90) {
            System.debug('A');
        } else if (score >= 80) {
            System.debug('B');
        } else if (score >= 70) {
            System.debug('C');
        } else {
            System.debug('D');
        }
    }

    public static void conditionalsSwitch() {
        Integer dayWeek = 3;

        switch on dayWeek {
          when 1{
            System.debug('Sunday');
          }
          when 2{
            System.debug('Monday');
          }
          when 3{
            System.debug('Tuesday');
          }
          when else{
            System.debug('Invalid day');
          }
        }
    }

    public static void conditionalsSwitchWhenElse() {
        Integer month = 12;
        String monthName;
        
        switch on month {
            when 1 { monthName = 'January'; }
            when 2 { monthName = 'February'; }
            when 3 { monthName = 'March'; }
            //...
            when else { monthName = 'Unknown month'; }
        }
        
        System.debug(monthName);
    }

    public static void ternaryConditionals1() {
        Integer num = 10;

        String result = (num > 5) ? 'Greater than 5' : 'Less than or equal to 5';
        
        System.debug(result);
    }

    //LOOPS
    public static void loopsForWithList() {
        List<Integer> numbers = new List<Integer>{1, 2, 3, 4, 5};

        for(Integer i : numbers){
          System.debug(i);
        }
    }

    public static void loopsWhile() {
        Integer count = 1;
        while (count <= 10) {
          System.debug(count);
          count++;
        }
    }

    public static void loopsDoWhile() {
        Integer counter = 0;
        do {
            System.debug('Executing the while loop: ' + counter);
            counter++;
        } while (counter < 5);
    }

    public static void loopsForeach() {
        List<Integer> listIntegers = new List<Integer>();
        listIntegers.add(1);
        listIntegers.add(2);
        listIntegers.add(3);
        
        for (Integer num : listIntegers) {
            System.debug(num);
        }
    }

    public static void loopsForeachMap() {
        Map<String, Integer> ageByName = new Map<String, Integer>();
        ageByName.put('John', 30);
        ageByName.put('Jane', 25);
        ageByName.put('Pedro', 35);
        
        for (String name : ageByName.keySet()) {
            Integer age = ageByName.get(name);
            System.debug(name + ' is ' + age + ' years old.');
        }
    }

    //OPERATORS
    public static void operators1() {
        Integer num1 = 10;
        Integer num2 = 20;
        
        // Addition
        Integer result = num1 + num2;
        System.debug(result); // 30

        // Subtraction
        result = num2 - num1;
        System.debug(result); // 10

        // Multiplication
        result = num1 * num2;
        System.debug(result); // 200

        // Division
        result = num2 / num1;
        System.debug(result); // 2
    }

    public static void operators2() {
        Integer num1 = 10;
        num1 += 5; // num1 now is 15
        num1 -= 2; // num1 now is 13
        num1 *= 2; // num1 now is 26
        num1 /= 2; // num1 now is 13
        system.debug('The value of the variable num1 is '+num1);
    }

    public static void comparisonOperators() {
        Integer num1 = 10;
        Integer num2 = 20;
        
        if (num1 == 10) {
           System.debug('num1 is equal to 10');
        }
        
        if (num1 < num2) {
           System.debug('num1 is less than num2');
        }
    }

    public static void logicalOperators() {
        Boolean a = true;
        Boolean b = false;
        
        // Using the AND Operator (&&)
        if (a && b) {
            System.debug('Both are true');
        } else {
            System.debug('At least one is false');
        }
        
        // Using the OR operator (||)
        if (a || b) {
            System.debug('At least one is true');
        } else {
            System.debug('Both are false');
        }
        
        // Using the negation operator (!)
        if (!a) {
            System.debug('a is false');
        } else {
            System.debug('a is true');
        }
    }

    public static void conditionalOperators() {
        Integer age = 30;
        String result = (age >= 18) ? 'Legal age' : 'Underage';
        System.debug(result); // 'Legal age'
    }    

    public static void operatorsExample() {
        Integer num1 = 10;
        Integer num2 = 20;

        // Using arithmetic operator +
        Integer result = num1 + num2;
        System.debug(result); // 30
        
        // Using comparison operator ==
        if (num1 == 10) {
            System.debug('num1 is equal to 10');
        }
        
        // Using logical operator &&
        if (num1 == 10 && num2 == 20) {
            System.debug('num1 is equal to 10 and num2 is equal to 20');
        }
    }

    //FUNCTIONS AND METHODS
    public static Double calcAverage(List<Double> numbers) {
        Double sum = 0;
        for (Double num : numbers) {
        sum += num;
        }
        return sum / numbers.size();
    }

    public static Boolean isEven(Integer num) {

        if(math.mod(num, 2) == 0){
            system.debug('this is even: ' + num);
        }else{
            system.debug('this is odd: ' + num);
        }

        return math.mod(num, 2) == 0;
    }

    public Integer sumNumbers(Integer num1, Integer num2){
        Integer result = num1 + num2;
        return result;
    }

    public Integer addNumbers(Integer num1, Integer num2) {
        return num1 + num2;
    }
   
}
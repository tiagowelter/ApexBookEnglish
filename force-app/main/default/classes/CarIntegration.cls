@RestResource(urlMapping='/Cars/*')
global with sharing class CarIntegration {

  @HttpPost
  global static void createCar(String jsonBody) {
    // Deserialize JSON
    Map<String, Object> carJson = (Map<String, Object>) JSON.deserializeUntyped(jsonBody);

    // Creates a new Car object
    Car__c newCar = new Car__c();
    newCar.Name = (String) carJson.get('name');
    newCar.Price__c = (Double) carJson.get('price');
    newCar.Brand__c = (String) carJson.get('brand');

    // Inserts the record into the Car object
    insert newCar;
  }
}
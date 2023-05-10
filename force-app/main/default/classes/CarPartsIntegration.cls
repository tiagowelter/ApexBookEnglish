public with sharing class CarPartsIntegration {
    public static void upsertCarParts(String carCode) {
      // Performs the GET on the specified URL, passing the car code
      Http h = new Http();
      HttpRequest req = new HttpRequest();
      req.setMethod('GET');
      req.setEndpoint('https://carparts.com/getParts/' + carCode);
      HttpResponse res = h.send(req);
  
      // Checks if the response is valid and parses the JSON
      if (res.getStatusCode() == 200) {
        Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        List<Object> carParts = (List<Object>) result.get('carParts');
  
        // Creates a list of Part records
        List<Part__c> partsToUpsert = new List<Part__c>();
        for (Object obj : carParts) {
          Map<String, Object> partData = (Map<String, Object>) obj;
          Part__c part = new Part__c();
          part.Name = (String) partData.get('partName');
          part.PartCost__c = (Decimal) partData.get('partPrice');
          partsToUpsert.add(part);
        }
  
        // Performs the upsert on the Part record list
        try {
          upsert partsToUpsert;
        } catch (Exception e) {
          System.debug(e.getMessage());
        }
      }
    }
  }
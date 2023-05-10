@isTest
global class CarPartsIntegrationTest implements HttpCalloutMock {
    
    @isTest
    static void calloutTest(){
        
        Test.setMock(HttpCalloutMock.class, new CarPartsIntegrationTest());

        Test.startTest();
        CarPartsIntegration.upsertCarParts('123456');
        Test.stopTest();

        Part__c part = [SELECT Name FROM Part__c WHERE Name = 'Headlight' LIMIT 1];

        System.assertEquals('Headlight', part.Name);
    }
    
    global HTTPResponse respond(HTTPRequest req){
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"partName": "Headlight", "partPrice": 80}');
        res.setStatusCode(200);
        return res;
    }
}
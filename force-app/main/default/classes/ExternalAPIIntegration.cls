public with sharing class ExternalAPIIntegration {
    public static void getData(String email){
        Http http = new Http();
        String url = 'https://salesforce.com/services/apexrest/ApexClass/Leads/'+email;
        String sessionId = 'xxxxxxxxxxx';
    
        HttpRequest getRequest = new HttpRequest();
        getRequest.setEndpoint(url);
        getRequest.setMethod('GET');
        getRequest.setHeader('content-type','application/json');
        getRequest.setHeader('authorization', 'Bearer '+sessionId);
    
        HttpResponse response = http.send(getRequest);
    
        if(response.getStatusCode() == 200){
            String returnValue = response.getBody();
    
            List<ExternalAPIIntegration.listData> leadsList = (List<ExternalAPIIntegration.listData>) JSON.deserialize(returnValue, List<ExternalAPIIntegration.listData>.class);
    
            system.debug('leadsList' + leadsList);
            List<Lead> listLead = new List<Lead>();
            for(ExternalAPIIntegration.listData cTemp : leadsList){
                Lead leadObj =  new Lead();
                leadObj.FirstName = cTemp.name;
                leadObj.Company = cTemp.company;
                leadObj.Email = cTemp.email;
                listLead.add(leadObj);
            }
            insert listLead;
        }
    }
    
    public class listData{
        public String name;
        public String company;
        public String email;
    }
}  
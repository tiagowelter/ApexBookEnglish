public class ContactInformationIntegration {
  public static void updateLeadInformation(Id leadId) {
    // Consult the Lead
    Lead lead = [SELECT Id, Email, FirstName, LastName, Phone FROM Lead WHERE Id = :leadId];

    // Call the external API
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://api.externa.com/contacts/' + lead.Email);
    request.setMethod('GET');
    HttpResponse response = http.send(request);

    // Parse the API response
    if (response.getStatusCode() == 200) {
      Map<String, Object> apiResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
      lead.FirstName = (String) apiResponse.get('first_name');
      lead.LastName = (String) apiResponse.get('last_name');
      lead.Phone = (String) apiResponse.get('phone');
    }

    // Update Lead record
    update lead;
  }
}
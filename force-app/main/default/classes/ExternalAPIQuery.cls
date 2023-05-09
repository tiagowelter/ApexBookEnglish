// Apex class to perform query on external API
public class ExternalAPIQuery {
    public static String getDataFromAPI(String endpoint) {
      Http h = new Http();
      HttpRequest req = new HttpRequest();
      req.setEndpoint(endpoint);
      req.setMethod('GET');
      HttpResponse res = h.send(req);
      return res.getBody();
    }
}
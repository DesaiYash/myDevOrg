public class HTTPCalloutController {
    public ResponseWrapper results {get;set;}
    public HTTPCalloutController() {
        Http ht = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://services.groupkt.com/country/get/all');
        req.setMethod('GET');
        HttpResponse res = ht.send(req);
        if(res.getStatusCode() == 200) {
            //sResult = res.getBody();
            results = (ResponseWrapper) JSON.deserialize(res.getBody(),ResponseWrapper.class);
        }
        //else
            //sResult = 'Error : '+res.getStatus();
        
    }
    
    class ResponseWrapper {
        public RestResponseClass RestResponse {get;set;}
    }
    
    class RestResponseClass {
        public List<String> messages {get;set;}
        public List<ResultClass> result {get;set;}
    }
        
    class ResultClass {
        public String name {get;set;}
        public String alpha2_code {get;set;}
        public String alpha3_code {get;set;}
    }

}
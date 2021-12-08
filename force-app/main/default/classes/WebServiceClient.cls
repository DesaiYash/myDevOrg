public class WebServiceClient {
    
    public static void callService() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://services.groupkt.com/state/get/IND/GJ');
        req.setMethod('GET');
        req.setHeader('Connection','keep-alive');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        //System.debug(res.getBody());
        ResponseWrapper resultService = (ResponseWrapper)JSON.deserialize(res.getBody(), ResponseWrapper.class);
        System.debug(''+resultService.RestResponse.result);
    }
    
    public class ResponseWrapper {
        ResponseResult RestResponse;
    }
    
    public class ResponseResult {
        List<String> messages;
        //List<ResultWrapper> result;
        ResultWrapper result;
    }
    
    public class ResultWrapper {
        String country;
        String name;
        String abbr;
        String area;
        String largest_city;
        String capital;
    }

}
global class AccountSoap {
    
    webservice static ResponseWrapper getAccountId(String name) {
        ResponseWrapper response = new ResponseWrapper();
        try {
            String accId = [select Id from Account where Name =: name].Id;
            response.statusCode = 200;
            response.accountId = accId;
        }
        catch(Exception ex) {
            response.statusCode = 400;
            response.errorMessage = ex.getMessage();
        }

        return response;
    }
    
    global class ResponseWrapper {
        webservice Integer statusCode;
        webservice String accountId;
        webservice String errorMessage;
    }

}
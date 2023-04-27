public with sharing class HttpCallout {
    public static void makeCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://postman-echo.com/get?accountname=sukku&contactnumber=7676275358');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String responseBody = response.getBody();
        system.debug('Response Body: ' + responseBody);
    }
}
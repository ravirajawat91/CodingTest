/**
 * Created by Ravindra Singh on 09-06-2022.
 * Get service for Missing users
 * Method to get all missing users from given EndPoint.
 * Test Class : MissingWebUserGetServiceTest
 */
public class MissingWebUserService {
    
    public static HttpResponse getMissingUserService(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(MissingWebUserConstantClass.MISSING_VALUE_ENDPOINT_GET);
        request.setMethod(MissingWebUserConstantClass.GET_METHOD_VALUE);
        HttpResponse response = http.send(request); 
        return response;
    }
}
/*@author Ravindra Singh 
 * Test class for MissingWebUserGetService
 * Last Update :
 * @Version 1.0
 */
@isTest
public class MissingWebUserServiceTest {
	private testmethod static void getMissingUserServiceTest(){        
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        Test.startTest(); 
            HttpResponse res = new HttpResponse();
            res = MissingWebUserService.getMissingUserService();
            String contentType = res.getHeader('Content-Type');
            String actualValue = res.getBody();
            String expectedValue = '[{"id": 1,"name": "Leanne Graham","username": "Bret","email": "Sincere@april.biz","address": {"street": "Kulas Light","suite": "Apt. 556","city": "Gwenborough","zipcode": "92998-3874","geo": {"lat": "-37.3159","lng": "81.1496"}]';
            System.assertEquals(actualValue, expectedValue);
        Test.stopTest();
        
    }
}
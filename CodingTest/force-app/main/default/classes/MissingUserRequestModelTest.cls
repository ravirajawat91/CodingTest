/*@author Ravindra Singh 
 * Test class for MissingUserRequestModel
 * Last Update :
 * @Version 1.0
 */
@isTest
public class MissingUserRequestModelTest {
    
    private testmethod static void updateMissingUsersPositiveTest(){
        List<MissingUserResponseModel> mUserListToUpdate = new List<MissingUserResponseModel>();
        //for(integer i=0;1>10;i++){
            MissingUserResponseModel mUser = new MissingUserResponseModel();
            mUser.webId = 1;
            mUser.companyName = 'companyName Test'+1;
            mUser.email = 'emailTest'+1+'@test.com';
            mUser.name = 'Test Name'+1;
            mUser.username = 'Test User Name'+1;
            
            mUserListToUpdate.add(mUser);
		//}
        MissingWebUserListCtrl.updateMissingUsers(mUserListToUpdate);
    }
    
    private testmethod static void updateMissingUsersNegativeTest(){
        List<MissingUserResponseModel> mUserListToUpdate = new List<MissingUserResponseModel>();
        //for(integer i=0;1>10;i++){
            MissingUserResponseModel mUser = new MissingUserResponseModel();
            mUser.webId = 1;
            mUser.companyName = 'companyName Test'+1;
            mUser.email = 'emailTest'+1+'@test.com';
            mUser.name = 'Test Name'+1;
            mUser.username = 'Test User Name'+1;
        
        	MissingUserResponseModel mUser1 = new MissingUserResponseModel();
            mUser1.webId = 1;
            mUser1.companyName = 'companyName Test'+1;
            mUser1.email = 'emailTest';
            mUser1.name = 'Test Name'+1;
            mUser1.username = 'Test User Name'+1;
            
            mUserListToUpdate.add(mUser1);
		//}
        MissingWebUserListCtrl.updateMissingUsers(mUserListToUpdate);
    }
    
    
    private testmethod static void getMissingUserCalloutTest(){
        
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Test.startTest();
        	MissingUserResponseModel ms = MissingUserResponseModel.getExample();
            // Call method to test.
            // This causes a fake response to be sent
            // from the class that implements HttpCalloutMock. 
            HttpResponse res = new HttpResponse();
            List<Object> sObjList = MissingWebUserListCtrl.getMissingUserCallout();
            
            // Verify response received contains fake values
            String contentType = res.getHeader('Content-Type');
            //System.assert(contentType == 'application/json');
            String actualValue = res.getBody();
            String expectedValue = '[{"id": 1,"name": "Leanne Graham","username": "Bret","email": "Sincere@april.biz","address": {"street": "Kulas Light","suite": "Apt. 556","city": "Gwenborough","zipcode": "92998-3874","geo": {"lat": "-37.3159","lng": "81.1496"}]';
            //System.assertEquals(actualValue, expectedValue);
            //System.assertEquals(200, res.getStatusCode());
        Test.stopTest();
        
    }

}
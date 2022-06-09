/*@author Ravindra Singh 
 * Test class for MissingWebUserAdapter
 * Last Update :
 * @Version 1.0
 */
@isTest
public class MissingWebUserListControllerTest {
    
    private testmethod static void updateMissingUsersPositiveTest(){
        List<MissingUserResponseModel> mUserListToUpdate = new List<MissingUserResponseModel>();
        MissingUserResponseModel mUser = new MissingUserResponseModel();
        mUser.webId = 1;
        mUser.companyName = 'companyName Test'+1;
        mUser.email = 'emailTest'+1+'@test.com';
        mUser.name = 'Test Name'+1;
        mUser.username = 'Test User Name'+1;
            
        mUserListToUpdate.add(mUser);
        MissingWebUserListController.updateMissingUsers(mUserListToUpdate);
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
        MissingWebUserListController.updateMissingUsers(mUserListToUpdate);
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
            List<Object> sObjList = MissingWebUserListController.getMissingUserCall();
            
            // Verify response received contains fake values
            String contentType = res.getHeader('Content-Type');
            //System.assert(contentType == 'application/json');
            String actualValue = res.getBody();
            String expectedValue = '[{"id": 1,"name": "Leanne Graham","username": "Bret","email": "Sincere@april.biz","address": {"street": "Kulas Light","suite": "Apt. 556","city": "Gwenborough","zipcode": "92998-3874","geo": {"lat": "-37.3159","lng": "81.1496"}},"phone": "1-770-736-8031 x56442","website": "hildegard.org","company": {"name": "Romaguera-Crona","catchPhrase": "Multi-layered client-server neural-net","bs": "harness real-time e-markets"}}]';
            System.assertEquals(actualValue, expectedValue);
            //System.assertEquals(200, res.getStatusCode());
        Test.stopTest();
        
    }

}
/*@author Ravindra Singh 
 * Test class for MissingWebUserAdapter
 * Last Update :
 * @Version 1.0
 */
@isTest
public class MissingWebUserAdapterTest {
    private testmethod static void getMissingUserServiceTest(){  
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        Test.startTest();
            HttpResponse res = new HttpResponse();
            res = MissingWebUserService.getMissingUserService();
            String contentType = res.getHeader('Content-Type');
            String actualValue = res.getBody();
            String expectedValue = '[{"id": 1,"name": "Leanne Graham","username": "Bret","email": "Sincere@april.biz","address": {"street": "Kulas Light","suite": "Apt. 556","city": "Gwenborough","zipcode": "92998-3874","geo": {"lat": "-37.3159","lng": "81.1496"}}}]';
                
            List<MissingUserResponseModel> userResponse = MissingWebUserAdapter.getMissingUser();
        	System.debug('dddd'+userResponse);
        Test.stopTest();
        
    }
    
    private testmethod static void updateMissingWebUsersPositiveTest(){
        List<MissingUserResponseModel> mUserListToUpdate = new List<MissingUserResponseModel>();
        MissingUserResponseModel mUser = new MissingUserResponseModel();
        mUser.webId = 1;
        mUser.companyName = 'companyName Test'+1;
        mUser.email = 'emailTest'+1+'@test.com';
        mUser.name = 'Test Name'+1;
        mUser.username = 'Test User Name'+1;
        Test.startTest();    
            mUserListToUpdate.add(mUser);
            MissingWebUserAdapter.updateMissingWebUsers(mUserListToUpdate);
        Test.stopTest();
    }
    
    private testmethod static void updateMissingWebUsersNegativeTest(){
        List<MissingUserResponseModel> mUserListToUpdate = new List<MissingUserResponseModel>();
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
			Test.startTest(); 
        		MissingWebUserAdapter.updateMissingWebUsers(mUserListToUpdate);
        	Test.stopTest();
    }

    
}
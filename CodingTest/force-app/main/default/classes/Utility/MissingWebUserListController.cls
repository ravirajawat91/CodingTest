/**
 * Created by jesus.cantero on 13/05/2021.
 * Updated by Ravindra Singh on 26/05/2022.
 * Controller of Lightning Component : MissingWebUserList
 * Method to get all missing users from given EndPoint.
 * Test Class : MissingUserRequestModelTest
 */

public with sharing class MissingWebUserListController {
    @AuraEnabled
    public static void updateMissingUsers(List<MissingUserResponseModel> webUserList) {
       MissingWebUserAdapter.getMissingUser();
    }
    
    @AuraEnabled
    public static List<MissingUserResponseModel> getMissingUserCall(){
        List<MissingUserResponseModel> missingUserList = new List<MissingUserResponseModel>();
        try{            
            missingUserList = MissingWebUserAdapter.getMissingUser();
        }catch(Exception e){
            System.debug('e'+e);
        }
        return missingUserList;
    }
}
/**
 * Created by Ravindra Singh on 09/06/2022.
 * Adapter class for Missing user
 * Test Class : MissingWebUserListControllerTest
 */
public class MissingWebUserAdapter {
	
    @AuraEnabled
    public static List<MissingUserResponseModel> getMissingUser(){ 
        List<MissingUserResponseModel> missingUserList = new List<MissingUserResponseModel>();
        HttpResponse response = MissingWebUserService.getMissingUserService();
    	try{            
            if(response.getStatusCode() == 200) {
                List<MissingUserResponseModel> userResponse = (List<MissingUserResponseModel>)JSON.deserialize(response.getBody().replace(MissingWebUserConstantClass.S_ID,MissingWebUserConstantClass.S_WEBID),List<MissingUserResponseModel>.Class);
                System.debug(userResponse.size());
                for(Object obj : userResponse){
                    MissingUserResponseModel mUser = (MissingUserResponseModel)obj;
                    mUser.companyName = mUser.company.get(MissingWebUserConstantClass.S_NAME);
                    missingUserList.add(mUser);
                }   
            }
        }catch(Exception e){
            System.debug('e'+e);
        }
        
        return missingUserList;
    }
    
    
    @AuraEnabled
    public static void updateMissingWebUsers(List<MissingUserResponseModel> webUserList) {
    	 try{
            List<Web_User__c> webUserListToUpdate = new List<Web_User__c>();
            for(MissingUserResponseModel m :webUserList){
                Web_User__c wUser = new Web_User__c();
                wUser.Web_Site_Id__c = String.valueOf(m.webId);
                wUser.Company__c = m.companyName;
                wUser.Email__c = m.email;
                wUser.Name = m.name;
                wUser.Username__c = m.username;
                webUserListToUpdate.add(wUser);
            }
            if(webUserListToUpdate.size()>0){
                
                Database.UpsertResult[] upList = Database.upsert(webUserListToUpdate,MissingWebUserConstantClass.FALSE_VALUE);

                // Iterate through each returned result
                for (Database.UpsertResult ur : upList) {
                    if (ur.isSuccess()) {
                        // Operation failed capturing ids in logs  
                        System.debug('Successfully inserted account. Account ID: ' + ur.getId());
                    }
                    else {
                        // Operation failed capturing error in logs                
                        for(Database.Error err : ur.getErrors()) {
                            System.debug('The following error has occurred.');                    
                            System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        }
                    }
                }                
            }
        }catch(Exception e){
            System.debug('e'+e);
        }
    }
    
}
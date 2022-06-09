/*
* Apex Data Model for JSON representation of Missing Field data
* @author Ravindra Singh
* Service End Point ""
* Test Class : : 
* @version 1.0
*/
public class MissingUserResponseModel{
    //Test class still pending 
    public class Addresses{
        @AuraEnabled
        Public String city{get; set;}
        @AuraEnabled
        public Map<String,String> geo{get; set;}
        @AuraEnabled
        Public String street{get; set;}
        @AuraEnabled
    	Public String suite{get; set;}
        @AuraEnabled
        Public String zipcode{get; set;}      
    }
    @AuraEnabled
    Public Map<String,String> company = new Map<String,String>();
    @AuraEnabled
    Public String email{get; set;}
    @AuraEnabled
    Public Integer webId{get; set;}
    @AuraEnabled
    Public String name{get; set;}
    @AuraEnabled
    Public String username{get; set;}
    @AuraEnabled
    Public String companyName{get; set;}
    @AuraEnabled
    Public String phone{get; set;}
    @AuraEnabled
    Public String website{get; set;}
    @AuraEnabled
    Public Addresses address{get; set;}
    
    

    public static MissingUserResponseModel getExample() {
        MissingUserResponseModel missingUserModel = new MissingUserResponseModel();
        missingUserModel.webId = 1;
        //To Do : remove hard coding
        missingUserModel.name='Leanne Graham';
        missingUserModel.username='Bret';
        missingUserModel.email='Sincere@april.biz';
        missingUserModel.phone='1-770-736-8031 x56442';
       	missingUserModel.website='hildegard.org';

        Addresses adr = new Addresses();
        //To Do : remove hard coding
        adr.city='Gwenborough';
        adr.street='Kulas Light';
        adr.suite='Apt. 556';
        adr.zipcode='92998-3874';
  
        missingUserModel.address = adr;
		
        //To Do : remove hard coding
        missingUserModel.company.put('name','Romaguera-Crona');
        missingUserModel.company.put('catchPhrase','Multi-layered client-server neural-net');
        missingUserModel.company.put('bs','harness real-time e-markets');
    
        return missingUserModel;
    }
}
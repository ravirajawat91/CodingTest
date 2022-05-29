/**
 * Created by jesus.cantero on 13/05/2021.
 * Updated by Ravindra Singh on 27/05/2022
 */

({
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Id', fieldName: 'webId', type: 'text'},
            {label: 'Name', fieldName: 'name', type: 'text'},
            {label: 'UserName', fieldName: 'username', type: 'text'},
            {label: 'Email', fieldName: 'email', type: 'email'},
            {label: 'Company Name', fieldName: 'companyName', type: 'text'}
        ]);
        
        var action = cmp.get("c.getMissingUserCallout");
        action.setCallback(this, function(response) {
            //helper.showSpinner();
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('response',response.getReturnValue());
                cmp.set('v.data',response.getReturnValue());
                cmp.set('v.dataToUpdate',response.getReturnValue());
                
            }
            //helper.hideSpinner();
        });
        
        // $A.enqueueAction adds the server-side action to the queue.
        $A.enqueueAction(action);
    },
    
    handleImport: function (cmp, event, helper){
        
    	var missingUserData = cmp.get('v.data');
        console.log('missingUserData',missingUserData);
        var action = cmp.get("c.updateMissingUsers");
        action.setParams({ webUserList : missingUserData });
        action.setCallback(this, function(response) {
            //helper.showSpinner();
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('response',response.getReturnValue());
                helper.showToast();
            }
            //helper.hideSpinner();
        });
        $A.enqueueAction(action);
	},
    // function automatic called by aura:waiting event  
    showSpinner: function(component, event, helper) {
        // make Spinner attribute true for displaying loading spinner 
        component.set("v.spinner", true); 
    },
     
    // function automatic called by aura:doneWaiting event 
    hideSpinner : function(component,event,helper){
        // make Spinner attribute to false for hiding loading spinner    
        component.set("v.spinner", false);
    }
});
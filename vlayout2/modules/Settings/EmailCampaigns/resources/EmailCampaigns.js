/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
jQuery.Class('Settings_EmailCampaigns_Js', {
}, {
	
	/*
	 * Function to save the Configuration Editor content
	 */
	saveConfigEditor : function(form) {
		var aDeferred = jQuery.Deferred();
		
		var data = form.serializeFormData();
		var updatedFields = {};
		jQuery.each(data, function(key, value) {
			updatedFields[key] = value;
		})
		
		var params = {
			'module' : app.getModuleName(),
			'parent' : app.getParentModuleName(),
			'action' : 'EmailCampaignDetailSaveAjax',
			'updatedFields' : JSON.stringify(updatedFields)
		}
		AppConnector.request(params).then(
			function(data) {
				aDeferred.resolve(data);
			},
			function(error,err){
				aDeferred.reject();
			}
		);
		return aDeferred.promise();
	},
	
	/*
	 * Function to load the contents from the url through pjax
	 */
	loadContents : function(url) {
		var aDeferred = jQuery.Deferred();
		AppConnector.requestPjax(url).then(
			function(data){
				aDeferred.resolve(data);
			},
			function(error, err){
				aDeferred.reject();
			}
		);
		return aDeferred.promise();
	},
	
	/*
	 * function to register the events in editView
	 */
	registerEditViewEvents : function() {
		var thisInstance = this;
		var form = jQuery('#updatedetails');
		var detailUrl = form.data('detailUrl');

		//register validation engine
		var params = app.validationEngineOptions;
		params.onValidationComplete = function(form, valid){
			if(valid) {
				var progressIndicatorElement = jQuery.progressIndicator({
					'position' : 'html',
					'blockInfo' : {
						'enabled' : true
					}
				});
				thisInstance.saveConfigEditor(form).then(
					function(data) {
						var params = {};
						if(data['success']) {
							params['text'] = 'Settings successfully Saevd';
							thisInstance.loadContents(detailUrl).then(
								function(data) {
									progressIndicatorElement.progressIndicator({'mode':'hide'});
									jQuery('.contentsDiv').html(data);
									thisInstance.registerDetailViewEvents();
								}
							);
						} else {
							progressIndicatorElement.progressIndicator({'mode':'hide'});
							params['text'] = data['error']['message'];
							params['type'] = 'error';
						}
						Settings_Vtiger_Index_Js.showMessage(params);
					},function(error, err) {
						progressIndicatorElement.progressIndicator({'mode':'hide'});
					}
				);
				return valid;
			}
		}
		form.validationEngine(params);
		
		form.submit(function(e) {
			e.preventDefault();
		})
		
		//Register click event for cancel link
		var cancelLink = form.find('.cancelLink');
		cancelLink.click(function() {
			var progressIndicatorElement = jQuery.progressIndicator({
				'position' : 'html',
				'blockInfo' : {
					'enabled' : true
				}
			});
			thisInstance.loadContents(detailUrl).then(
				function(data) {
					progressIndicatorElement.progressIndicator({'mode':'hide'})
					jQuery('.contentsDiv').html(data);
					thisInstance.registerDetailViewEvents();
				}
			);
		})
	},
	
	/*
	 * function to register the events in DetailView
	 */
	registerDetailViewEvents : function() {
		var thisInstance = this;
		var container = jQuery('#DetailEmailCampaignsSetting');
		var editButton = container.find('.editButton');
		
		//Register click event for edit button
		editButton.click(function() {
			var url = editButton.data('url');
			var progressIndicatorElement = jQuery.progressIndicator({
				'position' : 'html',
				'blockInfo' : {
					'enabled' : true
				}
			});
			thisInstance.loadContents(url).then(
				function(data) {
					progressIndicatorElement.progressIndicator({'mode':'hide'});
					jQuery('.contentsDiv').html(data);
					thisInstance.registerEditViewEvents();
				}, function(error, err) {
					progressIndicatorElement.progressIndicator({'mode':'hide'});
				}
			);
		});
	},
	
	//This will show the notification message using pnotify
	showNotify : function(customParams) {
		var params = {
			title : app.vtranslate('JS_MESSAGE'),
			text: customParams.text,
			animation: 'show',
			type: 'info'
		};
		Vtiger_Helper_Js.showPnotify(params);
	},
	
	registerEvents : function(e){
		this.registerDetailViewEvents();
		this.registerEditViewEvents();
	}
});


jQuery(document).ready(function(){
	var settingModuleManagerInstance = new Settings_EmailCampaigns_Js();
	settingModuleManagerInstance.registerEvents();
})

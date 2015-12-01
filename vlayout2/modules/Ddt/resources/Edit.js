/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

Inventory_Edit_Js("Ddt_Edit_Js",{},{

	/**
	 * Function to get popup params
	 */
	getPopUpParams : function(container) {
		var params = this._super(container);
        var sourceFieldElement = jQuery('input[class="sourceField"]',container);
		if(sourceFieldElement.attr('name') == 'ticketid' || sourceFieldElement.attr('name') == 'potentialid' || sourceFieldElement.attr('name') == 'projectid') {
			var form = this.getForm();
			var parentIdElement  = form.find('[name="relategid"]');
			if(parentIdElement.length > 0 && parentIdElement.val().length > 0) {
				var closestContainer = parentIdElement.closest('td');
				params['related_parent_id'] = parentIdElement.val();
				params['related_parent_module'] = closestContainer.find('[name="popupReferenceModule"]').val();
			}
        }
        return params;
    },

	/**
	 * Function to search module names
	 */
	searchDdts : function(params) {
		var aDeferred = jQuery.Deferred();

		if(typeof params.module == 'undefined') {
			params.module = app.getDdt();
		}
		if(typeof params.action == 'undefined') {
			params.action = 'BasicAjax';
		}

		if (params.search_module == 'HelpDesk' || params.search_module == 'Potentials' || params.search_module == 'Project') {
			var form = this.getForm();
			var parentIdElement  = form.find('[name="relategid"]');
			if(parentIdElement.length > 0 && parentIdElement.val().length > 0) {
				var closestContainer = parentIdElement.closest('td');
				params.parent_id = parentIdElement.val();
				params.parent_module = closestContainer.find('[name="popupReferenceModule"]').val();
			}
		}

		AppConnector.request(params).then(
			function(data){
				aDeferred.resolve(data);
			},
			function(error){
				aDeferred.reject();
			}
		)
		return aDeferred.promise();
	},
	
	/**
	 * Function which will register event for Reference Fields Selection
	 */
	registerReferenceSelectionEvent : function(container) {
		this._super(container);
		var thisInstance = this;
		
		jQuery('input[name="account_id"]', container).on(Vtiger_Edit_Js.referenceSelectionEvent, function(e, data){
			thisInstance.referenceSelectionEventHandler(data, container);
		});
	},
	registerQuantityChangeEventHandler : function() {
		var thisInstance = this;
		var lineItemTable = this.getLineItemContentsContainer();

		lineItemTable.on('focusout','.qty',function(e){
			var element = jQuery(e.currentTarget);
			var lineItemRow = element.closest('tr.'+thisInstance.rowClass);
			var quantityInStock = lineItemRow.data('quantityInStock');
			if(typeof quantityInStock  != 'undefined') {
				lineItemRow.find('.stockAlert').removeClass('hide').find('.maxQuantity').text(quantityInStock);
			}
			thisInstance.quantityChangeActions(lineItemRow);
		});
	 },
	
	registerEvents: function(){
		this._super();
		this.registerQuantityChangeEventHandler();
		this.registerEventForCopyAddress();
	}
});



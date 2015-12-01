/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

Inventory_Detail_Js("Ddt_Detail_Js",{
	HierarchyResponseCache : {},
	triggerHierarchy : function(HierarchyUrl) {
		Ddt_Detail_Js.getHierarchyResponseData(HierarchyUrl).then(
			function(data) {
				Ddt_Detail_Js.displayHierarchyResponseData(data);
			}
		);
	},
	getHierarchyResponseData : function(params) {
		var aDeferred = jQuery.Deferred();
		if(!(jQuery.isEmptyObject(Ddt_Detail_Js.HierarchyResponseCache))) {
			aDeferred.resolve(Ddt_Detail_Js.HierarchyResponseCache);
		} else {
			AppConnector.request(params).then(
				function(data) {
					Ddt_Detail_Js.HierarchyResponseCache = data;
					aDeferred.resolve(Ddt_Detail_Js.HierarchyResponseCache);
				}
			);
		}
		return aDeferred.promise();
	},
	displayHierarchyResponseData : function(data) {
        var callbackFunction = function(data) {
            app.showScrollBar(jQuery('#hierarchyScroll'), {
                height: '200px',
                railVisible: true,
                alwaysVisible: true,
                size: '6px'
            });
        }
        app.showModalWindow(data, function(data){
            if(typeof callbackFunction == 'function'){
                callbackFunction(data);
            }
        });
	}
},{});
